import '../../infrastructure/models/remote_cep_model.dart';

class CepEntity {
  String cep;
  String street;
  String complement;
  String neighborhood;
  String city;
  String uf;
  CepEntity({
    required this.cep,
    required this.street,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
  });

  factory CepEntity.fromModel(RemoteCepModel model) => CepEntity(
        cep: model.cep,
        street: model.street,
        complement: model.complement,
        neighborhood: model.neighborhood,
        city: model.city,
        uf: model.uf,
      );

  factory CepEntity.empty() => CepEntity(
        cep: '',
        street: '',
        complement: '',
        neighborhood: '',
        city: '',
        uf: '',
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CepEntity &&
        other.cep == cep &&
        other.street == street &&
        other.complement == complement &&
        other.neighborhood == neighborhood &&
        other.city == city &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        street.hashCode ^
        complement.hashCode ^
        neighborhood.hashCode ^
        city.hashCode ^
        uf.hashCode;
  }

  @override
  String toString() {
    return 'CepEntity(cep: $cep, street: $street, complement: $complement, neighborhood: $neighborhood, city: $city, uf: $uf)';
  }
}
