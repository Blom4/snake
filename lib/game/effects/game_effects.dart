import 'package:flutter/services.dart';

import '../events/game_event.dart';

class GameEffects {
  const GameEffects();

  Future<void> handle(GameEvent event) async {
    switch (event) {
      case FoodEaten():
        await HapticFeedback.lightImpact();

      case LevelChanged():
        await HapticFeedback.mediumImpact();

      case GameOver():
        await HapticFeedback.heavyImpact();
    }
  }
}
