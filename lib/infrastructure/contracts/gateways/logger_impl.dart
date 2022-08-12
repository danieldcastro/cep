import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/contracts/gateways/my_logger.dart';

class LoggerImpl extends GetxService implements MyLogger {
  final Logger _logger = Logger();

  Future<LoggerImpl> getInstance() async {
    info('servico de log iniciado!!!');
    return this;
  }

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  @override
  void warning(message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }
}
