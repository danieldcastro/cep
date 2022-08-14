import 'package:cep/infrastructure/models/remote_error_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/cep_mock.dart';

void main() {
  group('Remote Error Model', () {
    test('Should be return a valid RemoteErrorModel fromJson', () {
      final remoteErrorModel =
          RemoteErrorModel.fromJson(CepMock.validRemoteErrorJson);

      expect(remoteErrorModel, isA<RemoteErrorModel>());
      expect(remoteErrorModel, RemoteErrorModel(error: "true"));
    });

    test('Should be return toString', () {
      final remoteErrorModel =
          RemoteErrorModel.fromJson(CepMock.validRemoteErrorJson);

      expect(remoteErrorModel.toString(), isA<String>());
      expect(remoteErrorModel.toString(),
          CepMock.validRemoteErrorModel.toString());
    });

    test('Should be return an empty RemoteErrorModel', () {
      final remoteErrorModel = RemoteErrorModel.empty();

      expect(remoteErrorModel, isA<RemoteErrorModel>());
      expect(remoteErrorModel, CepMock.emptyRemoteErrorModel);
    });

    test('Should be return an empty RemoteErrorModel when fromJson not work',
        () {
      final remoteErrorModel =
          RemoteErrorModel.fromJson(CepMock.invalidRemoteErrorJson);

      expect(remoteErrorModel, isA<RemoteErrorModel>());
      expect(remoteErrorModel, CepMock.emptyRemoteErrorModel);
    });

    test('Should be return hashCode', () {
      final remoteErrorModelHashcode = CepMock.validRemoteErrorModel.hashCode;

      expect(remoteErrorModelHashcode, isA<int>());
    });
  });
}
