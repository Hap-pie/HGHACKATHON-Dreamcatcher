import 'dart:io';
import 'package:dreamcathcer/recording_manager.dart';
import 'package:dreamcathcer/transcribe_service.dart';
import 'package:dreamcathcer/ui_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'design_elements.dart';

enum RecordingState { start, recording, transcribing, refining, archive }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Audio Recorder and Player',
      debugShowCheckedModeBanner: false,
      home: AudioPage(title: 'dreamcatcher'),
    );
  }
}

class AudioPage extends StatefulWidget {
  const AudioPage({super.key, required this.title});
  final String title;
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  AudioManager audioManager = AudioManager();
  final TranscribeService _transcribeService = TranscribeService();
  String _transcribedText = "";
  String dateCard = "";

  @override
  initState() {
    super.initState();
    _callFolderCreationMethod();
  }

  _callFolderCreationMethod() async {
    await AppUtil.createFolderInAppDocDir('recordings');
    await AppUtil.createFolderInAppDocDir('transcriptions');
  }

  @override
  void dispose() {
    audioManager.dispose();
    super.dispose();
  }

  Future<void> _transcribeRecording() async {
    await AudioManager.stopRecording();
    //if (kDebugMode) {
    print('Stopped recording, starting transcription process');
    //}
    final directory = await getApplicationDocumentsDirectory();

    String filePath = '${directory.path}/recordings/test-audio.wav';
    //if (kDebugMode) {
    print(filePath);
    //}

    //saving date of recording for the card
    DateTime timeNow = DateTime.now();
    dateCard =
        "${DateFormat('MMMM').format(timeNow)} ${timeNow.day}, ${DateFormat('EEEE').format(timeNow)}";
    setState(() {
      AudioManager.currentRecordingState = RecordingState.transcribing;
    });

    await _transcribeService.transcribe(filePath);

    setState(() {
      _transcribedText = _transcribeService.getTranscribedText();
      if (kDebugMode) {
        print('_transcribedText: $_transcribedText');
      }
      AudioManager.currentRecordingState = RecordingState.archive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1414),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(widget.title,
            style: GoogleFonts.urbanist(
                color: const Color(0xffFF9B71),
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(),
        AudioManager.currentRecordingState == RecordingState.archive
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateCard, style: DesignElements.dateStyle),
                    SizedBox(height: DesignElements.marginMedium),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Color(0xff523F3F)),
                        child: Column(
                          children: <Widget>[
                            beautifyButton(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 16),
                                  child: Center(
                                      child: Text('Card Title',
                                          style:
                                              DesignElements.cardTitleStyle)),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Text(_transcribedText,
                                        style: DesignElements.cardBodyStyle,
                                        softWrap: true)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Catch your first thought!',
                        style: DesignElements.emptyStateFontMerri),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Tap ▶ to begin',
                        style: DesignElements.emptyStateFontUrban)
                  ],
                ),
              ),

        //Lower bar with buttons that change depending on recording state
        Container(
          height: 114,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color(0xff3C3030),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: AudioManager.currentRecordingState == RecordingState.start
              ? Row(
                  children: [
                    SizedBox(width: DesignElements.marginDefault),
                    Text('Let\'s catch a thought',
                        style: DesignElements.ctaJosefin),
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: DesignElements.accentPink,
                      child: Center(
                        child: Ink(
                          decoration: ShapeDecoration(
                              color: DesignElements.mainPink,
                              shape: const CircleBorder()),
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () async => {
                              setState(() {
                                AudioManager.currentRecordingState =
                                    RecordingState.recording;
                              }),
                              AudioManager.startRecording(),
                            },
                            icon: const Icon(Icons.play_arrow),
                            color: DesignElements.mainPink,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: DesignElements.marginDefault),
                  ],
                )
              : AudioManager.currentRecordingState == RecordingState.recording
                  ? Row(
                      children: [
                        SizedBox(width: DesignElements.marginDefault),
                        Text(
                          "I'm listening...",
                          style: DesignElements.timerStyle,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text('00:00', style: DesignElements.timerStyle),
                            SizedBox(width: DesignElements.marginMedium),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: DesignElements.mainPink,
                              child: Center(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                      color: DesignElements.mainPink,
                                      shape: const CircleBorder()),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: _transcribeRecording,
                                    icon: const Icon(Icons.square),
                                    color: DesignElements.accentPink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: DesignElements.marginDefault),
                          ],
                        ),
                      ],
                    )
                  : AudioManager.currentRecordingState ==
                          RecordingState.transcribing
                      ? Row(
                          children: [
                            SizedBox(width: DesignElements.marginDefault),
                            Text(
                              "Tidying up your thoughts...",
                              style: DesignElements.timerStyle,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text('00:00', style: DesignElements.timerStyle),
                                SizedBox(width: DesignElements.marginMedium),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: DesignElements.mainPink,
                                  child: Center(
                                    child: Ink(
                                      decoration: ShapeDecoration(
                                          color: DesignElements.mainPink,
                                          shape: const CircleBorder()),
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: null,
                                        icon: const Icon(Icons.square),
                                        color: DesignElements.accentPink,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: DesignElements.marginDefault),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            SizedBox(width: DesignElements.marginDefault),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffAD9692),
                              ),
                              onPressed: () async => {
                                await audioManager.deleteRecording(),
                                setState(() {
                                  AudioManager.currentRecordingState =
                                      RecordingState.start;
                                })
                              },
                              child: Text(
                                'Discard',
                                style: GoogleFonts.urbanist(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff1B1414)),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text('01:21', style: DesignElements.timerStyle),
                                SizedBox(width: DesignElements.marginMedium),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(120, 60),
                                      backgroundColor:
                                          DesignElements.accentPink,
                                    ),
                                    onPressed: () => {
                                      setState(() {
                                        AudioManager.currentRecordingState =
                                            RecordingState.start;
                                      })
                                    },
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.urbanist(
                                          letterSpacing: 1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: DesignElements.mainPink),
                                    ),
                                  ),
                                ),
                                SizedBox(width: DesignElements.marginDefault),
                              ],
                            ),
                          ],
                        ),
        )
      ]),
    );
  }
}

class AppUtil {
  static Future<String> createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder =
        Directory('${appDocDir.path}/$folderName/');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder =
          await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }
}
