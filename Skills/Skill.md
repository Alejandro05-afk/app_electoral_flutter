---
name: control-electoral-appwrite-flutter
description: >
  Skill completa para el proyecto "Control Electoral para Organización Política" (Prueba 2).
  Flutter + Appwrite + Clean Architecture + Vertical Slicing + flutter_bloc + get_it.
  Cubre configuración de Appwrite, modelo de datos, todos los flujos por rol (coordinador
  provincial, coordinador de recinto, veedor de mesa), sensores (GPS + cámara + nitidez),
  y el entregable adicional de sincronización offline (Drift + conectividad automática).
  Úsala cada vez que debas generar código, tomar decisiones de arquitectura o configurar
  el backend para este proyecto.
compatibility: Flutter 3.x, Appwrite 1.5+, flutter_bloc 9.x, get_it, drift, geolocator, camera
---

# SKILL — Control Electoral · Flutter + Appwrite

## 0. Análisis del documento

### Roles del sistema
| Rol | Abreviatura usada en código |
|---|---|
| Coordinador Provincial | `provincial` |
| Coordinador de Recinto | `recinto` |
| Veedor de Mesa | `veedor` |

### Dignidades electorales
- **Alcalde** → 5 organizaciones políticas precargadas
- **Prefecto** → 5 organizaciones políticas precargadas

### Reglas de negocio críticas
1. Un recinto tiene exactamente **un** coordinador de recinto.
2. Un veedor puede cubrir **una o más** mesas (sin límite).
3. Cada JRV genera **dos actas**: alcalde y prefecto.
4. El acta guarda: votos por org, votos nulos, votos en blanco, total sufragantes.
5. `votos_org1 + votos_org2 + ... + nulos + blancos == total_sufragantes` (validación en cliente).
6. La foto del acta requiere **validación de nitidez** antes de subirse.
7. Al fotografiar, la app registra **coordenadas GPS** en el campo del acta (no en metadatos de imagen).
8. **Primer login** → cambio de contraseña obligatorio antes de acceder a cualquier pantalla.
9. Los usuarios **no** se autoregistran; la jerarquía los crea.
10. Contraseña inicial: `Ecuador2026`.

### Entregable adicional (+15 pts)
- Flujo del veedor funciona **offline** (Drift como base local).
- Sincronización automática al recuperar conectividad.
- Manejo de conflictos debe explicarse en sustentación.

---

## 1. Configuración de Appwrite (paso a paso)

### 1.1 Crear proyecto

1. Accede a tu consola Appwrite (self-hosted o cloud.appwrite.io).
2. **Create Project** → nombre: `ControlElectoral` → anota el **Project ID**.
3. En **Platforms** → **Add Platform** → **Flutter** → Bundle ID: `com.tudominio.control_electoral`.

### 1.2 Habilitar Auth

`Auth → Settings`:
- ✅ Email/Password enabled
- ❌ Desactiva todos los OAuth providers (no los necesitas)
- **Session length**: 30 días (o lo que defina tu institución)
- **Email Templates**: personaliza el de "Recovery" con el nombre del sistema.

> **Recuperación de contraseña**: usa `account.createRecovery(email, url)` de Appwrite.
> El link de recuperación lleva a una pantalla de tu app via deep link configurado.

### 1.3 Base de datos

Crea una DB llamada `electoral_db` → anota el **Database ID**.

#### Colecciones y atributos

---

**`users_profile`** (complementa los datos de Auth que Appwrite no almacena)

| Atributo | Tipo | Requerido | Notas |
|---|---|---|---|
| `user_id` | String(36) | ✅ | ID del usuario en Auth |
| `cedula` | String(20) | ✅ | Username para login (único) |
| `nombres` | String(100) | ✅ | |
| `apellidos` | String(100) | ✅ | |
| `telefono` | String(20) | ✅ | |
| `role` | String(20) | ✅ | `provincial` / `recinto` / `veedor` |
| `must_change_password` | Boolean | ✅ | `true` hasta primer cambio |
| `recinto_id` | String(36) | ❌ | Solo para rol `recinto` |
| `created_by` | String(36) | ✅ | user_id del creador |

Índices: `user_id` (unique), `cedula` (unique), `role`.

---

**`recintos`**

| Atributo | Tipo | Requerido |
|---|---|---|
| `canton` | String(100) | ✅ |
| `parroquia` | String(100) | ✅ |
| `nombre` | String(200) | ✅ |
| `num_jrv` | Integer | ✅ |
| `coordinador_id` | String(36) | ❌ (se asigna después) |
| `created_by` | String(36) | ✅ |

Índices: `coordinador_id` (unique — garantiza 1 coordinador por recinto).

---

**`mesas`** (cada fila = una JRV dentro de un recinto)

