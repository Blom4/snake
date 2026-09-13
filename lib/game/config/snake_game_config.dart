import '../models/snake_game_state.dart';

class SnakeGameConfig {
  const SnakeGameConfig({
    this.boardWidth = 20,
    this.boardHeight = 20,
    this.easySpeed = 220,
    this.normalSpeed = 150,
    this.hardSpeed = 90,
    this.minimumSpeed = 50,
    this.levelUpScore = 5,
    this.speedDecreasePerLevel = 10,
  });

  final int boardWidth;
  final int boardHeight;

  final int easySpeed;
  final int normalSpeed;
  final int hardSpeed;

  final int minimumSpeed;

  final int levelUpScore;
  final int speedDecreasePerLevel;

  int baseSpeed(GameDifficulty difficulty) {
    return switch (difficulty) {
      GameDifficulty.easy => easySpeed,
      GameDifficulty.normal => normalSpeed,
      GameDifficulty.hard => hardSpeed,
    };
  }

  int levelForScore(int score) {
    return (score ~/ levelUpScore) + 1;
  }

  int speedFor({required GameDifficulty difficulty, required int level}) {
    final speed = baseSpeed(difficulty) - ((level - 1) * speedDecreasePerLevel);

    return speed.clamp(minimumSpeed, baseSpeed(difficulty));
  }
}
