import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Nombre de lignes de pile d'appels à afficher
      errorMethodCount:
          8, // Nombre de lignes si niveau de journalisation est erreur
      lineLength: 120, // Longueur de ligne pour chaque sortie
      colors: true, // Activer les couleurs pour l'affichage
      printEmojis: true, // Activer l'affichage des émojis
      printTime: true, // Activer l'affichage de l'heure
    ),
    level: Level.info,
  );

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  static void wtf(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}
