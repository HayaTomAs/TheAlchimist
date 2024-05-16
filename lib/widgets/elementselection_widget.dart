import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../localization.dart';
import '/models/elements.dart';
import '/services/logger_service.dart';
import '../element_provider.dart';
import '/widgets/element_widget.dart';

class ElementSelectionScreen extends StatelessWidget {
  const ElementSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elementsProvider = Provider.of<ElementsProvider>(context);
    LoggerService.debug('Building ElementSelectionScreen widget');

    int totalElements = initialElements.length;
    int discoveredElements = elementsProvider.availableElements.length;
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
                itemCount: elementsProvider.availableElements.length,
                itemBuilder: (context, index) {
                  final element = elementsProvider.availableElements[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      LoggerService.debug('Double click');
                      elementsProvider.combineElements(element, element);
                    },
                    child: Draggable<GameElement>(
                      data: element,
                      feedback: Material(
                        color: Colors.transparent,
                        child: ElementWidget(element: element),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: ElementWidget(element: element),
                      ),
                      child: DragTarget<GameElement>(
                        onAcceptWithDetails: (details) {
                          LoggerService.debug('Reception element');
                          elementsProvider.combineElements(
                              element, details.data);
                        },
                        builder: (context, candidateData, rejectedData) {
                          return ElementWidget(element: element);
                        },
                      ),
                    ),
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
}
