class GameElement {
  final String id;
  final String translationKey;
  final String imagePath;
  bool discovered;
  final String? parent1Id;
  final String? parent2Id;
  int? discoveryOrder;

  GameElement(this.id, this.translationKey, this.imagePath,
      {this.discovered = false,
      this.parent1Id,
      this.parent2Id,
      this.discoveryOrder});

  // Méthode pour créer une copie de l'élément
  GameElement copy() {
    return GameElement(
      id,
      translationKey,
      imagePath,
      discovered: discovered,
      parent1Id: parent1Id,
      parent2Id: parent2Id,
      discoveryOrder: discoveryOrder,
    );
  }
}

final initialElements = <GameElement>[
  GameElement('void', 'element_void', 'assets/images/element_generic.png',
      discovered: true, discoveryOrder: 0),
  GameElement('time', 'element_time', 'assets/images/element_generic.png',
      discovered: true, discoveryOrder: 1),
  GameElement('atom', 'element_atom', 'assets/images/element_generic.png',
      parent1Id: 'void', parent2Id: 'void'),
  GameElement(
      'cellular', 'element_cellular', 'assets/images/element_generic.png',
      parent1Id: 'atom', parent2Id: 'atom'),
  GameElement('fire', 'element_fire', 'assets/images/element_generic.png',
      parent1Id: 'wind', parent2Id: 'atom'),
  GameElement('water', 'element_water', 'assets/images/element_generic.png',
      parent1Id: 'wind', parent2Id: 'time'),
  GameElement('life', 'element_life', 'assets/images/element_generic.png',
      parent1Id: 'water', parent2Id: 'cellular'),
  GameElement('earth', 'element_earth', 'assets/images/element_generic.png',
      parent1Id: 'cellular', parent2Id: 'cellular'),
  GameElement('air', 'element_air', 'assets/images/element_generic.png',
      parent1Id: 'void', parent2Id: 'atom'),
  GameElement('steam', 'element_steam', 'assets/images/element_generic.png',
      parent1Id: 'fire', parent2Id: 'water'),
  GameElement('mud', 'element_mud', 'assets/images/element_generic.png',
      parent1Id: 'water', parent2Id: 'earth'),
  GameElement('wind', 'element_wind', 'assets/images/element_generic.png',
      parent1Id: 'air', parent2Id: 'air'),
  GameElement('stone', 'element_stone', 'assets/images/element_generic.png',
      parent1Id: 'air', parent2Id: 'earth'),
  GameElement('lava', 'element_lava', 'assets/images/element_generic.png',
      parent1Id: 'fire', parent2Id: 'stone'),
];

// Créer une copie des éléments initiaux
List<GameElement> getInitialElements() {
  return initialElements.map((e) => e.copy()).toList();
}