| Atributo | Tipo | Requerido | Notas |
|---|---|---|---|
| `recinto_id` | String(36) | ✅ | FK a recintos |
| `numero_mesa` | Integer | ✅ | Número de la JRV |
| `veedor_id` | String(36) | ❌ | FK a users_profile |
| `estado` | String(20) | ✅ | `pendiente` / `parcial` / `completa` |

Índices: `recinto_id`, `veedor_id`.
Estado `parcial` = tiene solo un acta; `completa` = tiene ambas.

---

**`organizaciones_politicas`**

| Atributo | Tipo | Requerido | Notas |
|---|---|---|---|
| `nombre` | String(200) | ✅ | |
| `dignidad` | String(20) | ✅ | `alcalde` / `prefecto` |
| `numero_lista` | Integer | ✅ | |
| `candidato_nombre` | String(200) | ✅ | |

> **Precarga**: inserta 5 docs con `dignidad=alcalde` y 5 con `dignidad=prefecto` desde la consola o con un script Dart antes de hacer pruebas.

---

**`actas`**

| Atributo | Tipo | Requerido | Notas |
|---|---|---|---|
| `mesa_id` | String(36) | ✅ | FK a mesas |
| `recinto_id` | String(36) | ✅ | Denormalizado para permisos |
| `dignidad` | String(20) | ✅ | `alcalde` / `prefecto` |
| `total_sufragantes` | Integer | ✅ | |
| `votos_nulos` | Integer | ✅ | |
| `votos_blancos` | Integer | ✅ | |
| `foto_file_id` | String(36) | ❌ | ID del archivo en Storage |
| `foto_bucket_id` | String(36) | ❌ | Para construir URL |
| `gps_lat` | Double | ❌ | |
| `gps_lng` | Double | ❌ | |
| `gps_accuracy` | Double | ❌ | metros |
| `registrado_por` | String(36) | ✅ | user_id del veedor |
| `sincronizado` | Boolean | ✅ default true | Para offline sync |
| `updated_at` | DateTime | ✅ | Para conflictos |

---

**`acta_votos`** (votos por organización, separados del acta)

| Atributo | Tipo | Requerido |
|---|---|---|
| `acta_id` | String(36) | ✅ |
| `organizacion_id` | String(36) | ✅ |
| `votos` | Integer | ✅ |

Índice compuesto: `acta_id` + `organizacion_id` (unique).

---

### 1.4 Permisos (Document Security)

> **IMPORTANTE**: Activa **Document Security** en cada colección para poder usar permisos a nivel de documento.

#### Permisos por colección

**`users_profile`**
- Create: `role:provincial`, `role:recinto`
- Read: propio documento = `user:USER_ID`; coordinadores pueden leer sus subordinados
- Update: `role:provincial` (todos), `role:recinto` (solo sus veedores)
- Delete: `role:provincial` únicamente

> En Appwrite los roles custom se manejan con **Labels**. Ve a `Auth → Users → [usuario] → Labels` y agrega el label `provincial`, `recinto` o `veedor`. Luego en permisos usa `label:provincial`.

**`recintos`**
- Create: `label:provincial`
- Read: `label:provincial`, `label:recinto` (solo el suyo — filtrado en query)
- Update: `label:provincial`
- Delete: ninguno

**`mesas`**
- Create: `label:provincial`, `label:recinto`
- Read: `label:provincial`, `label:recinto` (su recinto), `label:veedor` (sus mesas)
- Update: `label:provincial`, `label:recinto` (su recinto)

**`actas`**
- Create: `label:veedor`, `label:recinto`
- Read: `label:provincial`, `label:recinto` (su recinto), `label:veedor` (sus mesas)
- Update: `label:veedor` (solo sus actas), `label:recinto` (cualquier acta de su recinto), `label:provincial`

**`acta_votos`**
- Mismos permisos que `actas`

**`organizaciones_politicas`**
- Read: any (todos los roles pueden leer)
- Create/Update/Delete: solo desde consola (datos estáticos)

### 1.5 Storage (bucket para fotos de actas)

1. `Storage → Create Bucket` → nombre: `actas_fotos` → anota el **Bucket ID**.
2. Permisos del bucket:
   - Create (upload): `label:veedor`, `label:recinto`
   - Read: `label:provincial`, `label:recinto`, `label:veedor`
   - Update/Delete: `label:recinto`, `label:provincial`
3. **File size limit**: 10 MB
4. **Allowed extensions**: `jpg, jpeg, png`

### 1.6 Functions (opcional pero recomendado)

Crea una **Appwrite Function** (Node.js) llamada `create-user-hierarchy`:
- Trigger: HTTP
- Responsabilidad: crear cuenta en Auth + documento en `users_profile` + asignar label + setear `must_change_password: true`
- El cliente llama esta function en lugar de llamar directamente a Auth (así evitas exponer la API Key en el cliente)

