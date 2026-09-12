import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.freezed.dart';

@freezed
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.foodEaten({required int score}) = FoodEaten;

  const factory GameEvent.levelChanged({required int level}) = LevelChanged;

  const factory GameEvent.gameOver() = GameOver;
}
