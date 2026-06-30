import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import '../repositories/provincial_repository.dart';

class GetAllMesasUseCase {
  final ProvincialRepository _repository;
  GetAllMesasUseCase(this._repository);
  Future<List<MesaEntity>> call() => _repository.getAllMesas();
}
