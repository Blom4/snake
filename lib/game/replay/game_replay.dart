import '../engine/game_engine.dart';
import '../engine/game_input.dart';

class GameReplay<TState> {
  const GameReplay({required this.engine});

  final GameEngine<TState, GameInput> engine;

  TState run({required TState initialState, required List<GameInput> inputs}) {
    var state = initialState;

    for (final input in inputs) {
      final result = engine.tick(state, input);

      state = result.state;
    }

    return state;
  }
}
