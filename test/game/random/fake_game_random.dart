import 'package:snake/game/random/game_random.dart';

class FakeGameRandom implements GameRandom {
  FakeGameRandom(this.values);

  final List<int> values;
  int _index = 0;

  @override
  int nextInt(int max) {
    final value = values[_index];
    _index++;

    if (value < 0 || value >= max) {
      throw ArgumentError('Value $value is outside range 0..${max - 1}');
    }

    return value;
  }
}
