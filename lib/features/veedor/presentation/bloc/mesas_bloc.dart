import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/usecases/get_mis_actas_usecase.dart';

sealed class MesasEvent extends Equatable {
  const MesasEvent();
  @override
  List<Object?> get props => [];
}

class LoadMisMesas extends MesasEvent {
  final String userId;
  const LoadMisMesas({required this.userId});
  @override
  List<Object?> get props => [userId];
}

sealed class MesasState extends Equatable {
  const MesasState();
  @override
  List<Object?> get props => [];
}

class MesasInitial extends MesasState {
  const MesasInitial();
}

class MesasLoading extends MesasState {
  const MesasLoading();
}

class MesasLoaded extends MesasState {
  final List<ActaEntity> actas;
  const MesasLoaded({required this.actas});
  @override
  List<Object?> get props => [actas];
}

class MesasError extends MesasState {
  final String message;
  const MesasError({required this.message});
  @override
  List<Object?> get props => [message];
}

class MesasBloc extends Bloc<MesasEvent, MesasState> {
  final GetMisActasUseCase _getMisActasUseCase;

  MesasBloc(this._getMisActasUseCase) : super(const MesasInitial()) {
    on<LoadMisMesas>(_onLoadMisMesas);
  }

  Future<void> _onLoadMisMesas(LoadMisMesas event, Emitter<MesasState> emit) async {
    emit(const MesasLoading());
    try {
      final actas = await _getMisActasUseCase(event.userId);
      emit(MesasLoaded(actas: actas));
    } catch (e) {
      emit(MesasError(message: e.toString()));
    }
  }
}
