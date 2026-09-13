import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snake/game/commands/game_command.dart';
import 'package:snake/game/events/game_event.dart';

import '../models/direction.dart';
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

  Direction? _nextDirection;

  final StreamController<GameEvent> _eventController =
      StreamController<GameEvent>.broadcast();

  Stream<GameEvent> get events => _eventController.stream;

  @override
  SnakeGameState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _eventController.close();
    });

    return _engine.createInitialState();
  }

  void dispatch(GameCommand command) {
    switch (command) {
      case StartGame():
        start();

      case PauseGame():
        pause();

      case ResetGame():
        reset();

      case ChangeDirection(:final direction):
        changeDirection(direction);
    }
  }

  void setDifficulty(GameDifficulty difficulty) {
    if (state.status == GameStatus.playing) {
      return;
    }

    state = state.copyWith(difficulty: difficulty);
  }

  Duration get _tickDuration {
    final milliseconds = _engine.config.speedFor(
      difficulty: state.difficulty,
      level: _level,
    );

    return Duration(milliseconds: milliseconds);
  }

  int get _level => _engine.config.levelForScore(state.score);

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

    final result = _engine.tick(state);

    state = result.state;

    _handleEvents(result.events);

    if (state.status == GameStatus.gameOver) {
      _timer?.cancel();
      return;
    }

    if (state.score != previousScore) {
      _restartTimer();
    }
  }

  void _handleEvents(List<GameEvent> events) {
    for (final event in events) {
      _eventController.add(event);
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
