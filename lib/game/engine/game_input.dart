import '../models/direction.dart';

sealed class GameInput {
  const GameInput();
}

final class DirectionInput extends GameInput {
  const DirectionInput(this.direction);

  final Direction direction;
}
