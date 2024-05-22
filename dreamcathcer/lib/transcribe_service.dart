import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_speech/google_speech.dart';

class TranscribeService {

  String _transcribedText = 'Placeholder';

  String getTranscribedText() {
    return _transcribedText;
  }

  transcribe(String filePath) async {
    const serviceAccountKey = 'assets/hgdreamcatcher-ce907bf0d6cc.json';

    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString(serviceAccountKey)));

    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);

    final config = RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      languageCode: 'en-US',
      audioChannelCount: 1,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 44100,
    );

    // Accesses the filePath argument from transcribe function above
    // /data/user/0/com.example.hg_hackathon/flutter_assets/recordings/$name'
    Future<List<int>> _getAudioContent() async {
      return File(filePath).readAsBytesSync().toList();
    }

    final audio = await _getAudioContent();
    await speechToText.recognize(config, audio).then((value) {
      _transcribedText = value.results.map((e) => e.alternatives.first.transcript).join('\n');
    });

  }


}