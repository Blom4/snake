import 'dart:math';

import '../models/direction.dart';
import '../models/position.dart';
import '../models/snake_game_state.dart';

class SnakeGameEngine {
  SnakeGameEngine({this.boardWidth = 20, this.boardHeight = 20, Random? random})
    : _random = random ?? Random();

  final int boardWidth;
  final int boardHeight;

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
        position.x >= boardWidth ||
        position.y < 0 ||
        position.y >= boardHeight) {
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

  SnakeGameState tick(SnakeGameState state) {
    final newHead = calculateNextHead(state, state.direction);

    final ateFood = newHead == state.food;

    if (isCollision(state, newHead, willGrow: ateFood)) {
      return state.copyWith(status: GameStatus.gameOver);
    }

    final newSnake = [newHead, ...state.snake];

    if (!ateFood) {
      newSnake.removeLast();
    }

    return state.copyWith(
      snake: newSnake,
      food: ateFood ? generateFood(newSnake) : state.food,
      score: ateFood ? state.score + 1 : state.score,
    );
  }

  Position generateFood(List<Position> snake) {
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

  bool isOpposite(Direction current, Direction next) {
    return (current == Direction.up && next == Direction.down) ||
        (current == Direction.down && next == Direction.up) ||
        (current == Direction.left && next == Direction.right) ||
        (current == Direction.right && next == Direction.left);
  }
}
