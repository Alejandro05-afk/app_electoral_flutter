import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:control_electoral/core/appwrite/appwrite_client.dart';
import 'package:control_electoral/core/network/connectivity_service.dart';
import 'package:control_electoral/core/network/sync_service.dart';
import 'package:control_electoral/core/services/gps_service.dart';
import 'package:control_electoral/core/services/sharpness_service.dart';
import 'package:control_electoral/features/auth/data/datasources/appwrite_auth_datasource.dart';
import 'package:control_electoral/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:control_electoral/features/auth/domain/repositories/auth_repository.dart';
import 'package:control_electoral/features/auth/domain/usecases/login_usecase.dart';
import 'package:control_electoral/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:control_electoral/features/auth/domain/usecases/recover_password_usecase.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/provincial/data/datasources/provincial_remote_datasource.dart';
import 'package:control_electoral/features/provincial/data/repositories/provincial_repository_impl.dart';
import 'package:control_electoral/features/provincial/domain/repositories/provincial_repository.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_recintos_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/create_recinto_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_all_mesas_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_consolidated_votes_usecase.dart';
import 'package:control_electoral/features/provincial/presentation/bloc/provincial_bloc.dart';
import 'package:control_electoral/features/recinto/data/datasources/recinto_remote_datasource.dart';
import 'package:control_electoral/features/recinto/data/repositories/recinto_repository_impl.dart';
import 'package:control_electoral/features/recinto/domain/repositories/recinto_repository.dart';
import 'package:control_electoral/features/recinto/domain/usecases/get_mesas_usecase.dart';
import 'package:control_electoral/features/recinto/presentation/bloc/recinto_bloc.dart';
import 'package:control_electoral/features/veedor/data/datasources/acta_remote_datasource.dart';
import 'package:control_electoral/features/veedor/data/datasources/acta_local_datasource.dart';
import 'package:control_electoral/features/veedor/data/repositories/acta_repository_impl.dart';
import 'package:control_electoral/features/veedor/domain/repositories/acta_repository.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_mis_mesas_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_actas_by_mesa_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_organizaciones_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/register_acta_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/update_acta_usecase.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/mesas_bloc.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/acta_bloc.dart';
import 'package:control_electoral/features/veedor/local/database.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  AppwriteModule.register(sl);

  sl.registerSingleton<ValueNotifier<int>>(ValueNotifier<int>(0));

  final database = AppDatabase();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<ConnectivityService>(ConnectivityService());
  sl.registerSingleton<GpsService>(GpsService());
  sl.registerSingleton<SharpnessService>(SharpnessService());

  // Auth
  sl.registerLazySingleton<AppwriteAuthDatasource>(
    () => AppwriteAuthDatasource(sl(), sl()));
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  sl.registerLazySingleton(() => RecoverPasswordUseCase(sl()));
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl()));

  // Provincial
  sl.registerLazySingleton<ProvincialRemoteDatasource>(
    () => ProvincialRemoteDatasource(sl(), sl()));
  sl.registerLazySingleton<ProvincialRepository>(
    () => ProvincialRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetRecintosUseCase(sl()));
  sl.registerLazySingleton(() => CreateRecintoUseCase(sl()));
  sl.registerLazySingleton(() => GetAllMesasUseCase(sl()));
  sl.registerLazySingleton(() => GetConsolidatedVotesUseCase(sl()));
  sl.registerFactory(() => ProvincialBloc(sl(), sl(), sl(), sl(), sl()));

  // Recinto
  sl.registerLazySingleton<RecintoRemoteDatasource>(
    () => RecintoRemoteDatasource(sl(), sl()));
  sl.registerLazySingleton<RecintoRepository>(
    () => RecintoRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetMesasUseCase(sl()));
  sl.registerFactory(() => RecintoBloc(sl()));

  // Veedor
  sl.registerLazySingleton<ActaRemoteDatasource>(
    () => ActaRemoteDatasource(sl(), sl()));
  sl.registerLazySingleton<ActaLocalDatasource>(
    () => ActaLocalDatasource(sl()));
  sl.registerLazySingleton<ActaRepository>(
    () => ActaRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetMisMesasUseCase(sl()));
  sl.registerLazySingleton(() => GetActasByMesaUseCase(sl()));
  sl.registerLazySingleton(() => GetOrganizacionesUseCase(sl()));
  sl.registerLazySingleton(() => RegisterActaUseCase(sl()));
  sl.registerLazySingleton(() => UpdateActaUseCase(sl()));
  sl.registerFactory(() => MesasBloc(sl()));
  sl.registerFactory(() => ActaBloc(sl(), sl()));

  // Sync
  sl.registerSingleton<SyncService>(SyncService(sl(), sl()));
}
