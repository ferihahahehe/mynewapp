// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:intl/intl.dart';

Future<void> parseAndStoreData(String rawData) async {
  if (rawData.isEmpty || !rawData.contains(',')) return;
  final parts = rawData.split(',');
  if (parts.length != 3) return;

  try {
    final activityCode = int.parse(parts[0].trim());
    final angle = int.parse(parts[1].trim());
    final conditionCode = int.parse(parts[2].trim());

    String activityName;
    switch (activityCode) {
      case 1:
        activityName = 'Idle';
        break;
      case 2:
        activityName = 'Walking';
        break;
      case 3:
        activityName = 'Running';
        break;
      case 4:
        activityName = 'Stairs Up';
        break;
      case 5:
        activityName = 'Stairs Down';
        break;
      default:
        activityName = 'Unknown';
    }

    // Update status real-time
    FFAppState().currentCondition = (conditionCode == 1);
    FFAppState().currentFlexAngle = angle;

    // Buat dan simpan log mentah
    final newLog = PostureLogStruct(
      timestamp: DateTime.now(),
      activityName: activityName,
      flexAngle: angle,
      condition: (conditionCode == 1) ? 'Good' : 'Bad',
    );
    FFAppState().addToPostureLogs(newLog);
  } catch (e) {
    print('Failed to parse data: $e');
  }
}
