import 'dart:io';

import 'package:cep/domain/contracts/gateways/sqlite_connection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'sqlite_favorite_impl.dart';

class SqliteConnectionImpl implements SqliteConnection {
  static const String _databaseName = 'cep.db';
  static const int _databaseVersion = 1;

  SqliteConnectionImpl._privateConstructor();

  static final SqliteConnectionImpl instance =
      SqliteConnectionImpl._privateConstructor();

  static Database? _database;

  // Criando o banco de dados.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  // Inicializando o banco de dados.
  @override
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _databaseName;
    var database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  @override
  Future<void> onCreate(Database database, int version) async {
    await database.execute(SqliteFavoriteImpl.createTableFavorite);
  }

  //  Atualização de versão do banco.
  @override
  Future<void> onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      database.execute('INSERT QUERY HERE');
    } else {
      throw Exception('Failed to update the database version!');
    }
  }
}
