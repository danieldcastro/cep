import 'package:logger/logger.dart' as dev_log;

var logger = dev_log.Logger(
  printer: dev_log.PrettyPrinter(),
);

class GlobalValidationMapFunction {
  static bool checkMap(
      {required List<String> keys,
      required Map map,
      required String className}) {
    for (var currentKey in keys) {
      if (map.containsKey(currentKey)) {
        if (map[currentKey] != null) {
          if (map[currentKey].toString() == '') {
            logger.w(
              'Map key "$currentKey" has a empty value in class "$className"',
            );
          }
        } else {
          logger.e(
              'Map key "$currentKey" has a null value in class "$className"');
          return false;
        }
      } else {
        logger.e('Map key "$currentKey" was not found in class "$className"');
        return false;
      }
    }
    return true;
  }
}
