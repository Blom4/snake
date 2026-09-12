import 'package:freezed_annotation/freezed_annotation.dart';

import '../events/game_event.dart';
import '../models/snake_game_state.dart';

part 'snake_tick_result.freezed.dart';

@freezed
abstract class SnakeTickResult with _$SnakeTickResult {
  const factory SnakeTickResult({
    required SnakeGameState state,
    required List<GameEvent> events,
  }) = _SnakeTickResult;
}