```javascript
// create-user-hierarchy/index.js (Appwrite Function)
const { Client, Users, Databases, ID } = require('node-appwrite');

module.exports = async ({ req, res, log }) => {
  const client = new Client()
    .setEndpoint(process.env.APPWRITE_FUNCTION_API_ENDPOINT)
    .setProject(process.env.APPWRITE_FUNCTION_PROJECT_ID)
    .setKey(req.headers['x-appwrite-key']);

  const users = new Users(client);
  const db = new Databases(client);
  const body = JSON.parse(req.body);

  // 1. Crear cuenta Auth
  const user = await users.create(
    ID.unique(),
    body.email,
    body.cedula,         // phone vacío
    'Ecuador2026',
    `${body.nombres} ${body.apellidos}`
  );

  // 2. Asignar label de rol
  await users.updateLabels(user.$id, [body.role]);

  // 3. Crear perfil
  await db.createDocument(
    process.env.DB_ID,
    'users_profile',
    ID.unique(),
    {
      user_id: user.$id,
      cedula: body.cedula,
      nombres: body.nombres,
      apellidos: body.apellidos,
      telefono: body.telefono,
      role: body.role,
      must_change_password: true,
      recinto_id: body.recinto_id ?? null,
      created_by: body.created_by,
    }
  );

  return res.json({ userId: user.$id });
};
```

---

## 2. Estructura del proyecto Flutter

```
control_electoral/
├── lib/
│   ├── core/
│   │   ├── di/                    # get_it service locator
│   │   │   └── injection.dart
│   │   ├── appwrite/
│   │   │   └── appwrite_client.dart
│   │   ├── error/
│   │   │   ├── failures.dart
│   │   │   └── exceptions.dart
│   │   ├── network/
│   │   │   └── connectivity_service.dart   # Para offline sync
│   │   ├── router/
│   │   │   └── app_router.dart             # GoRouter con guards
│   │   └── theme/
│   │       └── app_theme.dart
│   │
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   │   ├── datasources/appwrite_auth_datasource.dart
│   │   │   │   └── repositories/auth_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/user_entity.dart
│   │   │   │   ├── repositories/auth_repository.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── login_usecase.dart
│   │   │   │       ├── change_password_usecase.dart
│   │   │   │       └── recover_password_usecase.dart
│   │   │   └── presentation/
│   │   │       ├── bloc/auth_bloc.dart
│   │   │       └── pages/
│   │   │           ├── login_page.dart
│   │   │           └── change_password_page.dart
│   │   │
│   │   ├── provincial/
│   │   │   ├── data/ ...
│   │   │   ├── domain/ ...
│   │   │   └── presentation/
│   │   │       └── pages/
│   │   │           ├── provincial_dashboard_page.dart
│   │   │           ├── recintos_list_page.dart
│   │   │           ├── create_recinto_page.dart
│   │   │           ├── create_coordinador_page.dart
│   │   │           └── recinto_detail_page.dart  # avance por recinto
│   │   │
│   │   ├── recinto/
│   │   │   ├── data/ ...
│   │   │   ├── domain/ ...
│   │   │   └── presentation/
│   │   │       └── pages/
│   │   │           ├── recinto_dashboard_page.dart
│   │   │           ├── mesas_list_page.dart
│   │   │           ├── create_veedor_page.dart
│   │   │           ├── assign_veedor_page.dart
│   │   │           └── mesa_detail_page.dart  # ver y corregir actas
│   │   │
│   │   └── veedor/
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   ├── acta_remote_datasource.dart
│   │       │   │   └── acta_local_datasource.dart    # Drift
│   │       │   └── repositories/acta_repository_impl.dart
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   ├── acta_entity.dart
│   │       │   │   └── voto_entity.dart
│   │       │   ├── repositories/acta_repository.dart
│   │       │   └── usecases/
│   │       │       ├── get_mis_mesas_usecase.dart
│   │       │       ├── register_acta_usecase.dart
│   │       │       ├── update_acta_usecase.dart
│   │       │       └── sync_actas_usecase.dart
│   │       ├── presentation/
│   │       │   ├── bloc/
│   │       │   │   ├── mesas_bloc.dart
│   │       │   │   └── acta_bloc.dart
│   │       │   └── pages/
│   │       │       ├── veedor_dashboard_page.dart
│   │       │       ├── mesa_detail_page.dart
│   │       │       └── register_acta_page.dart
│   │       └── local/                              # Drift
│   │           ├── database.dart
│   │           └── daos/acta_dao.dart
│   │
└── pubspec.yaml
```

---

