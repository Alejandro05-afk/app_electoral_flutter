import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/provincial/domain/entities/voto_consolidado_entity.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_recintos_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/create_recinto_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_all_mesas_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_consolidated_votes_usecase.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_organizaciones_usecase.dart';

sealed class ProvincialEvent extends Equatable {
  const ProvincialEvent();
  @override
  List<Object?> get props => [];
}

class LoadRecintos extends ProvincialEvent {
  const LoadRecintos();
}

class CreateRecinto extends ProvincialEvent {
  final RecintoEntity recinto;
  const CreateRecinto({required this.recinto});
  @override
  List<Object?> get props => [recinto];
}

sealed class ProvincialState extends Equatable {
  const ProvincialState();
  @override
  List<Object?> get props => [];
}

class ProvincialInitial extends ProvincialState {
  const ProvincialInitial();
}

class ProvincialLoading extends ProvincialState {
  const ProvincialLoading();
}

class ProvincialLoaded extends ProvincialState {
  final List<RecintoEntity> recintos;
  final int totalMesas;
  final int completas;
  final int parciales;
  final int pendientes;
  final List<ConsolidadoDignidad> consolidado;
  final bool loadingConsolidado;
  const ProvincialLoaded({
    required this.recintos,
    this.totalMesas = 0,
    this.completas = 0,
    this.parciales = 0,
    this.pendientes = 0,
    this.consolidado = const [],
    this.loadingConsolidado = false,
  });
  @override
  List<Object?> get props => [recintos, totalMesas, completas, parciales, pendientes, consolidado, loadingConsolidado];
}

class ProvincialError extends ProvincialState {
  final String message;
  const ProvincialError({required this.message});
  @override
  List<Object?> get props => [message];
}

class ProvincialBloc extends Bloc<ProvincialEvent, ProvincialState> {
  final GetRecintosUseCase _getRecintosUseCase;
  final CreateRecintoUseCase _createRecintoUseCase;
  final GetAllMesasUseCase _getAllMesasUseCase;
  final GetConsolidatedVotesUseCase _getConsolidatedVotesUseCase;
  final GetOrganizacionesUseCase _getOrganizacionesUseCase;

  ProvincialBloc(
    this._getRecintosUseCase,
    this._createRecintoUseCase,
    this._getAllMesasUseCase,
    this._getConsolidatedVotesUseCase,
    this._getOrganizacionesUseCase,
  ) : super(const ProvincialInitial()) {
    on<LoadRecintos>(_onLoadRecintos);
    on<CreateRecinto>(_onCreateRecinto);
  }

  Future<void> _onLoadRecintos(LoadRecintos event, Emitter<ProvincialState> emit) async {
    emit(const ProvincialLoading());
    try {
      final results = await Future.wait([
        _getRecintosUseCase(),
        _getAllMesasUseCase(),
      ]);
      final recintos = results[0] as List<RecintoEntity>;
      final mesas = results[1] as List<MesaEntity>;
      final totalMesas = mesas.length;
      final completas = mesas.where((m) => m.estado == 'completo').length;
      final parciales = mesas.where((m) => m.estado == 'parcial').length;
      final pendientes = mesas.where((m) => m.estado == 'pendiente').length;

      emit(ProvincialLoaded(
        recintos: recintos,
        totalMesas: totalMesas,
        completas: completas,
        parciales: parciales,
        pendientes: pendientes,
        loadingConsolidado: true,
      ));

      await _loadConsolidado(recintos, emit);
    } catch (e) {
      emit(ProvincialError(message: e.toString()));
    }
  }

  Future<void> _loadConsolidado(List<RecintoEntity> recintos, Emitter<ProvincialState> emit) async {
    try {
      final recintoNombres = {for (final r in recintos) r.id: r.nombre};

      final orgs = await _getOrganizacionesUseCase('alcalde');
      final orgsPrefe = await _getOrganizacionesUseCase('prefecto');
      final allOrgs = [...orgs, ...orgsPrefe];
      final orgInfo = {for (final o in allOrgs) o.id: (o.nombre, o.numeroLista, o.candidatoNombre)};

      final consolidado = await _getConsolidatedVotesUseCase(
        recintoNombres: recintoNombres,
        orgInfo: orgInfo,
      );

      final current = state;
      if (current is ProvincialLoaded) {
        emit(_copyLoaded(current, consolidado: consolidado, loadingConsolidado: false));
      }
    } catch (_) {
      final current = state;
      if (current is ProvincialLoaded) {
        emit(_copyLoaded(current, loadingConsolidado: false));
      }
    }
  }

  Future<void> _onCreateRecinto(CreateRecinto event, Emitter<ProvincialState> emit) async {
    emit(const ProvincialLoading());
    try {
      await _createRecintoUseCase(event.recinto);
      add(const LoadRecintos());
    } catch (e) {
      emit(ProvincialError(message: e.toString()));
    }
  }
}

ProvincialLoaded _copyLoaded(
  ProvincialLoaded original, {
  List<ConsolidadoDignidad>? consolidado,
  bool? loadingConsolidado,
}) {
  return ProvincialLoaded(
    recintos: original.recintos,
    totalMesas: original.totalMesas,
    completas: original.completas,
    parciales: original.parciales,
    pendientes: original.pendientes,
    consolidado: consolidado ?? original.consolidado,
    loadingConsolidado: loadingConsolidado ?? original.loadingConsolidado,
  );
}
