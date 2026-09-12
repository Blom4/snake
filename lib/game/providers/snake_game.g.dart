// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_game.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SnakeGame)
final snakeGameProvider = SnakeGameProvider._();

final class SnakeGameProvider
    extends $NotifierProvider<SnakeGame, SnakeGameState> {
  SnakeGameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snakeGameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snakeGameHash();

  @$internal
  @override
  SnakeGame create() => SnakeGame();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SnakeGameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SnakeGameState>(value),
    );
  }
}

String _$snakeGameHash() => r'4188973b3ca61f7bb1088ddfb78554b0a3c95ab8';

abstract class _$SnakeGame extends $Notifier<SnakeGameState> {
  SnakeGameState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SnakeGameState, SnakeGameState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SnakeGameState, SnakeGameState>,
              SnakeGameState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
