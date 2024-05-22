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
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Recorder and Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPage(),
    );
  }
}

class AudioPage extends StatefulWidget {
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
  late String _filePath;
  bool _isTranscribing = false;
  String _transcribedText = "";

  @override
  initState() {
    super.initState();
    _callFolderCreationMethod();

  }

  _callFolderCreationMethod() async {
    await AppUtil.createFolderInAppDocDir('recordings');
  }

  @override
  void dispose() {
    audioManager.dispose();
    /*_audioPlayer.dispose();
    _recorder.dispose();*/
    super.dispose();
  }

  Future<void> _transcribeRecording() async {
    print('in');
    final directory = await getApplicationDocumentsDirectory();
    _filePath = '${directory.path}/recordings/test-audio.wav';

    await _transcribeService.transcribe(_filePath!);

    setState(() {
      _isTranscribing = true;
      _transcribedText = _transcribeService.getTranscribedText();
      print('_transcribedText: $_transcribedText');
    });

  }

  /*Future<void> _startRecording() async {

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
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording(String path) async {
    final path2 = await _recorder.stop();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _playRecording(String path) async {
    if (_filePath != null) {
      await _audioPlayer.setFilePath(_filePath!);
      _totalDuration = _audioPlayer.duration?.inSeconds.toDouble() ?? 0;
      _audioPlayer.play();

      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position.inSeconds.toDouble();
        });
      });
    }
  }

  Future<void> _deleteRecording(String path) async{

    await File(path).delete();

  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text('lib')],
        title: const Text('Modern Audio Recorder'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