## 3. pubspec.yaml — dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Backend
  appwrite: ^13.0.0

  # State management
  flutter_bloc: ^9.0.0
  equatable: ^2.0.6

  # DI
  get_it: ^8.0.0

  # Navigation
  go_router: ^14.0.0

  # Sensores
  geolocator: ^13.0.0
  camera: ^0.11.0
  image: ^4.2.0          # Para análisis de nitidez (Laplaciano)

  # Offline / Local DB
  drift: ^2.18.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.0
  path: ^1.9.0

  # Conectividad
  connectivity_plus: ^6.0.0

  # Utils
  permission_handler: ^11.3.0
  cached_network_image: ^3.3.0
  intl: ^0.19.0
  uuid: ^4.4.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  drift_dev: ^2.18.0
  flutter_lints: ^4.0.0
```

---

## 4. Configuración Android (AndroidManifest.xml)

```xml
<manifest ...>
  <uses-permission android:name="android.permission.INTERNET"/>
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
  <uses-permission android:name="android.permission.CAMERA"/>
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

  <application ...>
    <!-- Deep link para recuperación de contraseña -->
    <intent-filter android:autoVerify="true">
      <action android:name="android.intent.action.VIEW"/>
      <category android:name="android.intent.category.DEFAULT"/>
      <category android:name="android.intent.category.BROWSABLE"/>
      <data android:scheme="controlelectoral" android:host="recovery"/>
    </intent-filter>
  </application>
</manifest>
```

---

## 5. Core — Appwrite Client

```dart
// lib/core/appwrite/appwrite_client.dart
import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

class AppwriteConfig {
  static const endpoint = 'https://cloud.appwrite.io/v1'; // O tu endpoint self-hosted
  static const projectId = 'TU_PROJECT_ID';
  static const databaseId = 'TU_DATABASE_ID';
  static const actasBucketId = 'TU_BUCKET_ID';

  // Collection IDs
  static const usersProfileCollection = 'users_profile';
  static const recintosCollection = 'recintos';
  static const mesasCollection = 'mesas';
  static const actasCollection = 'actas';
  static const actaVotosCollection = 'acta_votos';
  static const organizacionesCollection = 'organizaciones_politicas';
}

class AppwriteModule {
  static void register(GetIt sl) {
    final client = Client()
      ..setEndpoint(AppwriteConfig.endpoint)
      ..setProject(AppwriteConfig.projectId)
      ..setSelfSigned(status: false); // true solo en dev con self-hosted sin SSL

    sl.registerSingleton<Client>(client);
    sl.registerSingleton<Account>(Account(client));
    sl.registerSingleton<Databases>(Databases(client));
    sl.registerSingleton<Storage>(Storage(client));
    sl.registerSingleton<Functions>(Functions(client));
  }
}
```

---

## 6. Feature: Auth

### 6.1 Entities y Repository (Domain)

```dart
// domain/entities/user_entity.dart
class UserEntity {
  final String id;
  final String cedula;
  final String nombres;
  final String apellidos;
  final String role; // 'provincial' | 'recinto' | 'veedor'
  final bool mustChangePassword;
  final String? recintoId;

  const UserEntity({...});
}

// domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<UserEntity> login(String cedula, String password);
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<void> recoverPassword(String email);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
}
```

### 6.2 DataSource (Data)

```dart
// data/datasources/appwrite_auth_datasource.dart
class AppwriteAuthDatasource {
  final Account _account;
  final Databases _db;

  Future<UserEntity> login(String cedula, String password) async {
    // Appwrite usa email para login; usa cedula@dominio.local como convención
    final email = '$cedula@controlelectoral.local';
    await _account.createEmailPasswordSession(email: email, password: password);

    final appwriteUser = await _account.get();
    // Obtener perfil adicional
    final docs = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.usersProfileCollection,
      queries: [Query.equal('user_id', appwriteUser.$id)],
    );
    final profile = docs.documents.first.data;

    return UserEntity(
      id: appwriteUser.$id,
      cedula: profile['cedula'],
      nombres: profile['nombres'],
      apellidos: profile['apellidos'],
      role: profile['role'],
      mustChangePassword: profile['must_change_password'] ?? false,
      recintoId: profile['recinto_id'],
    );
  }

  Future<void> changePassword(String oldPass, String newPass) async {
    await _account.updatePassword(password: newPass, oldPassword: oldPass);
    // Marcar must_change_password = false
    final user = await _account.get();
    final docs = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.usersProfileCollection,
      queries: [Query.equal('user_id', user.$id)],
    );
    await _db.updateDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.usersProfileCollection,
      documentId: docs.documents.first.$id,
      data: {'must_change_password': false},
    );
  }

  Future<void> recoverPassword(String email) async {
    await _account.createRecovery(
      email: email,
      url: 'controlelectoral://recovery',
    );
  }
}
```

### 6.3 BLoC

```dart
// presentation/bloc/auth_bloc.dart
sealed class AuthEvent {}
class LoginRequested extends AuthEvent {
  final String cedula, password;
}
class ChangePasswordRequested extends AuthEvent {
  final String oldPass, newPass;
}
class RecoverPasswordRequested extends AuthEvent {
  final String email;
}
class LogoutRequested extends AuthEvent {}

