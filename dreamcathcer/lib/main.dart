import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Github Version

void main() {
  runApp(const MyApp());
}

Widget BottomRecordingBar = Container();

enum RecordingState { start, recording, archive }

var currentRecordingState = RecordingState.start;

Color emptyPink = Color(0xffA08B87);
Color mainPink = Color(0xffF9DBD4);
Color accentPink = Color(0xffB55051);

double marginXLarge = 64;
double marginDefault = 16;
double marginMedium = 12;
double marginXSmall = 4;

TextStyle emptyStateFontMerri = GoogleFonts.merriweather(
    color: emptyPink,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 2);

TextStyle emptyStateFontUrban = GoogleFonts.urbanist(
    color: emptyPink,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5);

TextStyle ctaJosefin = GoogleFonts.urbanist(
    color: mainPink,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

TextStyle timer = GoogleFonts.urbanist(
    color: mainPink,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0);

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
      body: Center(
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Catch your first thought', style: emptyStateFontMerri),
              // Column Margin
              SizedBox(height: marginMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tap',
                    style: emptyStateFontUrban,
                  ),
                  SizedBox(width: marginXSmall),
                  Icon(
                    Icons.play_arrow,
                    color: emptyPink,
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
                      )),
                  child: currentRecordingState == RecordingState.start
                      ? Row(
                          children: [
                            SizedBox(width: marginDefault),
                            Text('Lets catch a thought', style: ctaJosefin),
                            Spacer(),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: accentPink,
                              child: Center(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                      color: mainPink, shape: CircleBorder()),
                                  child: IconButton(
                                    iconSize: 35,
                                    onPressed: () => setState(() {
                                      currentRecordingState =
                                          RecordingState.recording;
                                    }),
                                    icon: Icon(Icons.play_arrow),
                                    color: mainPink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: marginDefault),
                          ],
                        )
                      : currentRecordingState == RecordingState.recording
                          ? Row(
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
                                              shape: CircleBorder()),
                                          child: IconButton(
                                            iconSize: 20,
                                            onPressed: () => setState(() {
                                              currentRecordingState =
                                                  RecordingState.archive;
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
                            )
                          : Row(
                              children: [
                                SizedBox(width: marginDefault),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffAD9692),
                                  ),
                                  onPressed: () {},
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
                                    Text('01:21', style: timer),
                                    SizedBox(width: marginMedium),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(120, 60),
                                          backgroundColor: accentPink,
                                        ),
                                        onPressed: () => setState(() {
                                          currentRecordingState =
                                              RecordingState.start;
                                        }),
                                        child: Text(
                                          'Save',
                                          style: GoogleFonts.urbanist(
                                              letterSpacing: 1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: mainPink),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: marginDefault),
                                  ],
                                ),
                              ],
                            ))),
        ]),
      ),
    );
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
        Text('Lets catch a thought', style: ctaJosefin),
        Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundColor: accentPink,
          child: Center(
            child: Ink(
              decoration:
                  ShapeDecoration(color: mainPink, shape: CircleBorder()),
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

