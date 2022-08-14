import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';

class CepMock {
  static const String validCep = '01001000';

  static const Map<String, dynamic> validCepJson = {
    'cep': '01001-000',
    'logradouro': 'Praça da Sé',
    'complemento': 'lado ímpar',
    'localidade': 'São Paulo',
    'uf': 'SP',
    'id': 1,
  };

  static const Map<String, dynamic> validLocalCepJson = {
    'cep': '01001-000',
    'street': 'Praça da Sé',
    'complement': 'lado ímpar',
    'city': 'São Paulo',
    'uf': 'SP',
  };

  static const Map<String, dynamic> invalidCepJson = {};

  static RemoteCepModel validRemoteCepModel = RemoteCepModel(
      cep: '01001-000',
      street: 'Praça da Sé',
      complement: 'lado ímpar',
      city: 'São Paulo',
      uf: 'SP',
      id: 1);

  static RemoteCepModel invalidRemoteCepModel = RemoteCepModel(
      cep: '', street: '', complement: '', city: '', uf: '', id: 0);

  static RemoteCepModel emptyRemoteCepModel = RemoteCepModel(
      cep: '', street: '', complement: '', city: '', uf: '', id: 0);

  static CepEntity validCepEntity = CepEntity(
      cep: '01001-000',
      street: 'Praça da Sé',
      complement: 'lado ímpar',
      city: 'São Paulo',
      uf: 'SP',
      id: 0);

  static List<RemoteCepModel> validRemoteCepModelList = [
    RemoteCepModel(
        cep: '01001-000',
        street: 'Praça da Sé',
        complement: 'lado ímpar',
        city: 'São Paulo',
        uf: 'SP',
        id: 0),
    RemoteCepModel(
        cep: '01001-001',
        street: 'Praça da Sé',
        complement: 'lado par',
        city: 'São Paulo',
        uf: 'SP',
        id: 1),
  ];

  static CepEntity invalidCepEntity =
      CepEntity(cep: '', street: '', complement: '', city: '', uf: '', id: 0);
  static CepEntity emptyCepEntity =
      CepEntity(cep: '', street: '', complement: '', city: '', uf: '', id: 0);
}
