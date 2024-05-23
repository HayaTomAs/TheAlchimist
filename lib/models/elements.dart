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
  GameElement(
    'volcan',
    'element_volcan',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'lava', 'parent2Id': 'mountain'}
    ],
  ),
  GameElement(
    'mountain',
    'element_mountain',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'earth', 'parent2Id': 'earth'}
    ],
  ),
  GameElement(
    'sand',
    'element_sand',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'stone', 'parent2Id': 'wind'}
    ],
  ),
  GameElement(
    'desert',
    'element_desert',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'sand', 'parent2Id': 'sun'}
    ],
  ),
  GameElement(
    'sun',
    'element_sun',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'star', 'parent2Id': 'fire'}
    ],
  ),
  GameElement(
    'comet',
    'element_comet',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'star', 'parent2Id': 'ice'}
    ],
  ),
  GameElement(
    'ice',
    'element_ice',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'cold'}
    ],
  ),
  GameElement(
    'cold',
    'element_cold',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wind', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'snow',
    'element_snow',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cold', 'parent2Id': 'rain'}
    ],
  ),
  GameElement(
    'hurricane',
    'element_hurricane',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wind', 'parent2Id': 'rain'}
    ],
  ),
  GameElement(
    'forest',
    'element_forest',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'tree', 'parent2Id': 'tree'}
    ],
  ),
  GameElement(
    'tree',
    'element_tree',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'earth', 'parent2Id': 'grass'}
    ],
  ),
  GameElement(
    'earthquake',
    'element_earthquake',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'earth', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'metal',
    'element_metal',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'stone', 'parent2Id': 'fire'}
    ],
  ),
  GameElement(
    'lightning',
    'element_lightning',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cloud', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'electricity',
    'element_electricity',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'lightning', 'parent2Id': 'metal'}
    ],
  ),
  GameElement(
    'robot',
    'element_robot',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'metal', 'parent2Id': 'life'}
    ],
  ),
  GameElement(
    'computer',
    'element_computer',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'electricity', 'parent2Id': 'metal'}
    ],
  ),
  GameElement(
    'virus',
    'element_virus',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'life', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'bacteria',
    'element_bacteria',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'cellular', 'parent2Id': 'life'}
    ],
  ),
  GameElement(
    'swamp',
    'element_swamp',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'mud'}
    ],
  ),
  GameElement(
    'fungus',
    'element_fungus',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'swamp', 'parent2Id': 'life'}
    ],
  ),
  GameElement(
    'human',
    'element_human',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'animal', 'parent2Id': 'life'}
    ],
  ),
  GameElement(
    'city',
    'element_city',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'human', 'parent2Id': 'stone'}
    ],
  ),
  GameElement(
    'house',
    'element_house',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wood', 'parent2Id': 'stone'}
    ],
  ),
  GameElement(
    'wood',
    'element_wood',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'tree', 'parent2Id': 'tool'}
    ],
  ),
  GameElement(
    'tool',
    'element_tool',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'metal', 'parent2Id': 'human'}
    ],
  ),
  GameElement(
    'oil',
    'element_oil',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'life', 'parent2Id': 'pressure'}
    ],
  ),
  GameElement(
    'pressure',
    'element_pressure',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'earth', 'parent2Id': 'time'}
    ],
  ),
  GameElement(
    'plastic',
    'element_plastic',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'oil', 'parent2Id': 'chemicals'}
    ],
  ),
  GameElement(
    'chemicals',
    'element_chemicals',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'element'}
    ],
  ),
  GameElement(
    'gas',
    'element_gas',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'oil', 'parent2Id': 'heat'}
    ],
  ),
  GameElement(
    'heat',
    'element_heat',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'fire', 'parent2Id': 'energy'}
    ],
  ),
  GameElement(
    'glass',
    'element_glass',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'sand', 'parent2Id': 'fire'}
    ],
  ),
  GameElement(
    'geyser',
    'element_geyser',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'earth'}
    ],
  ),
  GameElement(
    'ocean',
    'element_ocean',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'sea', 'parent2Id': 'earth'}
    ],
  ),
  GameElement(
    'sea',
    'element_sea',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'salt'}
    ],
  ),
  GameElement(
    'salt',
    'element_salt',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'water', 'parent2Id': 'stone'}
    ],
  ),
  GameElement(
    'storm',
    'element_storm',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'rain', 'parent2Id': 'wind'}
    ],
  ),
  GameElement(
    'tsunami',
    'element_tsunami',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'earthquake', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'wave',
    'element_wave',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'wind', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'mountain_goat',
    'element_mountain_goat',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'animal', 'parent2Id': 'mountain'}
    ],
  ),
  GameElement(
    'fish',
    'element_fish',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'animal', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'bird',
    'element_bird',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'animal', 'parent2Id': 'air'}
    ],
  ),
  GameElement(
    'forest_fire',
    'element_forest_fire',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'forest', 'parent2Id': 'fire'}
    ],
  ),
  GameElement(
    'rainforest',
    'element_rainforest',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'forest', 'parent2Id': 'rain'}
    ],
  ),
  GameElement(
    'swamp_gas',
    'element_swamp_gas',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'swamp', 'parent2Id': 'gas'}
    ],
  ),
  GameElement(
    'quicksand',
    'element_quicksand',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'sand', 'parent2Id': 'water'}
    ],
  ),
  GameElement(
    'marsh',
    'element_marsh',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'swamp', 'parent2Id': 'rain'}
    ],
  ),
  GameElement(
    'mangrove',
    'element_mangrove',
    'assets/images/element_generic.png',
    discovered: false,
    possibleCombinations: [
      {'parent1Id': 'tree', 'parent2Id': 'swamp'}
    ],
  ),
];
