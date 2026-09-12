import 'package:freezed_annotation/freezed_annotation.dart';

import 'direction.dart';
import 'position.dart';

part 'snake_game_state.freezed.dart';

enum GameDifficulty { easy, normal, hard }

enum GameStatus { ready, playing, paused, gameOver }

@freezed
abstract class SnakeGameState with _$SnakeGameState {
  const factory SnakeGameState({
    required List<Position> snake,
    required Position food,
    required Direction direction,
    required GameStatus status,
    required int score,
    required GameDifficulty difficulty,
  }) = _SnakeGameState;
}
