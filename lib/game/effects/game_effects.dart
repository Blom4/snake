import 'package:flutter/services.dart';

import '../events/game_event.dart';
import 'game_audio.dart';

class GameEffects {
  GameEffects() : _audio = GameAudio();

  final GameAudio _audio;

  Future<void> handle(GameEvent event) async {
    switch (event) {
      case FoodEaten():
        await HapticFeedback.lightImpact();
        await _audio.playFood();

      case LevelChanged():
        await HapticFeedback.mediumImpact();
        await _audio.playLevelUp();

      case GameOver():
        await HapticFeedback.heavyImpact();
        await _audio.playGameOver();
    }
  }

  Future<void> dispose() async {
    await _audio.dispose();
  }
}