sealed class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final UserEntity user;
}
class AuthMustChangePassword extends AuthState {
  final UserEntity user;
}
class AuthUnauthenticated extends AuthState {}
class AuthError extends AuthState {
  final String message;
}
```

### 6.4 GoRouter Guard

```dart
// core/router/app_router.dart
final router = GoRouter(
  redirect: (context, state) {
    final authBloc = context.read<AuthBloc>();
    final authState = authBloc.state;

    final isLoginPage = state.matchedLocation == '/login';
    final isRecoveryPage = state.matchedLocation.startsWith('/recovery');

    if (authState is AuthUnauthenticated && !isLoginPage && !isRecoveryPage) {
      return '/login';
    }
    if (authState is AuthMustChangePassword && state.matchedLocation != '/change-password') {
      return '/change-password';
    }
    if (authState is AuthAuthenticated && isLoginPage) {
      return switch (authState.user.role) {
        'provincial' => '/provincial',
        'recinto'    => '/recinto',
        'veedor'     => '/veedor',
        _            => '/login',
      };
    }
    return null;
  },
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/change-password', builder: (_, __) => const ChangePasswordPage()),
    GoRoute(path: '/recovery', builder: (_, __) => const RecoveryLandingPage()),
    // Rutas de cada rol...
    GoRoute(path: '/provincial', builder: (_, __) => const ProvincialDashboardPage()),
    GoRoute(path: '/recinto',    builder: (_, __) => const RecintoDashboardPage()),
    GoRoute(path: '/veedor',     builder: (_, __) => const VeedorDashboardPage()),
  ],
);
```

---

## 7. Feature: Veedor — Actas

### 7.1 Validación de suma de votos

```dart
// En el BLoC o UseCase — regla de negocio crítica
bool _validateTotals({
  required int totalSufragantes,
  required List<int> votosPorOrg,
  required int votosNulos,
  required int votosBlancos,
}) {
  final suma = votosPorOrg.fold(0, (a, b) => a + b) + votosNulos + votosBlancos;
  return suma == totalSufragantes;
}
```

### 7.2 GPS — Captura de coordenadas

```dart
// lib/core/services/gps_service.dart
import 'package:geolocator/geolocator.dart';

class GpsService {
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw LocationServiceDisabledException();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionPermanentlyDeniedException();
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );
  }
}

// Excepciones propias
class LocationServiceDisabledException implements Exception {}
class LocationPermissionDeniedException implements Exception {}
class LocationPermissionPermanentlyDeniedException implements Exception {}
```

En la UI, si se lanza `LocationPermissionDeniedException`, muestra un diálogo con botón para ir a `openAppSettings()` y **bloquea continuar** hasta tener permiso.

### 7.3 Cámara + Validación de Nitidez (Laplaciano de Varianza)

```dart
// lib/core/services/sharpness_service.dart
import 'dart:io';
import 'package:image/image.dart' as img;

class SharpnessService {
  /// Umbral empírico: >= 100.0 se considera nítida para documentos A4 en foto.
  static const double _threshold = 100.0;

  /// Calcula varianza del Laplaciano sobre escala de grises.
  /// El Laplaciano detecta bordes; alta varianza = imagen nítida.
  /// Baja varianza = imagen borrosa (pocos bordes definidos).
  Future<bool> isSharp(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return false;

    final gray = img.grayscale(image);
    final laplacian = _applyLaplacian(gray);
    final variance = _variance(laplacian);

    return variance >= _threshold;
  }

  List<double> _applyLaplacian(img.Image gray) {
    // Kernel Laplaciano 3x3
    const kernel = [0, 1, 0, 1, -4, 1, 0, 1, 0];
    final result = <double>[];

    for (int y = 1; y < gray.height - 1; y++) {
      for (int x = 1; x < gray.width - 1; x++) {
        double sum = 0;
        int k = 0;
        for (int dy = -1; dy <= 1; dy++) {
          for (int dx = -1; dx <= 1; dx++) {
            final pixel = gray.getPixel(x + dx, y + dy);
            final luminance = img.getLuminance(pixel);
            sum += luminance * kernel[k++];
          }
        }
        result.add(sum);
      }
    }
    return result;
  }

