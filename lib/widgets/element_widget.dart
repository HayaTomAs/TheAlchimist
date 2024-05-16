import 'package:flutter/material.dart';
import '/models/elements.dart';
import '/localization.dart';

class ElementWidget extends StatelessWidget {
  final GameElement element;

  const ElementWidget({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(element.imagePath, width: 50, height: 50),
        const SizedBox(height: 8),
        Text(AppLocalizations.of(context)!.translate(element.translationKey)),
      ],
    );
  }
}
