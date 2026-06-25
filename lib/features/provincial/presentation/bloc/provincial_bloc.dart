import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/provincial/domain/usecases/get_recintos_usecase.dart';
import 'package:control_electoral/features/provincial/domain/usecases/create_recinto_usecase.dart';

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
  const ProvincialLoaded({required this.recintos});
  @override
  List<Object?> get props => [recintos];
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

  ProvincialBloc(this._getRecintosUseCase, this._createRecintoUseCase)
      : super(const ProvincialInitial()) {
    on<LoadRecintos>(_onLoadRecintos);
    on<CreateRecinto>(_onCreateRecinto);
  }

  Future<void> _onLoadRecintos(LoadRecintos event, Emitter<ProvincialState> emit) async {
    emit(const ProvincialLoading());
    try {
      final recintos = await _getRecintosUseCase();
      emit(ProvincialLoaded(recintos: recintos));
    } catch (e) {
      emit(ProvincialError(message: e.toString()));
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
