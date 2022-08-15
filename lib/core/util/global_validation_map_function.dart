import '../../infrastructure/contracts/gateways/logger_impl.dart';

final _logger = LoggerImpl();

class GlobalValidationMapFunction {
  static bool checkMap(
      {required List<String> keys,
      required Map map,
      required String className}) {
    for (var currentKey in keys) {
      if (map.containsKey(currentKey)) {
        if (map[currentKey] != null) {
          if (map[currentKey].toString() == '') {
            _logger.warning(
              'Map key "$currentKey" has a empty value in class "$className"',
            );
          }
        } else {
          _logger.error(
              'Map key "$currentKey" has a null value in class "$className"');
          return false;
        }
      } else {
        _logger
            .error('Map key "$currentKey" was not found in class "$className"');
        return false;
      }
    }
    return true;
  }
}
