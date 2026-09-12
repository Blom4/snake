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

  // static const tickDuration = Duration(milliseconds: 150);

  Timer? _timer;

  final Random _random = Random();

  Direction? _nextDirection;

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
      difficulty: GameDifficulty.normal,
    );
  }

  void setDifficulty(GameDifficulty difficulty) {
    if (state.status == GameStatus.playing) {
      return;
    }

    state = state.copyWith(difficulty: difficulty);
  }

  Duration get _tickDuration {
    final baseSpeed = switch (state.difficulty) {
      GameDifficulty.easy => 220,
      GameDifficulty.normal => 150,
      GameDifficulty.hard => 90,
    };

    final speedIncrease = (_level - 1) * 10;

    final milliseconds = baseSpeed - speedIncrease;

    return Duration(milliseconds: milliseconds.clamp(50, 220));
  }

  int get _level {
    return (state.score ~/ 5) + 1;
  }

  void start() {
    if (state.status == GameStatus.gameOver) {
      reset();
    }

    if (state.status == GameStatus.playing) {
      return;
    }

    state = state.copyWith(status: GameStatus.playing);

    _restartTimer();
  }

  void pause() {
    if (state.status != GameStatus.playing) {
      return;
    }

    _timer?.cancel();

    state = state.copyWith(status: GameStatus.paused);
  }

  void reset() {
    _timer?.cancel();

    _nextDirection = null;

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
      difficulty: GameDifficulty.normal,
    );
  }

  void changeDirection(Direction direction) {
    final currentDirection = _nextDirection ?? state.direction;

    if (_isOpposite(currentDirection, direction)) {
      return;
    }

    _nextDirection = direction;
  }

  bool _isOpposite(Direction current, Direction next) {
    return (current == Direction.up && next == Direction.down) ||
        (current == Direction.down && next == Direction.up) ||
        (current == Direction.left && next == Direction.right) ||
        (current == Direction.right && next == Direction.left);
  }

  void _tick() {
    if (state.status != GameStatus.playing) {
      return;
    }

    final direction = _nextDirection ?? state.direction;

    _nextDirection = null;

    final head = state.snake.first;

    final newHead = switch (state.direction) {
      Direction.up => Position(x: head.x, y: head.y - 1),
      Direction.down => Position(x: head.x, y: head.y + 1),
      Direction.left => Position(x: head.x - 1, y: head.y),
      Direction.right => Position(x: head.x + 1, y: head.y),
    };

    final ateFood = newHead == state.food;

    if (_isCollision(newHead, willGrow: ateFood)) {
      _gameOver();
      return;
    }

    final newSnake = [newHead, ...state.snake];

    if (!ateFood) {
      newSnake.removeLast();
    }

    state = state.copyWith(
      snake: newSnake,
      direction: direction,
      food: ateFood ? _generateFood(newSnake) : state.food,
      score: ateFood ? state.score + 1 : state.score,
    );

    if (ateFood) {
      _restartTimer();
    }
  }

  void _restartTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(_tickDuration, (_) => _tick());
  }

  bool _isCollision(Position position, {required bool willGrow}) {
    // Wall collision.
    if (position.x < 0 ||
        position.x >= boardWidth ||
        position.y < 0 ||
        position.y >= boardHeight) {
      return true;
    }

    // If the snake is not growing, its tail will move away
    // during this tick, so don't treat the tail as a collision.
    final body = willGrow
        ? state.snake
        : state.snake.sublist(0, state.snake.length - 1);

    return body.contains(position);
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

    state = state.copyWith(status: GameStatus.gameOver);
  }
}
