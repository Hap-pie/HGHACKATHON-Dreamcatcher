import 'dart:io';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioManager{

  static AudioPlayer audioPlayer = AudioPlayer();
  static AudioRecorder _recorder = AudioRecorder();
  static bool isRecording = false;
  bool _recordSelected = false;
  static late String _filePath;

  static double currentPosition = 0;
  static double totalDuration = 0;



  static Future<void> startRecording() async {

    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) {
      return;
    }

    final directoryApp = await getApplicationDocumentsDirectory();
    final directory = '${directoryApp.path}/recordings';

    // Generate a unique file name using the current timestamp
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.wav';
    _filePath = '$directory/$fileName';

    // Define the configuration for the recording
    const config = RecordConfig(
      // Specify the format, encoder, sample rate, etc., as needed
      encoder: AudioEncoder.wav, // For example, using AAC codec
      sampleRate: 44100, // Sample rate
      bitRate: 128000, // Bit rate
      numChannels: 1,
    );

    // Start recording to file with the specified configuration
    await _recorder.start(config, path: _filePath!);
    isRecording = true;
  }

  static Future<void> stopRecording() async {
    final path2 = await _recorder.stop();
    isRecording = false;
  }

  Future<void> playRecording() async {
    if (_filePath != null) {
      await audioPlayer.setFilePath(_filePath);
      totalDuration = audioPlayer.duration?.inSeconds.toDouble() ?? 0;
      audioPlayer.play();

      audioPlayer.positionStream.listen((position) {
        currentPosition = position.inSeconds.toDouble();
      });
    }
  }

  Future<void> deleteRecording() async{

    await File(_filePath).delete();

  }

  void dispose() {
    audioPlayer.dispose();
    _recorder.dispose();

  }

}