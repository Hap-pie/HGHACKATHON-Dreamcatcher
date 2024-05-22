import 'package:dreamcathcer/design_elements.dart';
import 'package:flutter/material.dart';

// Component logic vars

enum RecordingState { defaultState, recording, archiveState }
var currentRecordingState = RecordingState.defaultState;

// Component logic ends

// Empty State component

Widget emptyState() {
  return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Catch your first thought',
               style: DesignElements.emptyStateFontMerri
                ),
                // Column Margin
                SizedBox(height: DesignElements.marginMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      'Tap',
                      style: DesignElements.emptyStateFontUrban,
                      ),
                    SizedBox(width: DesignElements.marginXSmall),
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
}

// Empty State ends

