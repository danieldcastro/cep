// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const HOME = '/home';
  static const SEARCH = '/search';
  static const HISTORY = '/history';
}
