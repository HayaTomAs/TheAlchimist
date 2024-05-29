/*
class GameElement {final String id;final String translationKey;final String imagePath;bool discovered;final List<Map<String, String>> possibleCombinations;int? discoveryOrder;GameElement(this.id, this.translationKey, this.imagePath,{this.discovered = false, required this.possibleCombinations, this.discoveryOrder});GameElement copy() {return GameElement(id,translationKey,imagePath,discovered: discovered,possibleCombinations: possibleCombinations,discoveryOrder: discoveryOrder,);}}List<GameElement> getInitialElements() {return initialElements.map((e) => e.copy()).toList();}final initialElements = <GameElement>[
GameElement('void','element_void','assets/images/element_generic.png',discovered: true,discoveryOrder: 0,possibleCombinations: [],),
GameElement('time','element_time','assets/images/element_generic.png',discovered: true,discoveryOrder: 1,possibleCombinations: [],),
GameElement('energy','element_energy','assets/images/element_generic.png',discovered: true,discoveryOrder: 2,possibleCombinations: [],),
GameElement('atom','element_atom','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'void', 'parent2Id': 'energy'}],),
GameElement('gas','element_gas','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'void', 'parent2Id': 'atom'}],),
];
*/