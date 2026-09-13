import 'game_tick_result.dart';

abstract interface class GameEngine<TState, TInput> {
  GameTickResult<TState> tick(TState state, TInput input);
}