  double _variance(List<double> values) {
    if (values.isEmpty) return 0;
    final mean = values.reduce((a, b) => a + b) / values.length;
    final sqDiffs = values.map((v) => (v - mean) * (v - mean));
    return sqDiffs.reduce((a, b) => a + b) / values.length;
  }
}
```

> **Para la sustentación**: El Laplaciano amplifica cambios bruscos de intensidad (bordes). Una imagen nítida tiene bordes definidos → alta varianza. Una imagen borrosa los suaviza → baja varianza. El umbral de 100.0 se calibra empíricamente para imágenes de documentos en papel.

### 7.4 Subida de foto y acta (RemoteDatasource)

```dart
Future<String> uploadActaPhoto(File photo) async {
  final inputFile = InputFile.fromPath(
    path: photo.path,
    filename: 'acta_${DateTime.now().millisecondsSinceEpoch}.jpg',
  );
  final result = await _storage.createFile(
    bucketId: AppwriteConfig.actasBucketId,
    fileId: ID.unique(),
    file: inputFile,
  );
  return result.$id; // Guardar este ID en el campo foto_file_id del acta
}

Future<void> createActa(ActaEntity acta) async {
  final actaDocId = ID.unique();
  await _db.createDocument(
    databaseId: AppwriteConfig.databaseId,
    collectionId: AppwriteConfig.actasCollection,
    documentId: actaDocId,
    data: {
      'mesa_id': acta.mesaId,
      'recinto_id': acta.recintoId,
      'dignidad': acta.dignidad,
      'total_sufragantes': acta.totalSufragantes,
      'votos_nulos': acta.votosNulos,
      'votos_blancos': acta.votosBlancos,
      'foto_file_id': acta.fotoFileId,
      'foto_bucket_id': AppwriteConfig.actasBucketId,
      'gps_lat': acta.gpsLat,
      'gps_lng': acta.gpsLng,
      'gps_accuracy': acta.gpsAccuracy,
      'registrado_por': acta.registradoPor,
      'sincronizado': true,
      'updated_at': DateTime.now().toIso8601String(),
    },
  );

  // Votos por organización
  for (final voto in acta.votos) {
    await _db.createDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.actaVotosCollection,
      documentId: ID.unique(),
      data: {
        'acta_id': actaDocId,
        'organizacion_id': voto.organizacionId,
        'votos': voto.votos,
      },
    );
  }

  // Actualizar estado de la mesa
  await _updateMesaEstado(acta.mesaId);
}
```

---

## 8. Entregable Adicional — Offline Sync (Drift)

### 8.1 Schema Drift

```dart
// lib/features/veedor/local/database.dart
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

