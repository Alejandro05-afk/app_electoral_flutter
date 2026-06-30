import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:control_electoral/features/veedor/presentation/pages/camera_capture_page.dart';
import 'package:control_electoral/features/veedor/presentation/bloc/acta_bloc.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/entities/organizacion_entity.dart';
import 'package:control_electoral/core/error/exceptions.dart';
import 'package:control_electoral/core/services/gps_service.dart';
import 'package:control_electoral/core/services/sharpness_service.dart';
import 'package:control_electoral/core/di/injection.dart';
import 'package:control_electoral/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_organizaciones_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_actas_by_mesa_usecase.dart';
import 'package:control_electoral/features/veedor/domain/repositories/acta_repository.dart';
import 'package:geolocator/geolocator.dart' hide LocationServiceDisabledException;

class _DigitGroup {
  final letras = TextEditingController();
  final centena = TextEditingController();
  final decena = TextEditingController();
  final unidad = TextEditingController();

  _DigitGroup();

  _DigitGroup.fromValues({String letrasVal = '', int centenaVal = 0, int decenaVal = 0, int unidadVal = 0}) {
    letras.text = letrasVal;
    centena.text = centenaVal > 0 ? centenaVal.toString() : '';
    decena.text = decenaVal > 0 ? decenaVal.toString() : '';
    unidad.text = unidadVal > 0 ? unidadVal.toString() : '';
  }

  int get total => _parse(centena.text) * 100 + _parse(decena.text) * 10 + _parse(unidad.text);

  static int _parse(String v) => int.tryParse(v) ?? 0;

  void dispose() {
    letras.dispose();
    centena.dispose();
    decena.dispose();
    unidad.dispose();
  }
}

class RegisterActaPage extends StatefulWidget {
  final String mesaId;
  final String dignidad;
  final ActaEntity? acta;

  const RegisterActaPage({
    super.key,
    required this.mesaId,
    required this.dignidad,
    this.acta,
    String? recintoId,
  }) : _recintoId = recintoId;

  final String? _recintoId;

  @override
  State<RegisterActaPage> createState() => _RegisterActaPageState();
}

class _RegisterActaPageState extends State<RegisterActaPage> {
  final _formKey = GlobalKey<FormState>();  final _totalSufragantes = _DigitGroup();
  final _votosBlancos = _DigitGroup();
  final _votosNulos = _DigitGroup();

