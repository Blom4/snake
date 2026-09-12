import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../events/game_event.dart';
import 'snake_game.dart';

part 'snake_game_events.g.dart';

@riverpod
Stream<GameEvent> snakeGameEvents(Ref ref) {
  final game = ref.watch(snakeGameProvider.notifier);

  return game.events;
}
