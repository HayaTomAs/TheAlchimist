import 'package:flutter/material.dart';
import '/services/localization.dart';

class GameModeScreen extends StatelessWidget {
  const GameModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('game_modes_title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text(AppLocalizations.of(context)!.translate('normal_mode')),
            ),
            // Ajoutez ici d'autres boutons pour les autres modes de jeu si nécessaire
          ],
        ),
      ),
    );
  }
}
