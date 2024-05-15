class GameElement {
  final String id;
  final String name;
  final String imagePath;
  bool discovered;
  final String? parent1Id;
  final String? parent2Id;

  GameElement(this.id, this.name, this.imagePath,
      {this.discovered = false, this.parent1Id, this.parent2Id});
}

final elements = <GameElement>[
  GameElement('void', 'Void', 'assets/images/element_generic.png',
      discovered: true),
  GameElement('time', 'Time', 'assets/images/element_generic.png',
      discovered: true),
  GameElement('atom', 'Atom', 'assets/images/element_generic.png',
      parent1Id: 'void', parent2Id: 'void'),
  GameElement('cellular', 'Cellular', 'assets/images/element_generic.png',
      parent1Id: 'atom', parent2Id: 'atom'),
  GameElement('fire', 'Fire', 'assets/images/element_generic.png',
      discovered: true),
  GameElement('water', 'Water', 'assets/images/element_generic.png',
      parent1Id: 'wind', parent2Id: 'time'),
  GameElement('life', 'Life', 'assets/images/element_generic.png',
      parent1Id: 'water', parent2Id: 'cellular'),
  GameElement('earth', 'Earth', 'assets/images/element_generic.png',
      parent1Id: 'cellular', parent2Id: 'cellular'),
  GameElement('air', 'Air', 'assets/images/element_generic.png',
      parent1Id: 'void', parent2Id: 'atom'),
  GameElement('steam', 'Steam', 'assets/images/element_generic.png',
      parent1Id: 'fire', parent2Id: 'water'),
  GameElement('mud', 'Mud', 'assets/images/element_generic.png',
      parent1Id: 'water', parent2Id: 'earth'),
  GameElement('wind', 'Wind', 'assets/images/element_generic.png',
      parent1Id: 'air', parent2Id: 'air'),
  GameElement('stone', 'Stone', 'assets/images/element_generic.png',
      parent1Id: 'air', parent2Id: 'earth'),
  GameElement('lava', 'Lava', 'assets/images/element_generic.png',
      parent1Id: 'fire', parent2Id: 'stone'),
];
