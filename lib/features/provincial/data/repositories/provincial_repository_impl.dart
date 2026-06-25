import 'package:control_electoral/features/provincial/domain/entities/recinto_entity.dart';
import 'package:control_electoral/features/provincial/domain/repositories/provincial_repository.dart';
import '../datasources/provincial_remote_datasource.dart';

class ProvincialRepositoryImpl implements ProvincialRepository {
  final ProvincialRemoteDatasource _datasource;

  ProvincialRepositoryImpl(this._datasource);

  @override
  Future<List<RecintoEntity>> getRecintos() => _datasource.getRecintos();

  @override
  Future<void> createRecinto(RecintoEntity recinto) => _datasource.createRecinto(recinto);

  @override
  Future<void> assignCoordinador(String recintoId, String coordinadorUserId) =>
      _datasource.assignCoordinador(recintoId, coordinadorUserId);
}
