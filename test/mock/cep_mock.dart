import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:cep/infrastructure/models/remote_error_model.dart';

class CepMock {
  static const String validCep = '01001000';
  static const String invalidCep = '01001999';

  static const Map<String, dynamic> validResponseJson = {
    "cep": "01001-000",
    "logradouro": "Praça da Sé",
    "complemento": "lado ímpar",
    "bairro": "Sé",
    "localidade": "São Paulo",
    "uf": "SP",
    "ibge": "3550308",
    "gia": "1004",
    "ddd": "11",
    "siafi": "7107"
  };

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

  static const Map<String, dynamic> validRemoteErrorJson = {"erro": "true"};

  static const Map<String, dynamic> invalidRemoteErrorJson = {};

  static const Map<String, dynamic> invalidCepJson = {};

  static RemoteErrorModel validRemoteErrorModel =
      RemoteErrorModel(error: 'true');

  static RemoteErrorModel emptyRemoteErrorModel = RemoteErrorModel(error: '');

  static RemoteCepModel validRemoteCepModel = RemoteCepModel(
    cep: '01001-000',
    street: 'Praça da Sé',
    complement: 'lado ímpar',
    city: 'São Paulo',
    uf: 'SP',
  );

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

  static List<CepEntity> validCepEntityList = [
    CepEntity(
        cep: '01001-000',
        street: 'Praça da Sé',
        complement: 'lado ímpar',
        city: 'São Paulo',
        uf: 'SP',
        id: 0),
    CepEntity(
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
