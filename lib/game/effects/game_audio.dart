import 'package:audioplayers/audioplayers.dart';

class GameAudio {
  GameAudio() : _player = AudioPlayer();

  final AudioPlayer _player;

  Future<void> playFood() async {
    await _player.play(AssetSource('sounds/food.mp3'));
  }

  Future<void> playLevelUp() async {
    await _player.play(AssetSource('sounds/level_up.mp3'));
  }

  Future<void> playGameOver() async {
    await _player.play(AssetSource('sounds/game_over.mp3'));
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
