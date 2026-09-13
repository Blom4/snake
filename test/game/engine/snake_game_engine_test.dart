import 'package:flutter_test/flutter_test.dart';
import 'package:snake/game/engine/game_input.dart';

import 'package:snake/game/engine/snake_game_engine.dart';
import 'package:snake/game/events/game_event.dart';
import 'package:snake/game/models/direction.dart';
import 'package:snake/game/models/snake_game_state.dart';
import 'package:snake/game/models/position.dart';
import 'package:snake/game/random/dart_game_random.dart';
import 'package:snake/game/replay/game_replay.dart';

import '../random/fake_game_random.dart';

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

      final result = engine.tick(state, DirectionInput(Direction.right));

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

      final result = engine.tick(state, DirectionInput(Direction.right));

      expect(result.state.status, GameStatus.gameOver);
    });
  });

  test('moves snake in the supplied direction', () {
    final engine = SnakeGameEngine(random: FakeGameRandom([5, 5]));

    final state = engine.createInitialState();

    final result = engine.tick(state, DirectionInput(Direction.down));

    expect(result.state.snake.first, const Position(x: 10, y: 11));

    expect(result.state.direction, Direction.down);
  });

  test('detects wall collision', () {
    final engine = SnakeGameEngine(random: FakeGameRandom([5, 5]));
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

    final result = engine.tick(state, DirectionInput(Direction.right));

    expect(result.state.status, GameStatus.gameOver);

    expect(result.events, contains(const GameEvent.gameOver()));
  });

  test('replays the same inputs deterministically', () {
    final engine = SnakeGameEngine(random: DartGameRandom());

    final initialState = engine.createInitialState();

    final replay = GameReplay<SnakeGameState>(engine: engine);

    final inputs = [
      const DirectionInput(Direction.down),
      const DirectionInput(Direction.left),
      const DirectionInput(Direction.up),
    ];

    final result = replay.run(initialState: initialState, inputs: inputs);

    expect(result.snake.first, const Position(x: 9, y: 10));
  });

  test('same inputs produce the same final state', () {
    final engine = SnakeGameEngine();

    final initialState = engine.createInitialState();

    final replay = GameReplay<SnakeGameState>(engine: engine);

    final inputs = [
      const DirectionInput(Direction.down),
      const DirectionInput(Direction.left),
      const DirectionInput(Direction.up),
    ];

    final first = replay.run(initialState: initialState, inputs: inputs);

    final second = replay.run(initialState: initialState, inputs: inputs);

    expect(first.snake, second.snake);
    expect(first.food, second.food);
    expect(first.score, second.score);
    expect(first.direction, second.direction);
    expect(first.status, second.status);
  });

  test('replay produces the same result when food is eaten', () {
    final random = FakeGameRandom([5, 5]);

    final engine = SnakeGameEngine(random: random);

    final initialState = SnakeGameState(
      snake: const [
        Position(x: 10, y: 10),
        Position(x: 9, y: 10),
        Position(x: 8, y: 10),
      ],
      food: const Position(x: 11, y: 10),
      direction: Direction.right,
      status: GameStatus.playing,
      score: 0,
      difficulty: GameDifficulty.normal,
    );

    final result = engine.tick(
      initialState,
      const DirectionInput(Direction.right),
    );

    expect(result.state.score, 1);

    expect(result.state.snake.first, const Position(x: 11, y: 10));

    expect(result.state.snake.length, 4);

    expect(result.state.food, const Position(x: 5, y: 5));
  });

  test('replay produces the same result when food is eaten', () {
    final random = FakeGameRandom([5, 5]);

    final engine = SnakeGameEngine(random: random);

    final initialState = SnakeGameState(
      snake: const [
        Position(x: 10, y: 10),
        Position(x: 9, y: 10),
        Position(x: 8, y: 10),
      ],
      food: const Position(x: 11, y: 10),
      direction: Direction.right,
      status: GameStatus.playing,
      score: 0,
      difficulty: GameDifficulty.normal,
    );

    final result = engine.tick(
      initialState,
      const DirectionInput(Direction.right),
    );

    expect(result.state.score, 1);

    expect(result.state.snake.first, const Position(x: 11, y: 10));

    expect(result.state.snake.length, 4);

    expect(result.state.food, const Position(x: 5, y: 5));
  });
}
