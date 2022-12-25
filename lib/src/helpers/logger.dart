import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart' as foundation;

class Log{
  static final _logger = Logger();
  static void i(dynamic title, [dynamic data]) => !foundation.kReleaseMode ? _logger.i(title,data) : null;
  static void w(dynamic title, [dynamic data]) => !foundation.kReleaseMode ? _logger.w(title,data) : null;
  static void e(dynamic title, [dynamic data]) => !foundation.kReleaseMode ? _logger.e(title,data) : null;
  static void wtf(dynamic title, [dynamic data]) => !foundation.kReleaseMode ? _logger.wtf(title,data) : null;
}