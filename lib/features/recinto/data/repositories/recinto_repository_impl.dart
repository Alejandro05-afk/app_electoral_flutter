import 'package:control_electoral/features/recinto/domain/entities/mesa_entity.dart';
import 'package:control_electoral/features/recinto/domain/repositories/recinto_repository.dart';
import '../datasources/recinto_remote_datasource.dart';

class RecintoRepositoryImpl implements RecintoRepository {
  final RecintoRemoteDatasource _datasource;

  RecintoRepositoryImpl(this._datasource);

  @override
  Future<List<MesaEntity>> getMesas(String recintoId) => _datasource.getMesas(recintoId);

  @override
  Future<void> assignVeedor(String mesaId, String veedorUserId) =>
      _datasource.assignVeedor(mesaId, veedorUserId);
}
