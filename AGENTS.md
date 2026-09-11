# AGENTS.md

Flutter Snake app (Dart SDK ^3.13.3, Flutter stable). Uses Riverpod for state, Freezed for models, with codegen.

## Commands

- `flutter analyze` — lint/static analysis (works on `lib/`); exits 1 due to the stale template test error (see below) and two `depend_on_referenced_packages` info lints, so don't gate on its exit code.
- `dart run build_runner build --delete-conflicting-outputs` — regenerate `.freezed.dart` / `.g.dart` after editing a Freezed model or a `@riverpod` provider. Generated files are committed to the repo.
- `flutter test` — currently **broken**: `test/widget_test.dart` is the untouched Flutter template and references a nonexistent `MyApp`/counter. It fails to compile. Don't rely on it as a signal; if you touch tests, fix or replace it.

## Architecture

- `lib/main.dart` — entrypoint wraps app in `ProviderScope`; active code is the Riverpod `SnakeApp`. The bottom ~350 lines are a commented-out pre-Riverpod `StatefulWidget` prototype (Timer + `setState`) — dead code, don't restore or port it.
- `lib/game/providers/snake_game.dart` — all game logic lives in the `SnakeGame` notifier (`@riverpod class SnakeGame extends _$SnakeGame`), not in widgets. Board size constants `boardWidth`/`boardHeight` (=20) live here.
- `lib/game/models/` — `Position` and `SnakeGameState` are Freezed; `Direction`, `GameStatus` are plain enums.
- `lib/game/widgets/snake_board.dart` — rendering only via `CustomPainter`.
- `lib/screens/snake_screen.dart` — UI, reads `snakeGameProvider`, dispatches to `ref.read(snakeGameProvider.notifier)`.

## Gotchas

- Adding a field to `SnakeGameState` will break its `const` constructor calls in `snake_game.dart` (requires the new field too).
- The Freezed models import `freezed_annotation` (position.dart, snake_game_state.dart) but it isn't declared as a direct dependency in `pubspec.yaml` — it comes in transitively. This shows as the two `depend_on_referenced_packages` info lints.
- Git repo `main` has no commits yet.