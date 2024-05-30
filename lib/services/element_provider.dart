import 'package:flutter/material.dart';
import '/models/elements_base.dart';
import '/models/elements_list.dart';
import '/services/logger_service.dart';

List<GameElement> getInitialElements() {
  return initialElements.map((e) => e.copy()).toList();
}

class ElementsProvider with ChangeNotifier {
  List<GameElement> availableElements = getInitialElements().where((e) => e.discovered).toList();
  int discoveryCounter = 0;
  Map<GameElement, Offset> elementPositions = {};
  Map<GameElement, Offset> initialPositions = {}; // Mémoriser les positions initiales

  ElementsProvider() {
    discoveryCounter = availableElements.length;
    // Initialiser les positions des éléments
    for (var element in availableElements) {
      elementPositions[element] = Offset(element.discoveryOrder! * 50, 50);
    }
  }

  void combineElements(GameElement targetElement, GameElement draggedElement) {
    LoggerService.debug('Combining ${targetElement.id} with ${draggedElement.id}');
    GameElement? resultElement = _findCombination(targetElement, draggedElement);
    if (resultElement != null &&
        !resultElement.discovered &&
        !availableElements.any((element) => element.id == resultElement.id)) {
      LoggerService.info('New element discovered: ${resultElement.id}');
      resultElement.discovered = true;
      resultElement.discoveryOrder = discoveryCounter++;
      availableElements.add(resultElement);
      elementPositions[resultElement] = Offset(50, 50); // Position initiale pour le nouvel élément
      availableElements.sort((a, b) => a.discoveryOrder!.compareTo(b.discoveryOrder!));
      notifyListeners();
    }
  }

  GameElement? _findCombination(GameElement e1, GameElement e2) {
    for (var element in getInitialElements()) {
      for (var combination in element.possibleCombinations) {
        if ((combination['parent1Id'] == e1.id && combination['parent2Id'] == e2.id) ||
            (combination['parent1Id'] == e2.id && combination['parent2Id'] == e1.id) ||
            (combination['parent1Id'] == e1.id && combination['parent2Id'] == e1.id && e1 == e2)) {
          return element;
        }
      }
    }
    LoggerService.warning('No combination found for ${e1.id} and ${e2.id}');
    return null;
  }

  void resetElements() {
    LoggerService.info('Resetting elements to initial state');
    discoveryCounter = getInitialElements().where((e) => e.discoveryOrder != null).length;
    availableElements = getInitialElements().where((e) => e.discovered).toList();
    elementPositions.clear();
    // Réinitialiser les positions des éléments
    for (var element in availableElements) {
      elementPositions[element] = Offset(element.discoveryOrder! * 50, 50);
    }
    notifyListeners();
  }

  void updateElementPosition(GameElement element, Offset newPosition) {
    elementPositions[element] = newPosition;
    notifyListeners();
  }

  Offset getElementPosition(GameElement element) {
    return elementPositions[element] ?? Offset(50, 50);
  }

  void setInitialPosition(GameElement element) {
    initialPositions[element] = elementPositions[element] ?? Offset(element.discoveryOrder! * 50, 50);
  }

  void restoreInitialPosition(GameElement element) {
    elementPositions[element] = initialPositions[element] ?? Offset(element.discoveryOrder! * 50, 50);
    notifyListeners();
  }
}