class LocalActas extends Table {
  TextColumn get id => text()();
  TextColumn get mesaId => text()();
  TextColumn get recintoId => text()();
  TextColumn get dignidad => text()();
  IntColumn get totalSufragantes => integer()();
  IntColumn get votosNulos => integer()();
  IntColumn get votosBlancos => integer()();
  TextColumn get fotoLocalPath => text().nullable()();
  TextColumn get fotoFileId => text().nullable()();
  RealColumn get gpsLat => real().nullable()();
  RealColumn get gpsLng => real().nullable()();
  RealColumn get gpsAccuracy => real().nullable()();
  TextColumn get registradoPor => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalActaVotos extends Table {
  TextColumn get id => text()();
  TextColumn get actaId => text()();
  TextColumn get organizacionId => text()();
  IntColumn get votos => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LocalActas, LocalActaVotos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'electoral.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
```

### 8.2 Repositorio con fallback offline

```dart
// data/repositories/acta_repository_impl.dart
class ActaRepositoryImpl implements ActaRepository {
  final ActaRemoteDatasource _remote;
  final ActaLocalDatasource _local;
  final ConnectivityService _connectivity;

  @override
  Future<void> registerActa(ActaEntity acta) async {
    // Siempre guardar localmente primero
    await _local.saveActa(acta.copyWith(sincronizado: false));

    if (await _connectivity.isConnected) {
      await _syncSingleActa(acta);
    }
    // Si no hay conexión, el SyncService lo hará cuando vuelva la red
  }

  Future<void> _syncSingleActa(ActaEntity acta) async {
    try {
      if (acta.fotoLocalPath != null && acta.fotoFileId == null) {
        final fileId = await _remote.uploadActaPhoto(File(acta.fotoLocalPath!));
        acta = acta.copyWith(fotoFileId: fileId);
      }
      await _remote.createActa(acta);
      await _local.markAsSynced(acta.id);
    } catch (e) {
      // Queda pendiente para el siguiente intento
    }
  }
}
```

### 8.3 Servicio de sincronización automática

```dart
// core/network/sync_service.dart
class SyncService {
  final ActaRepository _actaRepo;
  final ConnectivityService _connectivity;
  StreamSubscription? _sub;

  void startListening() {
    _sub = _connectivity.onStatusChange.listen((connected) async {
      if (connected) await _syncPending();
    });
  }

  Future<void> _syncPending() async {
    final pending = await _actaRepo.getUnsyncedActas();
    for (final acta in pending) {
      await _actaRepo.syncActa(acta);
    }
  }

  void dispose() => _sub?.cancel();
}
```

### 8.4 Manejo de conflictos (para sustentación)

**Estrategia Last-Write-Wins con campo `updated_at`**:
- Al sincronizar, se compara el `updated_at` local con el remoto.
- Si el remoto es más reciente → no sobreescribir (el coordinador ya lo corrigió online).
- Si el local es más reciente → sobreescribir en remoto.
- El coordinador de recinto tiene prioridad en todo caso para su recinto.

```dart
Future<void> syncActa(ActaEntity localActa) async {
  final remote = await _remote.getActa(localActa.id);

  if (remote == null) {
    // No existe en backend → crear
    await _remote.createActa(localActa);
  } else if (localActa.updatedAt.isAfter(remote.updatedAt)) {
    // Local más nuevo → actualizar remoto
    await _remote.updateActa(localActa);
  }
  // Si remoto más nuevo → no hacer nada (ya tiene versión más actual)

  await _local.markAsSynced(localActa.id);
}
```

---

## 9. ConnectivityService

```dart
// core/network/connectivity_service.dart
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get onStatusChange => _connectivity.onConnectivityChanged
      .map((results) => results.any((r) => r != ConnectivityResult.none));

  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
```

---

## 10. Inyección de dependencias (get_it)

```dart
// core/di/injection.dart
final sl = GetIt.instance;

Future<void> setupDependencies() async {
  // Core
  AppwriteModule.register(sl);
  sl.registerSingleton<AppDatabase>(AppDatabase());
  sl.registerSingleton<ConnectivityService>(ConnectivityService());
  sl.registerSingleton<GpsService>(GpsService());
  sl.registerSingleton<SharpnessService>(SharpnessService());
  sl.registerSingleton<SyncService>(SyncService(sl(), sl()));

  // Auth
  sl.registerLazySingleton<AppwriteAuthDatasource>(
    () => AppwriteAuthDatasource(sl(), sl()));
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()));
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));

  // Provincial
  sl.registerLazySingleton<ProvincialRepository>(
    () => ProvincialRepositoryImpl(sl(), sl()));
  sl.registerFactory(() => ProvincialBloc(sl()));

  // Recinto
  sl.registerLazySingleton<RecintoRepository>(
    () => RecintoRepositoryImpl(sl(), sl()));
  sl.registerFactory(() => RecintoBloc(sl()));

  // Veedor
  sl.registerLazySingleton<ActaRemoteDatasource>(
    () => ActaRemoteDatasource(sl(), sl()));
  sl.registerLazySingleton<ActaLocalDatasource>(
    () => ActaLocalDatasource(sl()));
  sl.registerLazySingleton<ActaRepository>(
    () => ActaRepositoryImpl(sl(), sl(), sl()));
  sl.registerFactory(() => MesasBloc(sl()));
  sl.registerFactory(() => ActaBloc(sl(), sl(), sl()));
}
```

---

## 11. UI — Estados de carga/éxito/error (requerimiento técnico)

Cada BLoC debe tener estados explícitos. Ejemplo para ActaBloc:

```dart
sealed class ActaState extends Equatable {}
class ActaInitial extends ActaState { ... }
class ActaLoading extends ActaState { ... }
class ActaSuccess extends ActaState {
  final ActaEntity acta;
  ...
}
class ActaError extends ActaState {
  final String message;
  ...
}
```

En la UI, usar `BlocBuilder`:

```dart
BlocBuilder<ActaBloc, ActaState>(
  builder: (context, state) => switch (state) {
    ActaInitial()  => const SizedBox.shrink(),
    ActaLoading()  => const Center(child: CircularProgressIndicator()),
    ActaSuccess()  => _SuccessView(state.acta),
    ActaError()    => _ErrorView(state.message),
  },
)
```

**Nunca** dejar pantalla en blanco. Si hay error, mostrar mensaje + botón reintentar.

---

## 12. Precarga de datos en Appwrite

Ejecutar este script Dart una sola vez para precargar organizaciones y recintos demo:

```dart
// tools/seed_data.dart (correr con: dart run tools/seed_data.dart)
void main() async {
  final client = Client()
    ..setEndpoint('TU_ENDPOINT')
    ..setProject('TU_PROJECT_ID')
    ..setKey('TU_API_KEY'); // Solo en herramienta de seed, nunca en la app

  final db = Databases(client);

  // Organizaciones alcalde
  final orgsAlcalde = [
    {'nombre': 'Movimiento A', 'candidato_nombre': 'Juan Pérez', 'dignidad': 'alcalde', 'numero_lista': 1},
    {'nombre': 'Partido B',    'candidato_nombre': 'María López', 'dignidad': 'alcalde', 'numero_lista': 2},
    {'nombre': 'Alianza C',    'candidato_nombre': 'Carlos Ruiz', 'dignidad': 'alcalde', 'numero_lista': 3},
    {'nombre': 'Frente D',     'candidato_nombre': 'Ana Torres', 'dignidad': 'alcalde', 'numero_lista': 4},
    {'nombre': 'Unión E',      'candidato_nombre': 'Luis Mora',  'dignidad': 'alcalde', 'numero_lista': 5},
  ];

  // Organizaciones prefecto (igual estructura, dignidad='prefecto')
  final orgsPrefecto = [ /* ... */ ];

  for (final org in [...orgsAlcalde, ...orgsPrefecto]) {
    await db.createDocument(
      databaseId: 'TU_DB_ID',
      collectionId: 'organizaciones_politicas',
      documentId: ID.unique(),
      data: org,
    );
  }

  // Recintos de ejemplo (provincia Pichincha, Cantón Quito)
  // Crear 3-5 recintos con sus JRV
}
```

---

## 13. README mínimo requerido

```markdown
# Control Electoral