  List<OrganizacionEntity> _organizaciones = [];
  final List<_DigitGroup> _votosCandidato = [];
  File? _photoFile;
  String? _photoPath;
  double? _gpsLat;
  double? _gpsLng;
  double? _gpsAccuracy;
  bool _capturingPhoto = false;
  bool _loadingOrgs = true;
  bool _photoSharp = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.acta != null;
    _loadOrganizaciones();
  }

  Future<void> _loadOrganizaciones() async {
    setState(() => _loadingOrgs = true);
    try {
      final orgs = await sl<GetOrganizacionesUseCase>()(widget.dignidad);
      if (mounted) {
        setState(() {
          _organizaciones = orgs;
          for (final g in _votosCandidato) { g.dispose(); }
          _votosCandidato.clear();
          for (final _ in orgs) {
            _votosCandidato.add(_DigitGroup());
          }
          if (_isEditing) {
            _prepopulateForm();
          }
        });
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingOrgs = false);
  }

  void _prepopulateForm() {
    final acta = widget.acta!;
    _totalSufragantes.letras.text = acta.totalSufragantesLetras;
    _totalSufragantes.centena.text = acta.totalSufragantesCentena > 0 ? acta.totalSufragantesCentena.toString() : '';
    _totalSufragantes.decena.text = acta.totalSufragantesDecena > 0 ? acta.totalSufragantesDecena.toString() : '';
    _totalSufragantes.unidad.text = acta.totalSufragantesUnidad > 0 ? acta.totalSufragantesUnidad.toString() : '';
    _votosBlancos.letras.text = acta.votosBlancosLetras;
    _votosBlancos.centena.text = acta.votosBlancosCentena > 0 ? acta.votosBlancosCentena.toString() : '';
    _votosBlancos.decena.text = acta.votosBlancosDecena > 0 ? acta.votosBlancosDecena.toString() : '';
    _votosBlancos.unidad.text = acta.votosBlancosUnidad > 0 ? acta.votosBlancosUnidad.toString() : '';
    _votosNulos.letras.text = acta.votosNulosLetras;
    _votosNulos.centena.text = acta.votosNulosCentena > 0 ? acta.votosNulosCentena.toString() : '';
    _votosNulos.decena.text = acta.votosNulosDecena > 0 ? acta.votosNulosDecena.toString() : '';
    _votosNulos.unidad.text = acta.votosNulosUnidad > 0 ? acta.votosNulosUnidad.toString() : '';
    _gpsLat = acta.gpsLat;
    _gpsLng = acta.gpsLng;
    _gpsAccuracy = acta.gpsAccuracy;
    _photoPath = acta.fotoLocalPath;
    if (acta.fotoLocalPath != null) {
      _photoFile = File(acta.fotoLocalPath!);
      _photoSharp = true;
    }
    for (int i = 0; i < _organizaciones.length; i++) {
      final voto = acta.votos.where((v) => v.organizacionId == _organizaciones[i].id).firstOrNull;
      if (voto != null) {
        _votosCandidato[i].letras.text = voto.votosLetras;
        _votosCandidato[i].centena.text = voto.votosCentena > 0 ? voto.votosCentena.toString() : '';
        _votosCandidato[i].decena.text = voto.votosDecena > 0 ? voto.votosDecena.toString() : '';
        _votosCandidato[i].unidad.text = voto.votosUnidad > 0 ? voto.votosUnidad.toString() : '';
      }
    }
  }

  @override
  void dispose() {
    _totalSufragantes.dispose();
    _votosBlancos.dispose();
    _votosNulos.dispose();
    for (final g in _votosCandidato) { g.dispose(); }
    super.dispose();
  }

  Future<void> _captureGps() async {
    try {
      final position = await sl<GpsService>().getCurrentPosition();
      if (mounted) {
        setState(() {
          _gpsLat = position.latitude;
          _gpsLng = position.longitude;
          _gpsAccuracy = position.accuracy;
        });
      }
    } catch (e) {
      if (mounted) {
        if (e is LocationPermissionPermanentlyDeniedException) {
          final shouldOpen = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: const Text('Permiso de ubicación requerido'),
              content: const Text(
                'El permiso de ubicación fue denegado permanentemente. '
                'Ve a Ajustes para concederlo.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: const Text('Cancelar'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(true),
                  child: const Text('Ir a Ajustes'),
                ),
              ],
            ),
          );
          if (shouldOpen == true) {
            await Geolocator.openAppSettings();
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error GPS: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<void> _takePhoto() async {
    setState(() => _capturingPhoto = true);
    try {
      final result = await Navigator.push<File>(
        context,
        MaterialPageRoute(builder: (_) => const CameraCapturePage()),
      );
      if (result != null && mounted) {
        setState(() {
          _photoFile = result;
          _photoPath = result.path;
        });
        if (_gpsLat == null) {
          await _captureGps();
        }
        final isSharp = await sl<SharpnessService>().isSharp(result);
        if (mounted) {
          setState(() => _photoSharp = isSharp);
          if (!isSharp) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('La foto no es nítida. Toma otra foto más clara.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al capturar foto: $e'), backgroundColor: Colors.red),
        );
      }
    }
    if (mounted) setState(() => _capturingPhoto = false);
  }

  bool _validateTotals() {
    final total = _totalSufragantes.total;
    for (int i = 0; i < _votosCandidato.length; i++) {
      if (_votosCandidato[i].total > total) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Votos de ${_organizaciones[i].nombre} no pueden exceder el total de sufragantes ($total)'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    }
    final sumaVotos = _votosCandidato.fold(0, (a, b) => a + b.total) +
        _votosBlancos.total + _votosNulos.total;
    return sumaVotos == total;
  }

  Future<void> _checkAndCompleteMesa() async {
    try {
      final actas = await sl<GetActasByMesaUseCase>()(widget.mesaId);
      if (actas.length >= 2) {
        await sl<ActaRepository>().updateMesaEstado(widget.mesaId, 'completo');
      } else if (actas.length == 1) {
        await sl<ActaRepository>().updateMesaEstado(widget.mesaId, 'parcial');
      }
    } catch (_) {}
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_validateTotals()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La suma de votos no coincide con el total de sufragantes'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_photoFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes tomar una foto del acta'), backgroundColor: Colors.red),
      );
      return;
    }
    if (!_photoSharp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La foto no es nítida. Toma otra.'), backgroundColor: Colors.red),
      );
      return;
    }
    if (_gpsLat == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes capturar la ubicación GPS'), backgroundColor: Colors.red),
      );
      return;
    }

    final authState = context.read<AuthBloc>().state;
    final user = authState is AuthAuthenticated ? authState.user : null;
    if (user == null) return;

    final recintoId = widget._recintoId ?? user.recintoId ?? '';

    final votos = <VotoEntity>[];
    for (int i = 0; i < _organizaciones.length; i++) {
      final existingVoto = _isEditing
          ? widget.acta!.votos.where((v) => v.organizacionId == _organizaciones[i].id).firstOrNull
          : null;
      final g = _votosCandidato[i];
      votos.add(VotoEntity(
        id: existingVoto?.id ?? const Uuid().v4(),
        actaId: _isEditing ? widget.acta!.id : '',
        organizacionId: _organizaciones[i].id,
        votos: g.total,
        votosLetras: g.letras.text,
        votosCentena: _DigitGroup._parse(g.centena.text),
        votosDecena: _DigitGroup._parse(g.decena.text),
        votosUnidad: _DigitGroup._parse(g.unidad.text),
      ));
    }

    final acta = ActaEntity(
      id: _isEditing ? widget.acta!.id : const Uuid().v4(),
      mesaId: widget.mesaId,
      recintoId: recintoId,
      dignidad: widget.dignidad,
      totalSufragantesLetras: _totalSufragantes.letras.text,
      totalSufragantesCentena: _DigitGroup._parse(_totalSufragantes.centena.text),
      totalSufragantesDecena: _DigitGroup._parse(_totalSufragantes.decena.text),
      totalSufragantesUnidad: _DigitGroup._parse(_totalSufragantes.unidad.text),
      votosBlancosLetras: _votosBlancos.letras.text,
      votosBlancosCentena: _DigitGroup._parse(_votosBlancos.centena.text),
      votosBlancosDecena: _DigitGroup._parse(_votosBlancos.decena.text),
      votosBlancosUnidad: _DigitGroup._parse(_votosBlancos.unidad.text),
      votosNulosLetras: _votosNulos.letras.text,
      votosNulosCentena: _DigitGroup._parse(_votosNulos.centena.text),
      votosNulosDecena: _DigitGroup._parse(_votosNulos.decena.text),
      votosNulosUnidad: _DigitGroup._parse(_votosNulos.unidad.text),
      gpsLat: _gpsLat,
      gpsLng: _gpsLng,
      gpsAccuracy: _gpsAccuracy,
      registradoPor: user.id,
      updatedAt: DateTime.now(),
      fotoLocalPath: _photoPath,
      votos: votos,
    );

    if (_isEditing) {
      context.read<ActaBloc>().add(UpdateActa(acta: acta));
    } else {
      context.read<ActaBloc>().add(RegisterActa(acta: acta));
    }
  }

  Widget _buildDigitField(String label, TextEditingController ctrl) {
    return SizedBox(
      width: 52,
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(labelText: label, isDense: true),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [],
        validator: (v) {
          if (v != null && v.isNotEmpty) {
            final n = int.tryParse(v);
            if (n == null || n < 0 || n > 9) return '0-9';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNumberSection(String title, _DigitGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 4),
        TextFormField(
          controller: group.letras,
          decoration: const InputDecoration(labelText: 'Letras', isDense: true),
          textCapitalization: TextCapitalization.characters,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildDigitField('C', group.centena),
            const SizedBox(width: 8),
            _buildDigitField('D', group.decena),
            const SizedBox(width: 8),
            _buildDigitField('U', group.unidad),
            const SizedBox(width: 12),
            Text('= ${group.total}', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final dignidadLabel = widget.dignidad == 'alcalde' ? 'Alcalde' : 'Prefecto';
    final title = _isEditing ? 'Editar Acta $dignidadLabel' : 'Acta $dignidadLabel';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocConsumer<ActaBloc, ActaState>(
        listener: (context, state) {
          if (state is ActaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
          if (state is ActaSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_isEditing ? 'Acta actualizada exitosamente' : 'Acta registrada exitosamente'),
                backgroundColor: Colors.green,
              ),
            );
            _checkAndCompleteMesa();
            context.pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_loadingOrgs)
                    const Center(child: CircularProgressIndicator())
                  else ...[


                    // === TOTAL SUFRAGANTES ===
                    _buildNumberSection('Total Sufragantes', _totalSufragantes),
                    const SizedBox(height: 16),
                    const Divider(),

                    // === VOTOS BLANCOS ===
                    _buildNumberSection('Votos Blancos', _votosBlancos),
                    const SizedBox(height: 16),
                    const Divider(),

                    // === VOTOS NULOS ===
                    _buildNumberSection('Votos Nulos', _votosNulos),
                    const SizedBox(height: 16),
                    const Divider(),

                    // === VOTOS POR CANDIDATO ===
                    Text('Votos por Organización ($dignidadLabel)',
                      style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    for (int i = 0; i < _organizaciones.length; i++) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lista ${_organizaciones[i].numeroLista} — ${_organizaciones[i].nombre}',
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(_organizaciones[i].candidatoNombre,
                              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            const SizedBox(height: 8),
                            _buildNumberSection('Votos', _votosCandidato[i]),
                          ],
                        ),
                      ),
                    ],

                    const Divider(),
                    const SizedBox(height: 8),



                    // === FOTOGRAFÍA ===
                    Text('Fotografía del Acta', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: _capturingPhoto ? null : _takePhoto,
                      icon: _capturingPhoto
                          ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : Icon(_photoFile != null ? Icons.camera_alt : Icons.camera),
                      label: Text(_photoFile != null
                          ? (_photoSharp ? 'Foto válida (nítida)' : 'Foto borrosa - tomar otra')
                          : 'Tomar foto del acta'),
                    ),
                    if (_photoFile != null) ...[
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(_photoFile!, height: 150, fit: BoxFit.cover),
                      ),
                      if (!_photoSharp)
                        Text('La imagen no es nítida. Toma una foto más clara.',
                          style: TextStyle(color: Colors.red[700], fontSize: 12)),
                    ],
                    const SizedBox(height: 24),

                    // === BOTÓN GUARDAR ===
                    ElevatedButton.icon(
                      onPressed: state is ActaLoading ? null : _submit,
                      icon: state is ActaLoading
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.save),
                      label: Text(state is ActaLoading ? 'Guardando...' : (_isEditing ? 'Actualizar Acta' : 'Guardar Acta')),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
