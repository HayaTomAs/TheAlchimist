import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization.dart';
import 'element_provider.dart';
import 'services/logger_service.dart';
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        LoggerService.info('Device locale: $locale');
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              LoggerService.info('Supported locale found: $supportedLocale');
              return supportedLocale;
            }
          }
        }
        LoggerService.info('Using default locale: fr');
        return const Locale('fr');
      },
      home: const ElementSelectionScreen(),
    );
  }
}
