import '/models/elements_base.dart';

final initialElements = <GameElement>[
  GameElement(
    'void',
    'element_void',
    'assets/images/element_generic.png',
    discovered: true,
    discoveryOrder: 0,
    possibleCombinations: [],
  ),
  GameElement(
    'time',
    'element_time',
    'assets/images/element_generic.png',
    discovered: true,
    discoveryOrder: 1,
    possibleCombinations: [],
  ),
  GameElement(
    'energy',
    'element_energy',
    'assets/images/element_generic.png',
    discovered: true,
    discoveryOrder: 2,
    possibleCombinations: [],
  ),
];
