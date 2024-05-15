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
  GameElement('fire', 'Fire', 'assets/images/element_generic.png',
      discovered: true),
  GameElement('water', 'Water', 'assets/images/element_generic.png',
      discovered: true),
  GameElement('earth', 'Earth', 'assets/images/element_generic.png'),
  GameElement('air', 'Air', 'assets/images/element_generic.png'),
  GameElement('steam', 'Steam', 'assets/images/element_generic.png',
      parent1Id: 'fire', parent2Id: 'water'),
  GameElement('mud', 'Mud', 'assets/images/element_generic.png',
      parent1Id: 'water', parent2Id: 'earth'),
];
