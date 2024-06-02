import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/element_provider.dart';
import 'services/logger_service.dart';
import 'screens/home_screen.dart';
import 'screens/game_mode_screnn.dart';
import 'screens/settings_screen.dart';
import 'screens/info_screen.dart';
import 'widgets/elementselection_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ElementsProvider()),
      ],
      child: const AlchemistGame(),
    ),
  );
  LoggerService.info('Application started');
}

class AlchemistGame extends StatelessWidget {
  const AlchemistGame({super.key});

  @override
  Widget build(BuildContext context) {
    LoggerService.debug('Building AlchemistGame widget');
    return MaterialApp(
      title: 'Alchemist Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _buildRoute(settings, const HomeScreen());
          case '/game':
            return _buildRoute(settings, const ElementSelectionScreen());
          case '/mode':
            return _buildRoute(settings, const GameModeScreen());
          case '/settings':
            return _buildRoute(settings, const SettingsScreen());
          case '/info':
            return _buildRoute(settings, const InfoScreen());
          default:
            return null;
        }
      },
    );
  }

  PageRouteBuilder _buildRoute(RouteSettings settings, Widget screen) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child:
              child /*SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          )*/
          ,
        );
      },
    );
  }
}
