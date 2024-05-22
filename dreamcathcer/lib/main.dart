/*
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'design_elements.dart';
import 'package:google_gemini/google_gemini.dart';

//Github Version

const apiKey = "AIzaSyCO97zqOFtIw_qIwtC_DIbtAYmbsAdMdxY";


void main() {



  runApp(const MyApp());
}

bool playOrStopHandler = true;

enum RecordingState { defaultState, recording, archiveState}
var currentRecordingState = RecordingState.defaultState; 

Color emptyPink =  Color(0xffA08B87);
Color mainPink =  Color(0xffF9DBD4);
Color accentPink = Color(0xffB55051);


double marginXLarge = 64;
double marginDefault = 16;
double marginMedium = 12;
double marginXSmall = 4;

TextStyle emptyStateFontMerri = GoogleFonts.merriweather(
  color: emptyPink,
  fontSize: 22,
  fontWeight: FontWeight.bold,
  letterSpacing: 2
);

TextStyle emptyStateFontUrban = GoogleFonts.urbanist(
  color: emptyPink,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5
);

TextStyle ctaJosefin = GoogleFonts.urbanist(
  color: mainPink,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  letterSpacing: 1
);

TextStyle timer = GoogleFonts.urbanist(
  color: mainPink,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  letterSpacing: 0
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dreamcatcher App',
      home: MyHomePage(title: 'dreamcatcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  late RecordingState _recordingState;
  @override
  Widget build(BuildContext context) {
    _recordingState = currentRecordingState;
    currentRecordingState = currentRecordingState;
    return Scaffold(
      backgroundColor: const Color(0xff1B1414),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: 
          Text(
            widget.title, 
            style: GoogleFonts.urbanist(
              color: const Color(0xffFF9B71),
              fontSize: 22,
              fontWeight: FontWeight.bold
            )),),
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Catch your first thought',
               style: emptyStateFontMerri
                ),
                // Column Margin
                SizedBox(height: marginMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      'Tap',
                      style: emptyStateFontUrban,
                      ),
                    SizedBox(width: marginXSmall),
                    Icon(
                      Icons.play_arrow,
                      color: DesignElements.emptyPink,
                    ),
                    SizedBox(width: marginXSmall),
                    Text(
                      'to begin',
                      style: emptyStateFontUrban,
                    ),
                
                  ],
                ),
                SizedBox(height: marginXLarge)
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
               height: 114, 
               width: MediaQuery.of(context).size.width,
               decoration: const BoxDecoration(
                color: Color(0xff3C3030),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  
                )
               ),
               child: StartRecordingWidget(),
               )
              ),

          Positioned(
            bottom: 120,
            child: Container(
               height: 114, 
               width: MediaQuery.of(context).size.width,
               decoration: const BoxDecoration(
                color: Color(0xff3C3030),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  
                )
               ),
               child: StopRecordingWidget(),
               )
              ),

            Positioned(
              bottom: 240,
              child: Container(
                height: 114, 
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff3C3030),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  
              )
              ),
               child: ArchiveBottomBarState(),
            )
          ),

          ]
        ),
      ),
    );
  }



}



Widget buttonHandler(RecordingState state) {
  switch (state) {

    case RecordingState.defaultState: 
      print('state: $state');
      return StartRecordingWidget();
    

    case RecordingState.recording: 
      print('state: $state');
      return StopRecordingWidget();
 

    default: return Container();
  }
} 

class StartRecordingWidget extends StatefulWidget {
  const StartRecordingWidget({super.key});

  @override
  State<StartRecordingWidget> createState() => _StartRecordingWidgetState();
}

class _StartRecordingWidgetState extends State<StartRecordingWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(width: marginDefault),

        Text( 
          'Lets catch a thought',
          style: ctaJosefin
          ),

        Spacer(),

        CircleAvatar(
          radius: 30,
          backgroundColor: accentPink,
          child: Center(
            child: Ink(
            decoration: ShapeDecoration(
              color: mainPink,
              shape: CircleBorder()
            ),
            child: IconButton(
              iconSize: 35,
              onPressed: () => setState(() {

                // Start recording function here
                                    
              }), 
              icon: Icon(Icons.play_arrow),
              color: mainPink,
            ),
          ),
        ),
        ),

        SizedBox(width: marginDefault),
        
      ],
    );
  }
}

class StopRecordingWidget extends StatefulWidget {
  const StopRecordingWidget({super.key});

  @override
  State<StopRecordingWidget> createState() => _StopRecordingWidgetState();
}

class _StopRecordingWidgetState extends State<StopRecordingWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(width: marginDefault),

        Text(
          "I'm listening...",
          style: timer,
        ),

        Spacer(),

        Row(
          children: [
            Text('00:00', style: timer),
            SizedBox(width: marginMedium),
            CircleAvatar(
              radius: 30,
              backgroundColor: mainPink,
              child: Center(
                child: Ink(
                decoration: ShapeDecoration(
                  color: mainPink,
                  shape: CircleBorder()
                ),
                child: IconButton(
                  iconSize: 20,
                  onPressed: () => setState(() {
                    
                    // Stop recording function here
                                        
                  }), 
                  icon: Icon(Icons.square),
                  color: accentPink,
                ),
              ),
            ),
            ),

          SizedBox(width: marginDefault),

          ],
        ),
      ],
    );
  }
}

class ArchiveBottomBarState extends StatefulWidget {
  const ArchiveBottomBarState({super.key});

  @override
  State<ArchiveBottomBarState> createState() => __ArchiveBottomBarStateState();
}

class __ArchiveBottomBarStateState extends State<ArchiveBottomBarState> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(width: marginDefault),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            
            backgroundColor: Color(0xffAD9692),
          ),
          onPressed: () {
            // delete recording function here
          },
          child: Text(
            'Discard', style: GoogleFonts.urbanist(letterSpacing: 1, fontWeight: FontWeight.bold, color: Color(0xff1B1414)),
          ),
          ),

        Spacer(),

        Row(
          children: [
            Text('01:21', style: timer),
            SizedBox(width: marginMedium),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(120, 60),
                  backgroundColor: accentPink,
                ),
              onPressed: () {
                catch
              },
              child: Text(
                'Save', style: GoogleFonts.urbanist(letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.bold, color: mainPink),
              ),
                          ),
                      ),

          SizedBox(width: marginDefault),

          ],
        ),
      ],
    );
  }
}*/

