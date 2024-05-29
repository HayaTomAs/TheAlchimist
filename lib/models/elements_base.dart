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