## Requisitos
- Flutter 3.x SDK
- Android Studio / VS Code
- Cuenta Appwrite o self-hosted

## Configuración
1. Copia `lib/core/appwrite/appwrite_client.dart` y reemplaza las constantes.
2. Ejecuta `flutter pub get`
3. Para offline: `dart run build_runner build --delete-conflicting-outputs`
4. Para el APK: `flutter build apk --release`

## Credenciales de prueba
| Rol | Cédula | Contraseña |
|---|---|---|
| Coordinador Provincial | 1700000001 | ProvinciaClave2026 |
| Coordinador de Recinto | 1700000002 | RecintoClave2026 |
| Veedor de Mesa | 1700000003 | VeedorClave2026 |

## Modelo de datos
Ver sección 1.3 de este skill o diagrama en /docs/modelo_datos.png
```

---

## 14. Flujo completo del veedor (checklist de implementación)

- [ ] Ver listado de mis mesas (`get_mis_mesas_usecase.dart`)
- [ ] Para cada mesa: ver qué actas faltan (alcalde / prefecto / ambas)
- [ ] Abrir formulario de registro de acta:
  - [ ] Seleccionar dignidad (alcalde / prefecto)
  - [ ] Ingresar votos por organización (5 campos)
  - [ ] Ingresar votos nulos, blancos, total sufragantes
  - [ ] Validar que suma == total_sufragantes (mostrar error inline)
  - [ ] Fotografiar acta:
    - [ ] Solicitar permiso de cámara
    - [ ] Solicitar permiso de GPS
    - [ ] Capturar foto con `camera` plugin
    - [ ] Validar nitidez con `SharpnessService`
    - [ ] Si borrosa: mostrar SnackBar de error + repetir
    - [ ] Si nítida: guardar path local
    - [ ] Capturar GPS simultáneamente
  - [ ] Guardar localmente primero (Drift)
  - [ ] Si hay conexión: subir foto + crear acta en Appwrite
  - [ ] Mostrar estado: loading → success/error
- [ ] Corrección de acta ya registrada:
  - [ ] Cargar datos actuales
  - [ ] Permitir editar votos y/o foto
  - [ ] Validar de nuevo antes de guardar

---

## 15. Notas para la sustentación

**Arquitectura Clean + Vertical Slicing**
- Cada feature es un slice independiente con sus 3 capas.
- Las capas se comunican solo por contratos (interfaces abstractas).
- El slice `veedor` no importa nada del slice `provincial`.

**Por qué flutter_bloc**
- Separación explícita de eventos, estados y lógica.
- Testeable en aislamiento.
- Los estados sealed impiden estados inválidos.

**Nitidez (Laplaciano de Varianza)**
- El Laplaciano amplifica cambios de intensidad (bordes).
- Más bordes definidos = imagen nítida = alta varianza de los valores Laplacianos.
- Umbral de 100 calibrado empíricamente para documentos A4 impresos.

**Sincronización offline**
- Estrategia Last-Write-Wins por timestamp `updated_at`.
- Conflicto principal: veedor registra offline y coordinador corrige online antes de sincronizar → el campo `updated_at` determina cuál versión prevalece.
- La foto se sube primero para obtener `fotoFileId` antes de crear el documento del acta.

**Permisos GPS denegados**
- `LocationPermission.deniedForever` → abrir ajustes del sistema con `openAppSettings()`.
- La app bloquea el flujo de fotografía hasta tener permiso (no hay workaround).