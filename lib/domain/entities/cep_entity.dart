import '../../infrastructure/models/remote_cep_model.dart';

class CepEntity {
  int id;
  String cep;
  String street;
  String complement;
  String city;
  String uf;
  CepEntity({
    required this.id,
    required this.cep,
    required this.street,
    required this.complement,
    required this.city,
    required this.uf,
  });

  factory CepEntity.fromModel(RemoteCepModel model) => CepEntity(
        id: model.id ?? 0,
        cep: model.cep,
        street: model.street,
        complement: model.complement,
        city: model.city,
        uf: model.uf,
      );

  factory CepEntity.empty() => CepEntity(
        id: 0,
        cep: '',
        street: '',
        complement: '',
        city: '',
        uf: '',
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CepEntity &&
        other.id == id &&
        other.cep == cep &&
        other.street == street &&
        other.complement == complement &&
        other.city == city &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cep.hashCode ^
        street.hashCode ^
        complement.hashCode ^
        city.hashCode ^
        uf.hashCode;
  }

  @override
  String toString() {
    return 'CepEntity(id: $id, cep: $cep, street: $street, complement: $complement,  city: $city, uf: $uf)';
  }
}
