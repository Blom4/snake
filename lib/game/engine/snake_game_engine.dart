import 'dart:math';

import 'package:snake/game/config/snake_game_config.dart';

import '../models/direction.dart';
import '../models/position.dart';
import '../models/snake_game_state.dart';

import '../events/game_event.dart';
import 'snake_tick_result.dart';

class SnakeGameEngine {
  SnakeGameEngine({SnakeGameConfig? config, Random? random})
    : config = config ?? const SnakeGameConfig(),
      _random = random ?? Random();
  final SnakeGameConfig config;
  final Random _random;

  SnakeGameState createInitialState({
    GameDifficulty difficulty = GameDifficulty.normal,
  }) {
    return SnakeGameState(
      snake: const [
        Position(x: 10, y: 10),
        Position(x: 9, y: 10),
        Position(x: 8, y: 10),
      ],
      food: const Position(x: 15, y: 10),
      direction: Direction.right,
      status: GameStatus.ready,
      score: 0,
      difficulty: difficulty,
    );
  }

  bool isCollision(
    SnakeGameState state,
    Position position, {
    required bool willGrow,
  }) {
    if (position.x < 0 ||
        position.x >= config.boardWidth ||
        position.y < 0 ||
        position.y >= config.boardHeight) {
      return true;
    }

    final body = willGrow
        ? state.snake
        : state.snake.sublist(0, state.snake.length - 1);

    return body.contains(position);
  }

  Position calculateNextHead(SnakeGameState state, Direction direction) {
    final head = state.snake.first;

    return switch (direction) {
      Direction.up => Position(x: head.x, y: head.y - 1),
      Direction.down => Position(x: head.x, y: head.y + 1),
      Direction.left => Position(x: head.x - 1, y: head.y),
      Direction.right => Position(x: head.x + 1, y: head.y),
    };
  }

  SnakeTickResult tick(SnakeGameState state) {
    final events = <GameEvent>[];
    final newHead = calculateNextHead(state, state.direction);
    final ateFood = newHead == state.food;

    if (isCollision(state, newHead, willGrow: ateFood)) {
      final newState = state.copyWith(status: GameStatus.gameOver);
      events.add(const GameEvent.gameOver());
      return SnakeTickResult(state: newState, events: events);
    }

    final newSnake = [newHead, ...state.snake];

    if (!ateFood) {
      newSnake.removeLast();
    }

    final newScore = ateFood ? state.score + 1 : state.score;

    final oldLevel = config.levelForScore(state.score);
    final newLevel = config.levelForScore(newScore);

    final newState = state.copyWith(
      snake: newSnake,
      food: ateFood ? generateFood(newSnake) : state.food,
      score: newScore,
    );

    if (ateFood) {
      events.add(GameEvent.foodEaten(score: newScore));
    }

    if (newLevel != oldLevel) {
      events.add(GameEvent.levelChanged(level: newLevel));
    }

    return SnakeTickResult(state: newState, events: events);
  }

  Position generateFood(List<Position> snake) {
    while (true) {
      final position = Position(
        x: _random.nextInt(config.boardWidth),
        y: _random.nextInt(config.boardHeight),
      );

      if (!snake.contains(position)) {
        return position;
      }
    }
  }

  bool isOpposite(Direction current, Direction next) {
    return (current == Direction.up && next == Direction.down) ||
        (current == Direction.down && next == Direction.up) ||
        (current == Direction.left && next == Direction.right) ||
        (current == Direction.right && next == Direction.left);
  }
}
