import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/empty_devices/empty_devices_widget.dart';
import '/widgets/strength_indicator/strength_indicator_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? connectedRSSI;

  String? foundedRSSI;

  ///  State fields for stateful widgets in this page.

  // Models for StrengthIndicator dynamic component.
  late FlutterFlowDynamicModels<StrengthIndicatorModel>
      strengthIndicatorModels1;
  // Stores action output result for [Custom Action - getConnectedDevices] action in Icon widget.
  List<BTDeviceStruct>? getConnectedDevicesOutput;
  // Stores action output result for [Custom Action - findDevices] action in Icon widget.
  List<BTDeviceStruct>? findDevicesOutput;
  // Stores action output result for [Custom Action - connectDevice] action in ScannedDeviceTile widget.
  bool? connectionSuccess;
  // Models for StrengthIndicator dynamic component.
  late FlutterFlowDynamicModels<StrengthIndicatorModel>
      strengthIndicatorModels2;

  @override
  void initState(BuildContext context) {
    strengthIndicatorModels1 =
        FlutterFlowDynamicModels(() => StrengthIndicatorModel());
    strengthIndicatorModels2 =
        FlutterFlowDynamicModels(() => StrengthIndicatorModel());
  }

  @override
  void dispose() {
    strengthIndicatorModels1.dispose();
    strengthIndicatorModels2.dispose();
  }
}
