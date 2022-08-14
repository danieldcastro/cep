import 'package:cep/core/response/sqlite_response.dart';
import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/contracts/gateways/sqlite_favorite.dart';
import 'package:sqflite/sqflite.dart';

import 'logger_impl.dart';
import 'sqlite_connection_impl.dart';

class SqliteFavoriteImpl implements SqliteFavorite {
  final MyLogger _log = LoggerImpl();

  void _logs({
    dynamic parameters,
    String? body,
    required dynamic response,
    required String method,
    required bool statusCode,
  }) {
    _log.append('############### $method ###############');
    _log.append('PARAMETERS: $parameters');
    _log.append('StatusCode: $statusCode');
    _log.append('SQL: $body');
    _log.append('RESPONSE: $response');
    _log.append('######################################');
    _log.closeAppend();
  }

  // Nome da tabela
  static const String _table = 'tb_favorite';

  // Nome da coluna da tabela
  static const String _columnId = 'id';
  static const String _columnCep = 'cep';
  static const String _columnStreet = 'street';
  static const String _columnComplement = 'complement';
  static const String _columnCity = 'city';
  static const String _columnUf = 'uf';

  static const String createTableFavorite =
      "CREATE TABLE IF NOT EXISTS $_table("
      "$_columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$_columnCep TEXT NOT NULL,"
      "$_columnStreet TEXT NOT NULL,"
      "$_columnComplement TEXT,"
      "$_columnCity TEXT NOT NULL,"
      "$_columnUf TEXT NOT NULL"
      ");";

  @override
  Future<SqliteResponse> delete({required int id}) async {
    Database database = await SqliteConnectionImpl.instance.database;
    final int result = await database.delete(
      _table,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
    _logs(
      method: 'DELETE',
      parameters: id,
      response: 'DELETED FAVORITE CEP WITH ID: $result',
      statusCode: true,
    );
    return SqliteResponse(data: result, response: true);
  }

  @override
  Future<SqliteResponse> insert({required Map<String, dynamic> model}) async {
    Database database = await SqliteConnectionImpl.instance.database;
    final int result = await database.insert(_table, model);
    _logs(
      method: 'INSERT',
      parameters: model,
      response: 'INSERTED FAVORITE CEP WITH ID: $result',
      statusCode: true,
    );
    return SqliteResponse(data: result, response: true);
  }

  @override
  Future<SqliteResponse> find({Map<String, dynamic>? parameter}) async {
    Database database = await SqliteConnectionImpl.instance.database;

    String sql = '''
    SELECT * FROM $_table DESC
    ''';

    final List<Map<String, dynamic>> result = await database.rawQuery(sql);
    _logs(
      method: 'SELECT',
      parameters: parameter,
      body: sql,
      response: result,
      statusCode: true,
    );
    return SqliteResponse(data: result, response: true);
  }
}
