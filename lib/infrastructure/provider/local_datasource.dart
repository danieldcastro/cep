import 'package:cep/infrastructure/models/remote_cep_model.dart';

abstract class LocalDatasource {
  Future<List<RemoteCepModel>> find({Map<String, dynamic>? parameter});
  Future<int> insert({required Map<String, dynamic> model});
  Future<int> delete({required int id});
}
