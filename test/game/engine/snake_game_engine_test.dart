import 'package:flutter_test/flutter_test.dart';

import 'package:snake/game/engine/snake_game_engine.dart';
import 'package:snake/game/models/direction.dart';
import 'package:snake/game/models/snake_game_state.dart';
import 'package:snake/game/models/position.dart';

void main() {
  group('SnakeGameEngine', () {
    late SnakeGameEngine engine;

    setUp(() {
      engine = SnakeGameEngine();
    });

    test('creates an initial game state', () {
      final state = engine.createInitialState();

      expect(state.snake.length, 3);
      expect(state.score, 0);
      expect(state.status, GameStatus.ready);
      expect(state.direction, Direction.right);
    });

    test('moves the snake to the right', () {
      final state = engine.createInitialState().copyWith(
        status: GameStatus.playing,
      );

      final nextState = engine.tick(state);

      expect(nextState.snake.first.x, 11);

      expect(nextState.snake.first.y, 10);
    });

    test('game over when snake hits wall', () {
      final state = engine.createInitialState().copyWith(
        status: GameStatus.playing,
        snake: const [
          Position(x: 19, y: 10),
          Position(x: 18, y: 10),
          Position(x: 17, y: 10),
        ],
      );

      final nextState = engine.tick(state);

      expect(nextState.status, GameStatus.gameOver);
    });
  });
}
