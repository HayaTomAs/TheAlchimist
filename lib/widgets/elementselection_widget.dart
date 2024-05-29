import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/elements_base.dart';
import '/services/localization.dart';
import '/services/logger_service.dart';
import '/services/element_provider.dart';
import '/widgets/element_widget.dart';

class ElementSelectionScreen extends StatelessWidget {
  const ElementSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elementsProvider = Provider.of<ElementsProvider>(context);
    LoggerService.debug('Building ElementSelectionScreen widget');
    final GlobalKey stackKey = GlobalKey(); // Créer un GlobalKey pour le Stack

    int totalElements = getInitialElements().length;
    int discoveredElements = elementsProvider.availableElements.length;

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    key: stackKey, // Assigner la clé au Stack
                    children: elementsProvider.availableElements.map((element) {
                      final position = elementsProvider.getElementPosition(element);
                      return Positioned(
                        left: position.dx,
                        top: position.dy,
                        child: GestureDetector(
                          onDoubleTap: () {
                            LoggerService.debug('Double click');
                            elementsProvider.combineElements(element, element);
                          },
                          child: Draggable<GameElement>(
                            data: element,
                            feedback: Material(
                              color: Colors.transparent,
                              child: Opacity(
                                opacity: 0.7,
                                child: ElementWidget(element: element),
                              ),
                            ),
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: ElementWidget(element: element),
                            ),
                            onDragEnd: (details) {
                              // Obtenir la position du Stack par rapport à l'écran
                              final stackRenderBox = stackKey.currentContext?.findRenderObject() as RenderBox?;
                              final stackPosition = stackRenderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

                              // Calculer la position relative à l'intérieur du Stack
                              Offset adjustedPosition = details.offset - stackPosition;

                              Offset constrainedPosition =
                                  _constrainPosition(adjustedPosition, constraints.maxWidth, constraints.maxHeight);
                              elementsProvider.updateElementPosition(element, constrainedPosition);
                            },
                            child: DragTarget<GameElement>(
                              onAcceptWithDetails: (details) {
                                LoggerService.debug('Received element');
                                elementsProvider.combineElements(element, details.data);
                              },
                              builder: (context, candidateData, rejectedData) {
                                return ElementWidget(element: element);
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: elementsProvider.resetElements,
              child: Text(AppLocalizations.of(context)!.translate('reset')),
            ),
          ],
        ),
      ),
    );
  }

  Offset _constrainPosition(Offset position, double maxWidth, double maxHeight) {
    // Taille de l'élément (peut être ajustée selon la taille réelle de votre élément)
    const double elementWidth = 100;
    const double elementHeight = 100;

    // Contraindre la position pour rester à l'intérieur des limites
    double constrainedX = position.dx.clamp(0, maxWidth - elementWidth);
    double constrainedY = position.dy.clamp(0, maxHeight - elementHeight);

    return Offset(constrainedX, constrainedY);
  }
}
