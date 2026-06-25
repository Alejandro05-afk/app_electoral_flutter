import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/recinto/domain/usecases/get_mesas_usecase.dart';

sealed class RecintoEvent extends Equatable {
  const RecintoEvent();
  @override
  List<Object?> get props => [];
}

class LoadMesas extends RecintoEvent {
  final String recintoId;
  const LoadMesas({required this.recintoId});
  @override
  List<Object?> get props => [recintoId];
}

sealed class RecintoState extends Equatable {
  const RecintoState();
  @override
  List<Object?> get props => [];
}

class RecintoInitial extends RecintoState {
  const RecintoInitial();
}

class RecintoLoading extends RecintoState {
  const RecintoLoading();
}

class RecintoLoaded extends RecintoState {
  final List<MesaEntity> mesas;
  const RecintoLoaded({required this.mesas});
  @override
  List<Object?> get props => [mesas];
}

class RecintoError extends RecintoState {
  final String message;
  const RecintoError({required this.message});
  @override
  List<Object?> get props => [message];
}

class RecintoBloc extends Bloc<RecintoEvent, RecintoState> {
  final GetMesasUseCase _getMesasUseCase;

  RecintoBloc(this._getMesasUseCase) : super(const RecintoInitial()) {
    on<LoadMesas>(_onLoadMesas);
  }

  Future<void> _onLoadMesas(LoadMesas event, Emitter<RecintoState> emit) async {
    emit(const RecintoLoading());
    try {
      final mesas = await _getMesasUseCase(event.recintoId);
      emit(RecintoLoaded(mesas: mesas));
    } catch (e) {
      emit(RecintoError(message: e.toString()));
    }
  }
}
