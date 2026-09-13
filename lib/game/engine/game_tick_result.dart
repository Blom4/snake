import 'package:freezed_annotation/freezed_annotation.dart';

import '../events/game_event.dart';

part 'game_tick_result.freezed.dart';

@freezed
abstract class GameTickResult<TState> with _$GameTickResult<TState> {
  const factory GameTickResult({
    required TState state,
    required List<GameEvent> events,
  }) = _GameTickResult<TState>;
}
