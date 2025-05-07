import 'package:roggle/roggle.dart';

class LoggerService {
  static final errorLogger = Roggle(level: Level.error);
  static final infoLogger = Roggle(level: Level.info);
  static final debugLogger = Roggle(level: Level.debug);

  static void logError(String message) {
    errorLogger.e(message);
  }

  static void logInfo(String message) {
    infoLogger.i(message);
  }

  static void logDebug(String message) {
    debugLogger.d(message);
  }
}

logError(String message) {
  LoggerService.logError(message);
}

logInfo(String message) {
  LoggerService.logInfo(message);
}

logDebug(String message) {
  LoggerService.logDebug(message);
}
