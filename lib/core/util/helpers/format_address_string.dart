import '../../../domain/entities/cep_entity.dart';

class FormatAddressString {
  static String formatByCepEntity(CepEntity cepEntity) {
    return cepEntity.complement.isNotEmpty
        ? '${cepEntity.street} - ${cepEntity.complement} - ${cepEntity.city} ${cepEntity.uf} - CEP ${cepEntity.cep}'
        : '${cepEntity.street} - ${cepEntity.city} ${cepEntity.uf} - CEP ${cepEntity.cep}';
  }
}
