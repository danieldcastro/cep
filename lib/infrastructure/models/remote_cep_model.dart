import 'package:cep/core/util/global_validation_map_function.dart';

class RemoteCepModel {
  String cep;
  String street;
  String complement;
  String neighborhood;
  String city;
  String uf;
  RemoteCepModel({
    required this.cep,
    required this.street,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
  });

  factory RemoteCepModel.fromJson(Map<String, dynamic> json) =>
      GlobalValidationMapFunction.checkMap(
        keys: [
          'cep',
          'logradouro',
          'complemento',
          'bairro',
          'localidade',
          'uf',
        ],
        map: json,
        className: 'RemoteCepModel',
      )
          ? RemoteCepModel(
              cep: json["cep"] as String,
              street: json["logradouro"] as String,
              complement: json["complemento"] as String,
              neighborhood: json["bairro"] as String,
              city: json["localidade"] as String,
              uf: json["uf"] as String,
            )
          : RemoteCepModel.empty();

  factory RemoteCepModel.empty() => RemoteCepModel(
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

    return other is RemoteCepModel &&
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
    return 'RemoteCepModel(cep: $cep, street: $street, complement: $complement, neighborhood: $neighborhood, city: $city, uf: $uf)';
  }
}
