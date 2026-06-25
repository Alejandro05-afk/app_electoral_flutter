import '../entities/recinto_entity.dart';
import '../repositories/provincial_repository.dart';

class CreateRecintoUseCase {
  final ProvincialRepository _repository;
  CreateRecintoUseCase(this._repository);
  Future<void> call(RecintoEntity recinto) => _repository.createRecinto(recinto);
}
