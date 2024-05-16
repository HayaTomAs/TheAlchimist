class GameElement {
  final String id;
  final String translationKey;
  final String imagePath;
  bool discovered;
  final List<Map<String, String>> possibleCombinations;
  int? discoveryOrder;

  GameElement(this.id, this.translationKey, this.imagePath,
      {this.discovered = false, required this.possibleCombinations, this.discoveryOrder});

  // Méthode pour créer une copie de l'élément
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

// Créer une copie des éléments initiaux
List<GameElement> getInitialElements() {
  return initialElements.map((e) => e.copy()).toList();
}

final initialElements = <GameElement>[
  GameElement('void', 'element_void', 'assets/images/element_generic.png', discovered: true, discoveryOrder: 0),
  GameElement('time', 'element_time', 'assets/images/element_generic.png', discovered: true, discoveryOrder: 1),
  GameElement('energy', 'element_energy', 'assets/images/element_generic.png', discovered: true, discoveryOrder: 2),
  GameElement('atom', 'element_atom', 'assets/images/element_generic.png', parent1Id: 'void', parent2Id: 'energy'),
  GameElement('cellular', 'element_cellular', 'assets/images/element_generic.png',
      parent1Id: 'atom', parent2Id: 'atom'),
  GameElement('moon', 'element_moon', 'assets/images/element_generic.png', parent1Id: 'atom', parent2Id: 'energy'),
  GameElement('star', 'element_star', 'assets/images/element_generic.png', parent1Id: 'void', parent2Id: 'energy'),
  GameElement('planet', 'element_planet', 'assets/images/element_generic.png', parent1Id: 'moon', parent2Id: 'star'),
  GameElement('fire', 'element_fire', 'assets/images/element_generic.png', parent1Id: 'hood', parent2Id: 'thunder'),
  GameElement('water', 'element_water', 'assets/images/element_generic.png', parent1Id: 'wind', parent2Id: 'time'),
  GameElement('life', 'element_life', 'assets/images/element_generic.png', parent1Id: 'water', parent2Id: 'cellular'),
  GameElement('earth', 'element_earth', 'assets/images/element_generic.png',
      parent1Id: 'cellular', parent2Id: 'cellular'),
  GameElement('air', 'element_air', 'assets/images/element_generic.png', parent1Id: 'void', parent2Id: 'atom'),
  GameElement('steam', 'element_steam', 'assets/images/element_generic.png', parent1Id: 'fire', parent2Id: 'water'),
  GameElement('mud', 'element_mud', 'assets/images/element_generic.png', parent1Id: 'water', parent2Id: 'earth'),
  GameElement('wind', 'element_wind', 'assets/images/element_generic.png', parent1Id: 'air', parent2Id: 'air'),
  GameElement('stone', 'element_stone', 'assets/images/element_generic.png', parent1Id: 'air', parent2Id: 'earth'),
  GameElement('lava', 'element_lava', 'assets/images/element_generic.png', parent1Id: 'fire', parent2Id: 'stone'),
  GameElement('atmospher', 'element_atmospher', 'assets/images/element_generic.png',
      parent1Id: 'void', parent2Id: 'energy'),
  GameElement('cloud', 'element_cloud', 'assets/images/element_generic.png', parent1Id: 'atmospher', parent2Id: 'wind'),
  GameElement('rain', 'element_rain', 'assets/images/element_generic.png', parent1Id: 'cloud', parent2Id: 'wind'),
  GameElement('thunder', 'element_thunder', 'assets/images/element_generic.png',
      parent1Id: 'cloud', parent2Id: 'energy'),
  GameElement('ocean', 'element_ocean', 'assets/images/element_generic.png', parent1Id: 'rain', parent2Id: 'planet'),
  GameElement('grass', 'element_grass', 'assets/images/element_generic.png',
      parent1Id: 'planctoon', parent2Id: 'planet'),
  GameElement('planctoon', 'element_planctoon', 'assets/images/element_generic.png',
      parent1Id: 'ocean', parent2Id: 'life'),
  GameElement('oxygen', 'element_oxygen', 'assets/images/element_generic.png',
      parent1Id: 'atmospher', parent2Id: 'planctoon'),
  GameElement('animal', 'element_animal', 'assets/images/element_generic.png',
      parent1Id: 'oxygen', parent2Id: 'planet'),
  GameElement('hood', 'element_hood', 'assets/images/element_generic.png', parent1Id: 'grass', parent2Id: 'time'),
];
