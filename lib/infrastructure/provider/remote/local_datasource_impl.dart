import 'package:cep/domain/contracts/gateways/sqlite_favorite.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:cep/infrastructure/provider/local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final SqliteFavorite _sqLiteFavorite;

  LocalDatasourceImpl(this._sqLiteFavorite);

  @override
  Future<int> delete({required int id}) async {
    final result = await _sqLiteFavorite.delete(id: id);
    if (result.response) {
      return result.data;
    } else {
      throw Exception('Error deleting favorite');
    }
  }

  @override
  Future<List<RemoteCepModel>> find({Map<String, dynamic>? parameter}) async {
    final result = await _sqLiteFavorite.find();

    if (result.response) {
      List<Map<String, dynamic>> favorites = result.data;
      return favorites
          .map((favorite) => RemoteCepModel.fromMap(favorite))
          .toList();
    } else {
      throw Exception('Error fetching favorites list');
    }
  }

  @override
  Future<int> insert({required Map<String, dynamic> model}) async {
    final result = await _sqLiteFavorite.insert(model: model);
    if (result.response) {
      return result.data;
    } else {
      throw Exception('Error inserting favorite');
    }
  }
}
