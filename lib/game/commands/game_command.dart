import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/direction.dart';

part 'game_command.freezed.dart';

@freezed
sealed class GameCommand with _$GameCommand {
  const factory GameCommand.start() = StartGame;

  const factory GameCommand.pause() = PauseGame;

  const factory GameCommand.reset() = ResetGame;

  const factory GameCommand.changeDirection(Direction direction) =
      ChangeDirection;
}
