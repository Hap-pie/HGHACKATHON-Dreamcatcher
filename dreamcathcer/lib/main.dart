import 'dart:ui';
import 'package:dreamcathcer/design_elements.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Github Version

void main() {
  runApp(const MyApp());
}

Widget BottomRecordingBar = Container();

enum RecordingState { start, recording, archive }

var currentRecordingState = RecordingState.start;
     

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
    double cardWidth = MediaQuery.of(context).size.width * 0.85;
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
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('May 17, Friday ', style: DesignElements.dateStyle),
                SizedBox(height: DesignElements.marginMedium),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Color(0xff523F3F)
                    ),
                    child: ListView(
                      
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: Text('Card Title', style: DesignElements.cardTitleStyle)),
                        ),
                        Padding(padding: EdgeInsets.only(left: 16, right: 16), child: Flexible(child: Text('Record Transciption String Here', style: DesignElements.cardBodyStyle, softWrap: true))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                                    onPressed: () => setState(() {
                                      currentRecordingState =
                                          RecordingState.recording;
                                    }),
                                    icon: Icon(Icons.play_arrow),
                                    color: DesignElements.mainPink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: DesignElements.marginDefault),
                          ],
                        )
                      : currentRecordingState == RecordingState.recording
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
                                            onPressed: () => setState(() {
                                              currentRecordingState =
                                                  RecordingState.archive;
                                              // Stop recording function here
                                            }),
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
                                    Text('01:21', style: DesignElements.timerStyle),
                                    SizedBox(width: DesignElements.marginMedium),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(120, 60),
                                          backgroundColor: DesignElements.accentPink,
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
                                              color: DesignElements.mainPink),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: DesignElements.marginDefault),
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
        SizedBox(width: DesignElements.marginDefault),
        Text('Lets catch a thought', style: DesignElements.ctaJosefin),
        Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundColor: DesignElements.accentPink,
          child: Center(
            child: Ink(
              decoration:
                  ShapeDecoration(color: DesignElements.mainPink, shape: CircleBorder()),
              child: IconButton(
                iconSize: 35,
                onPressed: () => setState(() {
                  // Start recording function here
                }),
                icon: Icon(Icons.play_arrow),
                color: DesignElements.mainPink,
              ),
            ),
          ),
        ),
        SizedBox(width: DesignElements.marginDefault),
      ],
    );
  }
}

Widget EmptyState = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Catch your first thought', style: DesignElements.emptyStateFontMerri),
              // Column Margin
              SizedBox(height: DesignElements.marginMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tap',
                    style: DesignElements.emptyStateFontUrban,
                  ),
                  SizedBox(width:DesignElements. marginXSmall),
                  Icon(
                    Icons.play_arrow,
                    color: DesignElements.emptyPink,
                  ),
                  SizedBox(width: DesignElements.marginXSmall),
                  Text(
                    'to begin',
                    style: DesignElements.emptyStateFontUrban,
                  ),
                ],
              ),
              SizedBox(height: DesignElements.marginXLarge)
            ],
          );