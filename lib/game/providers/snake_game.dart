import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/direction.dart';
import '../models/position.dart';
import '../models/snake_game_state.dart';
import '../engine/snake_game_engine.dart';

part 'snake_game.g.dart';

@riverpod
class SnakeGame extends _$SnakeGame {
  static const boardWidth = 20;
  static const boardHeight = 20;

  // static const tickDuration = Duration(milliseconds: 150);
  final SnakeGameEngine _engine = SnakeGameEngine();

  Timer? _timer;

  final Random _random = Random();

  Direction? _nextDirection;

  SnakeGameState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return _engine.createInitialState();
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
    _nextDirection = null;

    state = state.copyWith(status: GameStatus.paused);
  }

  void reset() {
    _timer?.cancel();
    _nextDirection = null;
    state = _engine.createInitialState(difficulty: state.difficulty);
  }

  void changeDirection(Direction direction) {
    if (state.status != GameStatus.playing) {
      return;
    }

    final currentDirection = _nextDirection ?? state.direction;

    if (_engine.isOpposite(currentDirection, direction)) {
      return;
    }

    _nextDirection = direction;
  }

  void _tick() {
    if (state.status != GameStatus.playing) {
      return;
    }

    final direction = _nextDirection ?? state.direction;

    _nextDirection = null;

    state = state.copyWith(direction: direction);

    final previousScore = state.score;

    state = _engine.tick(state);

    if (state.status == GameStatus.gameOver) {
      _timer?.cancel();
      return;
    }

    if (state.score != previousScore) {
      _restartTimer();
    }
  }

  void _restartTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(_tickDuration, (_) => _tick());
  }

  // void _gameOver() {
  //   _timer?.cancel();

  //   state = state.copyWith(status: GameStatus.gameOver);
  // }
}
