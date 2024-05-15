import 'package:flutter/material.dart';
import 'localization.dart';
import 'models/elements.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const AlchemistGame());
}

class AlchemistGame extends StatelessWidget {
  const AlchemistGame({super.key});

  @override
  Widget build(BuildContext context) {
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
        print('Device locale: $locale');
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              print('Supported locale found: $supportedLocale');
              return supportedLocale;
            }
          }
        }
        print('Using default locale: fr');
        return const Locale('fr'); // Langue par défaut si non supportée
      },
      home: const ElementSelectionScreen(),
    );
  }
}

class ElementSelectionScreen extends StatefulWidget {
  const ElementSelectionScreen({super.key});

  @override
  _ElementSelectionScreenState createState() => _ElementSelectionScreenState();
}

class _ElementSelectionScreenState extends State<ElementSelectionScreen> {
  List<GameElement> availableElements = elements
      .where((e) => e.discovered)
      .toList(); // Filtrer les éléments disponibles

  void _combineElements(GameElement targetElement, GameElement draggedElement) {
    setState(() {
      GameElement? resultElement =
          combineElements(targetElement, draggedElement);
      if (resultElement != null) {
        resultElement.discovered =
            true; // Marquer le nouvel élément comme découvert
        availableElements = elements
            .where((e) => e.discovered)
            .toList(); // Mettre à jour les éléments disponibles
      }
    });
  }

  GameElement? combineElements(GameElement e1, GameElement e2) {
    for (var element in elements) {
      if ((element.parent1Id == e1.id && element.parent2Id == e2.id) ||
          (element.parent1Id == e2.id && element.parent2Id == e1.id) ||
          (element.parent1Id == e1.id &&
              element.parent2Id == e1.id &&
              e1 == e2)) {
        // Vérifier combinaison avec lui-même
        return element;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Calculer le nombre total d'éléments et le nombre d'éléments trouvés
    int totalElements = elements.length;
    int discoveredElements = availableElements.length;

    // Calculer le nombre de colonnes en fonction de la largeur de l'écran
    final int columns = (MediaQuery.of(context).size.width / 100).floor();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('title')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '${AppLocalizations.of(context)!.translate('found_elements')}: $discoveredElements / $totalElements',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  childAspectRatio: 1,
                ),
                itemCount: availableElements.length,
                itemBuilder: (context, index) {
                  final element = availableElements[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      _combineElements(
                          element, element); // Combiner l'élément avec lui-même
                    },
                    child: Draggable<GameElement>(
                      data: element,
                      feedback: Material(
                        color: Colors.transparent,
                        child: _buildElementWidget(element),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: _buildElementWidget(element),
                      ),
                      child: DragTarget<GameElement>(
                        onAcceptWithDetails: (details) {
                          _combineElements(element, details.data);
                        },
                        builder: (context, candidateData, rejectedData) {
                          return _buildElementWidget(element);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  availableElements = elements
                      .where((e) => e.discovered)
                      .toList(); // Réinitialiser les éléments disponibles
                });
              },
              child: Text(AppLocalizations.of(context)!.translate('reset')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElementWidget(GameElement element) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(element.imagePath, width: 50, height: 50),
        const SizedBox(height: 8),
        Text(element.name),
      ],
    );
  }
}
