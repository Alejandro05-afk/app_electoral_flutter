import '../entities/voto_consolidado_entity.dart';
import '../repositories/provincial_repository.dart';

class GetConsolidatedVotesUseCase {
  final ProvincialRepository _repository;

  GetConsolidatedVotesUseCase(this._repository);

  Future<List<ConsolidadoDignidad>> call({
    Map<String, String> recintoNombres = const {},
    Map<String, (String, int, String)> orgInfo = const {},
  }) async {
    final actas = await _repository.getAllActas();
    final dignidades = <String>{};
    for (final a in actas) {
      dignidades.add(a.dignidad);
    }

    return dignidades.map((dignidad) {
      final actasDignidad = actas.where((a) => a.dignidad == dignidad).toList();

      final orgIds = <String>{};
      for (final a in actasDignidad) {
        for (final v in a.votos) {
          orgIds.add(v.organizacionId);
        }
      }

      final general = orgIds.map((orgId) {
        final totalVotos = actasDignidad
            .expand((a) => a.votos)
            .where((v) => v.organizacionId == orgId)
            .fold(0, (sum, v) => sum + v.votos);
        final info = orgInfo[orgId];
        return VotoConsolidado(
          organizacionId: orgId,
          organizacionNombre: info?.$1 ?? '',
          numeroLista: info?.$2 ?? 0,
          candidatoNombre: info?.$3 ?? '',
          totalVotos: totalVotos,
        );
      }).toList()
        ..sort((a, b) => b.totalVotos.compareTo(a.totalVotos));

      final recintoIds = <String>{};
      for (final a in actasDignidad) {
        recintoIds.add(a.recintoId);
      }

      final porRecinto = recintoIds.map((recintoId) {
        final actasRecinto = actasDignidad.where((a) => a.recintoId == recintoId).toList();
        final votos = orgIds.map((orgId) {
          final totalVotos = actasRecinto
              .expand((a) => a.votos)
              .where((v) => v.organizacionId == orgId)
              .fold(0, (sum, v) => sum + v.votos);
          final info = orgInfo[orgId];
          return VotoConsolidado(
            organizacionId: orgId,
            organizacionNombre: info?.$1 ?? '',
            numeroLista: info?.$2 ?? 0,
            candidatoNombre: info?.$3 ?? '',
            totalVotos: totalVotos,
          );
        }).toList()
          ..sort((a, b) => b.totalVotos.compareTo(a.totalVotos));

        return ConsolidadoRecinto(
          recintoId: recintoId,
          recintoNombre: recintoNombres[recintoId] ?? recintoId,
          votos: votos,
        );
      }).toList()
        ..sort((a, b) => a.recintoNombre.compareTo(b.recintoNombre));

      return ConsolidadoDignidad(
        dignidad: dignidad,
        general: general,
        porRecinto: porRecinto,
      );
    }).toList()
      ..sort((a, b) => a.dignidad.compareTo(b.dignidad));
  }
}
