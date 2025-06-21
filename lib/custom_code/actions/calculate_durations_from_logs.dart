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
Future<List<ActivityDurationStruct>> calculateDurationsFromLogs(
    List<PostureLogStruct> logs) async {
  if (logs.length < 2) {
    return [];
  }
  logs.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
  Map<String, Map<String, double>> durationMap = {};

  for (int i = 1; i < logs.length; i++) {
    final previousLog = logs[i - 1];
    final currentLog = logs[i];
    final durationInSeconds = currentLog.timestamp!
        .difference(previousLog.timestamp!)
        .inSeconds
        .toDouble();
    final activity = previousLog.activityName;
    final condition = previousLog.condition;

    durationMap.putIfAbsent(activity, () => {'Good': 0.0, 'Bad': 0.0});
    durationMap[activity]![condition] =
        (durationMap[activity]![condition] ?? 0.0) + durationInSeconds;
  }

  List<ActivityDurationStruct> chartData = [];
  durationMap.forEach((activityName, durations) {
    chartData.add(ActivityDurationStruct(
      activityName: activityName,
      goodDuration: (durations['Good'] ?? 0.0) / 3600.0, // Durasi dalam jam
      badDuration: (durations['Bad'] ?? 0.0) / 3600.0,
    ));
  });
  return chartData;
}
