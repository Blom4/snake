import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:snake/game/engine/snake_game_engine.dart';
import 'package:snake/game/events/game_event.dart';
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

      final result = engine.tick(state, Direction.right);

      expect(result.state.snake.first.x, 11);

      expect(result.state.snake.first.y, 10);
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

      final result = engine.tick(state, Direction.right);

      expect(result.state.status, GameStatus.gameOver);
    });
  });

  test('moves snake in the supplied direction', () {
    final engine = SnakeGameEngine(random: Random(1));

    final state = engine.createInitialState();

    final result = engine.tick(state, Direction.down);

    expect(result.state.snake.first, const Position(x: 10, y: 11));

    expect(result.state.direction, Direction.down);
  });

  test('detects wall collision', () {
    final engine = SnakeGameEngine(random: Random(1));

    final state = SnakeGameState(
      snake: const [
        Position(x: 19, y: 10),
        Position(x: 18, y: 10),
        Position(x: 17, y: 10),
      ],
      food: const Position(x: 5, y: 5),
      direction: Direction.right,
      status: GameStatus.playing,
      score: 0,
      difficulty: GameDifficulty.normal,
    );

    final result = engine.tick(state, Direction.right);

    expect(result.state.status, GameStatus.gameOver);

    expect(result.events, contains(const GameEvent.gameOver()));
  });
}
