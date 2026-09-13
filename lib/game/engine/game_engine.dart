import 'game_tick_result.dart';

abstract interface class GameEngine<TState> {
  GameTickResult<TState> tick(TState state);
}
