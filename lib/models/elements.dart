class GameElement {
  final String id;
  final String translationKey;
  final String imagePath;
  bool discovered;
  final List<Map<String, String>> possibleCombinations;
  int? discoveryOrder;

  GameElement(this.id, this.translationKey, this.imagePath,
      {this.discovered = false, required this.possibleCombinations, this.discoveryOrder});

  GameElement copy() {
    return GameElement(
      id,
      translationKey,
      imagePath,
      discovered: discovered,
      possibleCombinations: possibleCombinations,
      discoveryOrder: discoveryOrder,
    );
  }
}

List<GameElement> getInitialElements() {
  return initialElements.map((e) => e.copy()).toList();
}

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
  GameElement(
    'atom',
    'element_atom',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'void', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'element',
    'element_element',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'atom', 'parent2Id': 'atom'}
    ],
  ),
  GameElement(
    'cellular',
    'element_cellular',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'element', 'parent2Id': 'time'}
    ],
  ),
  GameElement(
    'moon',
    'element_moon',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'stone', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'star',
    'element_star',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'time', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'planet',
    'element_planet',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'moon', 'parent2Id': 'star'}
    ],
  ),
  GameElement(
    'fire',
    'element_fire',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'hood', 'parent2Id': 'thunder'}
    ],
  ),
  GameElement(
    'water',
    'element_water',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wind', 'parent2Id': 'time'}
    ],
  ),
  GameElement(
    'life',
    'element_life',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'cellular'}
    ],
  ),
  GameElement(
    'earth',
    'element_earth',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cellular', 'parent2Id': 'cellular'}
    ],
  ),
  GameElement(
    'air',
    'element_air',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'void', 'parent2Id': 'atom'}
    ],
  ),
  GameElement(
    'steam',
    'element_steam',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'fire', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'mud',
    'element_mud',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'earth'}
    ],
  ),
  GameElement(
    'wind',
    'element_wind',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'air', 'parent2Id': 'air'}
    ],
  ),
  GameElement(
    'stone',
    'element_stone',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'air', 'parent2Id': 'earth'},
      {'parent1Id': 'dust', 'parent2Id': 'time'}
    ],
  ),
  GameElement(
    'lava',
    'element_lava',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'fire', 'parent2Id': 'stone'}
    ],
  ),
  GameElement(
    'atmospher',
    'element_atmospher',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'planet', 'parent2Id': 'air'}
    ],
  ),
  GameElement(
    'cloud',
    'element_cloud',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'atmospher', 'parent2Id': 'wind'}
    ],
  ),
  GameElement(
    'rain',
    'element_rain',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cloud', 'parent2Id': 'wind'}
    ],
  ),
  GameElement(
    'thunder',
    'element_thunder',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cloud', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'ocean',
    'element_ocean',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'rain', 'parent2Id': 'planet'}
    ],
  ),
  GameElement(
    'grass',
    'element_grass',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'planctoon', 'parent2Id': 'planet'}
    ],
  ),
  GameElement(
    'planctoon',
    'element_planctoon',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'ocean', 'parent2Id': 'life'}
    ],
  ),
  GameElement(
    'oxygen',
    'element_oxygen',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'atmospher', 'parent2Id': 'planctoon'}
    ],
  ),
  GameElement(
    'animal',
    'element_animal',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'oxygen', 'parent2Id': 'planet'}
    ],
  ),
  GameElement(
    'hood',
    'element_hood',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'grass', 'parent2Id': 'time'}
    ],
  ),
  GameElement(
    'dust',
    'element_dust',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'element', 'parent2Id': 'energy'},
      {'parent1Id': 'stone', 'parent2Id': 'wind'}
    ],
  ),
  GameElement(
    'tornado',
    'element_tornado',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wind', 'parent2Id': 'wind'}
    ],
  ),
];
