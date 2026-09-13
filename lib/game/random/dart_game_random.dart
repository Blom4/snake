import 'dart:math';

import 'game_random.dart';

class DartGameRandom implements GameRandom {
  DartGameRandom({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  int nextInt(int max) {
    return _random.nextInt(max);
  }
}
