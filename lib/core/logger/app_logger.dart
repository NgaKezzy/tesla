import 'package:logger/logger.dart';

class AppLogger {
  Logger provideLogger() {
    Logger logger = Logger(printer: CustomPrinter());
    return logger;
  }
}

class CustomPrinter extends LogPrinter {
  final Map<Level, String> emojis = {
    Level.trace: '',
    Level.debug: '🐛',
    Level.info: '⭐️',
    Level.warning: '☢️',
    Level.error: '⛔',
    Level.fatal: '👀',
  };

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level]!;
    List<String> prints = [
      color('${emojis[event.level]} ${event.message}'),
    ];
    if (event.error != null) {
      prints.add(
        color('[Error]: ${event.error} - [StackTrace] ${event.stackTrace}'),
      );
    }

    return prints;
  }
}
