import '/models/elements_base.dart';final initialElements = <GameElement>[
GameElement('void','element_void','assets/images/element_generic.png',discovered: true,discoveryOrder: 0,possibleCombinations: [],),
GameElement('time','element_time','assets/images/element_generic.png',discovered: true,discoveryOrder: 1,possibleCombinations: [],),
GameElement('energy','element_energy','assets/images/element_generic.png',discovered: true,discoveryOrder: 2,possibleCombinations: [],),
GameElement('atom','element_atom','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'void', 'parent2Id': 'energy'}],),
GameElement('gas','element_gas','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'void', 'parent2Id': 'atom'}],),
GameElement('element','element_element','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'atom', 'parent2Id': 'atom'}],),
GameElement('cellular','element_cellular','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'element', 'parent2Id': 'energy'}],),
GameElement('pressure','element_pressure','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'time', 'parent2Id': 'energy'}],),
GameElement('star','element_star','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'gas', 'parent2Id': 'pressure'}],),
GameElement('bacteria','element_bacteria','assets/images/element_generic.png',discovered: false,possibleCombinations: [{'parent1Id': 'cellular', 'parent2Id': 'cellular'}],),
];
