import 'package:flutter/material.dart';
import '/models/elements.dart';
import '/services/logger_service.dart';

class ElementsProvider with ChangeNotifier {
  List<GameElement> availableElements =
      getInitialElements().where((e) => e.discovered).toList();
  int discoveryCounter =
      getInitialElements().where((e) => e.discoveryOrder != null).length;

  void combineElements(GameElement targetElement, GameElement draggedElement) {
    LoggerService.debug(
        'Combining ${targetElement.id} with ${draggedElement.id}');
    GameElement? resultElement =
        _findCombination(targetElement, draggedElement);
    if (resultElement != null && !resultElement.discovered) {
      LoggerService.info('New element discovered: ${resultElement.id}');
      resultElement.discovered = true;
      resultElement.discoveryOrder = discoveryCounter++;
      availableElements =
          getInitialElements().where((e) => e.discovered).toList();
      availableElements
          .sort((a, b) => a.discoveryOrder!.compareTo(b.discoveryOrder!));
      notifyListeners();
    }
  }

  GameElement? _findCombination(GameElement e1, GameElement e2) {
    for (var element in getInitialElements()) {
      if ((element.parent1Id == e1.id && element.parent2Id == e2.id) ||
          (element.parent1Id == e2.id && element.parent2Id == e1.id) ||
          (element.parent1Id == e1.id &&
              element.parent2Id == e1.id &&
              e1 == e2)) {
        return element;
      }
    }
    LoggerService.warning('No combination found for ${e1.id} and ${e2.id}');
    return null;
  }

  void resetElements() {
    LoggerService.info('Resetting elements to initial state');
    discoveryCounter =
        getInitialElements().where((e) => e.discoveryOrder != null).length;
    availableElements =
        getInitialElements().where((e) => e.discovered).toList();
    notifyListeners();
  }
}
