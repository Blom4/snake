// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_game_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(snakeGameEvents)
final snakeGameEventsProvider = SnakeGameEventsProvider._();

final class SnakeGameEventsProvider
    extends
        $FunctionalProvider<AsyncValue<GameEvent>, GameEvent, Stream<GameEvent>>
    with $FutureModifier<GameEvent>, $StreamProvider<GameEvent> {
  SnakeGameEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snakeGameEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snakeGameEventsHash();

  @$internal
  @override
  $StreamProviderElement<GameEvent> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<GameEvent> create(Ref ref) {
    return snakeGameEvents(ref);
  }
}

String _$snakeGameEventsHash() => r'27da0b48943d6e45960efa73adc841541256e37a';
