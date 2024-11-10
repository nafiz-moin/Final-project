import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart' show rootBundle;

class AudioPlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Method to play audio from asset
  Future<void> playSound(String assetPath) async {
    try {
      // Load the asset as a ByteData
      final byteData = await rootBundle.load(assetPath);

      // Convert ByteData to Uint8List
      final bytes = byteData.buffer.asUint8List();

      // Play audio from bytes
      await _audioPlayer.play(BytesSource(bytes));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  // Method to stop audio
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  // Dispose the player when done
  void dispose() {
    _audioPlayer.dispose();
  }
}
