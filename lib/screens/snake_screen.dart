import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake/game/commands/game_command.dart';
import 'package:snake/game/effects/game_effects.dart';
import 'package:snake/game/events/game_event.dart';
import 'package:snake/game/providers/snake_game_events.dart';

import '../game/models/direction.dart';
import '../game/models/snake_game_state.dart';
import '../game/providers/snake_game.dart';
import '../game/widgets/snake_board.dart';

class SnakeScreen extends ConsumerStatefulWidget {
  const SnakeScreen({super.key});

  @override
  ConsumerState<SnakeScreen> createState() {
    return _SnakeScreenState();
  }
}

class _SnakeScreenState extends ConsumerState<SnakeScreen>
    with WidgetsBindingObserver {
  final GameEffects _effects = GameEffects();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _effects.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      ref.read(snakeGameProvider.notifier).pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.watch(snakeGameProvider);

    ref.listen(snakeGameEventsProvider, (_, next) {
      final event = next.value;

      if (event == null) {
        return;
      }

      _effects.handle(event);

      switch (event) {
        case FoodEaten(:final score):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Food eaten! Score: $score'),
              duration: const Duration(milliseconds: 500),
            ),
          );

        case LevelChanged(:final level):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Level $level!'),
              duration: const Duration(milliseconds: 700),
            ),
          );

        case GameOver():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Game Over!')));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Blomitek Snake'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Score: ${game.score}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Level: ${(game.score ~/ 5) + 1}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            DropdownButton<GameDifficulty>(
              value: game.difficulty,
              items: GameDifficulty.values.map((difficulty) {
                return DropdownMenuItem(
                  value: difficulty,
                  child: Text(difficulty.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (difficulty) {
                if (difficulty == null) {
                  return;
                }

                ref.read(snakeGameProvider.notifier).setDifficulty(difficulty);
              },
            ),

            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SnakeBoard(
                      snake: game.snake,
                      food: game.food,
                      boardSize: SnakeGame.boardWidth,
                      onDirectionChanged: (direction) {
                        ref
                            .read(snakeGameProvider.notifier)
                            .changeDirection(direction);
                      },
                    ),
                  ),
                ),
              ),
            ),

            _GameStatus(status: game.status),

            const SizedBox(height: 12),

            _Controls(ref: ref),

            const SizedBox(height: 12),

            _GameButtons(ref: ref, status: game.status),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _GameStatus extends StatelessWidget {
  const _GameStatus({required this.status});

  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      GameStatus.ready => const Text('Ready'),
      GameStatus.playing => const Text('Playing'),
      GameStatus.paused => const Text('Paused'),
      GameStatus.gameOver => const Text(
        'GAME OVER',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    };
  }
}

class _Controls extends StatelessWidget {
  const _Controls({required this.ref});

  final WidgetRef ref;

  void _changeDirection(Direction direction) {
    ref.read(snakeGameProvider.notifier).changeDirection(direction);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            _changeDirection(Direction.up);
          },
          icon: const Icon(Icons.arrow_upward),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _changeDirection(Direction.left);
              },
              icon: const Icon(Icons.arrow_back),
            ),

            const SizedBox(width: 50),

            IconButton(
              onPressed: () {
                _changeDirection(Direction.right);
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),

        IconButton(
          onPressed: () {
            _changeDirection(Direction.down);
          },
          icon: const Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}

class _GameButtons extends StatelessWidget {
  const _GameButtons({required this.ref, required this.status});

  final WidgetRef ref;
  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (status != GameStatus.playing)
          ElevatedButton(
            onPressed: () => ref
                .read(snakeGameProvider.notifier)
                .dispatch(const GameCommand.start()),
            child: Text(status == GameStatus.gameOver ? 'Play Again' : 'Start'),
          ),

        if (status == GameStatus.playing)
          ElevatedButton(
            onPressed: () => ref
                .read(snakeGameProvider.notifier)
                .dispatch(const GameCommand.pause()),
            child: const Text('Pause'),
          ),

        const SizedBox(width: 10),

        OutlinedButton(
          onPressed: () => ref
              .read(snakeGameProvider.notifier)
              .dispatch(const GameCommand.reset()),
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
