import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/veedor/domain/entities/acta_entity.dart';
import 'package:control_electoral/features/veedor/domain/usecases/register_acta_usecase.dart';
import 'package:control_electoral/features/veedor/domain/usecases/update_acta_usecase.dart';

sealed class ActaEvent extends Equatable {
  const ActaEvent();
  @override
  List<Object?> get props => [];
}

class RegisterActa extends ActaEvent {
  final ActaEntity acta;
  const RegisterActa({required this.acta});
  @override
  List<Object?> get props => [acta];
}

class UpdateActa extends ActaEvent {
  final ActaEntity acta;
  const UpdateActa({required this.acta});
  @override
  List<Object?> get props => [acta];
}

sealed class ActaState extends Equatable {
  const ActaState();
  @override
  List<Object?> get props => [];
}

class ActaInitial extends ActaState {
  const ActaInitial();
}

class ActaLoading extends ActaState {
  const ActaLoading();
}

class ActaSuccess extends ActaState {
  final ActaEntity acta;
  const ActaSuccess({required this.acta});
  @override
  List<Object?> get props => [acta];
}

class ActaError extends ActaState {
  final String message;
  const ActaError({required this.message});
  @override
  List<Object?> get props => [message];
}

class ActaBloc extends Bloc<ActaEvent, ActaState> {
  final RegisterActaUseCase _registerActaUseCase;
  final UpdateActaUseCase _updateActaUseCase;

  ActaBloc(this._registerActaUseCase, this._updateActaUseCase)
      : super(const ActaInitial()) {
    on<RegisterActa>(_onRegisterActa);
    on<UpdateActa>(_onUpdateActa);
  }

  Future<void> _onRegisterActa(RegisterActa event, Emitter<ActaState> emit) async {
    emit(const ActaLoading());
    try {
      await _registerActaUseCase(event.acta);
      emit(ActaSuccess(acta: event.acta));
    } catch (e) {
      emit(ActaError(message: e.toString()));
    }
  }

  Future<void> _onUpdateActa(UpdateActa event, Emitter<ActaState> emit) async {
    emit(const ActaLoading());
    try {
      await _updateActaUseCase(event.acta);
      emit(ActaSuccess(acta: event.acta));
    } catch (e) {
      emit(ActaError(message: e.toString()));
    }
  }
}
