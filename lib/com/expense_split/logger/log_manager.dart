import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum LogType { debug, error, info, trace, warning }

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  static logData(dynamic message, {LogType logType = LogType.trace}) {
    if (!kReleaseMode) {
      if (logType == LogType.debug) {
        _logger.d(message);
      } else if (logType == LogType.error) {
        _logger.e(message);
      } else if (logType == LogType.info) {
        _logger.i(message);
      } else if (logType == LogType.trace) {
        _logger.t(message);
      } else if (logType == LogType.warning) {
        _logger.w(message);
      } else {
        log(message);
      }
    }
  }
}