import 'dart:io';

import 'package:dreamcathcer/recording_manager.dart';
import 'package:dreamcathcer/transcribe_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import 'design_elements.dart';

enum RecordingState { start, recording, archive }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Recorder and Player',

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
  /*final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  late String _filePath;
  double _currentPosition = 0;
  double _totalDuration = 0;
  late List<String> fileList;*/
  AudioManager audioManager = AudioManager();
  TranscribeService _transcribeService = TranscribeService();
  // late String _filePath;
  bool _isTranscribing = false;
  String _transcribedText = "";

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
    print('in');
    final directory = await getApplicationDocumentsDirectory();
    String filePath = '';
    filePath = '${directory.path}/recordings/test-audio.wav';
    print(filePath);

    setState(() {

    });

    await _transcribeService.transcribe(filePath!);

    setState(() {
      _isTranscribing = true;
      ///TODO:
      ///changing UI while waiting for the transcribing service
      ///print the transcribed message
      ///give option to replay audio (I guess)
      _transcribedText = _transcribeService.getTranscribedText();
      print('_transcribedText: $_transcribedText');
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
      body: Stack(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AudioManager.isRecording ? Icons.mic : Icons.mic_none,
              size: 100,
              color: AudioManager.isRecording ? Colors.red : Colors.blue,
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: AudioManager.isRecording ? null : () async => { await AudioManager.startRecording(),
                    setState(() {})
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Record'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: AudioManager.isRecording ? () async => {await AudioManager.stopRecording(),

                    setState(() {})
                  } : null,//_stopRecording(_filePath!) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Stop'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !AudioManager.isRecording ? () async => {await audioManager.playRecording(), setState(() {})} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Play'),
            ),


            Slider(
              value: AudioManager.currentPosition,
              max: AudioManager.totalDuration,
              onChanged: (value) {
                setState(() {
                  AudioManager.currentPosition = value;
                });
                AudioManager.audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: !AudioManager.isRecording ? () => audioManager.deleteRecording() : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Delete'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _transcribeRecording, /*_isTranscribing ? () {} : _transcribeRecording,*//*!AudioManager.isRecording ? () => _transcribeRecording : null,*/
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Transcribe'),
            ),


          ],
        ),
          Positioned(
            bottom: 0,
            child: Container(
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
                    SizedBox(width: DesignElements.marginDefault ),
                    Text('Lets catch a thought', style: DesignElements.ctaJosefin),
                    Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: DesignElements.accentPink,
                      child: Center(
                        child: Ink(
                          decoration: ShapeDecoration(
                              color: DesignElements.mainPink, shape: CircleBorder()),
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () async => { await AudioManager.startRecording(),
                              setState(() {})
                            },
                            icon: Icon(Icons.play_arrow),
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
                    Spacer(),
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
                                  shape: CircleBorder()),
                              child: IconButton(
                                iconSize: 20,
                                onPressed:
                                  _transcribeRecording,

                                icon: Icon(Icons.square),
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
                        backgroundColor: Color(0xffAD9692),
                      ),
                      onPressed: () async => {
                            await audioManager.deleteRecording(),
                        setState(() {

                        })
                      },
                      child: Text(
                        'Discard',
                        style: GoogleFonts.urbanist(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1B1414)),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text('01:21', style: DesignElements.timerStyle),
                        SizedBox(width: DesignElements.marginMedium),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(120, 60),
                              backgroundColor: DesignElements.accentPink,
                            ),
                            onPressed: () => {
                        AudioManager.currentRecordingState =
                        RecordingState.start,
                        setState(() {

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
            ),
          )
        ]
      ),
    );
  }


}

class AppUtil{

  static Future<String> createFolderInAppDocDir(String folderName) async {

    //Get this App Document Directory
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =  Directory('${_appDocDir.path}/$folderName/');

    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      return _appDocDirFolder.path;
    }else{//if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }





}
