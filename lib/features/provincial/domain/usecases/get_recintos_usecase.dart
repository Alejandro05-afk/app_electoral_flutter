import '../entities/recinto_entity.dart';
import '../repositories/provincial_repository.dart';

class GetRecintosUseCase {
  final ProvincialRepository _repository;
  GetRecintosUseCase(this._repository);
  Future<List<RecintoEntity>> call() => _repository.getRecintos();
}
