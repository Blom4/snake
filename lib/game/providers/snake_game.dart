import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/direction.dart';
import '../models/position.dart';
import '../models/snake_game_state.dart';

part 'snake_game.g.dart';

@riverpod
class SnakeGame extends _$SnakeGame {
  static const boardWidth = 20;
  static const boardHeight = 20;

  Timer? _timer;

  final Random _random = Random();

  @override
  SnakeGameState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return const SnakeGameState(
      snake: [
        Position(x: 10, y: 10),
        Position(x: 9, y: 10),
        Position(x: 8, y: 10),
      ],
      food: Position(x: 15, y: 10),
      direction: Direction.right,
      status: GameStatus.ready,
      score: 0,
    );
  }

  void start() {
    if (state.status == GameStatus.playing) {
      return;
    }

    state = state.copyWith(
      status: GameStatus.playing,
    );

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(milliseconds: 150),
      (_) => _tick(),
    );
  }

  void pause() {
    if (state.status != GameStatus.playing) {
      return;
    }

    _timer?.cancel();

    state = state.copyWith(
      status: GameStatus.paused,
    );
  }

  void reset() {
    _timer?.cancel();

    state = const SnakeGameState(
      snake: [
        Position(x: 10, y: 10),
        Position(x: 9, y: 10),
        Position(x: 8, y: 10),
      ],
      food: Position(x: 15, y: 10),
      direction: Direction.right,
      status: GameStatus.ready,
      score: 0,
    );
  }

  void changeDirection(Direction direction) {
    if (_isOpposite(state.direction, direction)) {
      return;
    }

    state = state.copyWith(
      direction: direction,
    );
  }

  bool _isOpposite(
    Direction current,
    Direction next,
  ) {
    return (current == Direction.up &&
            next == Direction.down) ||
        (current == Direction.down &&
            next == Direction.up) ||
        (current == Direction.left &&
            next == Direction.right) ||
        (current == Direction.right &&
            next == Direction.left);
  }

  void _tick() {
    if (state.status != GameStatus.playing) {
      return;
    }

    final head = state.snake.first;

    final newHead = switch (state.direction) {
      Direction.up => Position(
          x: head.x,
          y: head.y - 1,
        ),
      Direction.down => Position(
          x: head.x,
          y: head.y + 1,
        ),
      Direction.left => Position(
          x: head.x - 1,
          y: head.y,
        ),
      Direction.right => Position(
          x: head.x + 1,
          y: head.y,
        ),
    };

    if (_isCollision(newHead)) {
      _gameOver();
      return;
    }

    final ateFood = newHead == state.food;

    final newSnake = [
      newHead,
      ...state.snake,
    ];

    if (!ateFood) {
      newSnake.removeLast();
    }

    state = state.copyWith(
      snake: newSnake,
      food: ateFood
          ? _generateFood(newSnake)
          : state.food,
      score: ateFood
          ? state.score + 1
          : state.score,
    );
  }

  bool _isCollision(Position position) {
    // Wall collision.
    if (position.x < 0 ||
        position.x >= boardWidth ||
        position.y < 0 ||
        position.y >= boardHeight) {
      return true;
    }

    // Snake collision.
    return state.snake.contains(position);
  }

  Position _generateFood(List<Position> snake) {
    while (true) {
      final position = Position(
        x: _random.nextInt(boardWidth),
        y: _random.nextInt(boardHeight),
      );

      if (!snake.contains(position)) {
        return position;
      }
    }
  }

  void _gameOver() {
    _timer?.cancel();

    state = state.copyWith(
      status: GameStatus.gameOver,
    );
  }
}