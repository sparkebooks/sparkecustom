import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/dark_light_mode_switch/dark_light_mode_switch_widget.dart';
import '/new_components/ui_daily_pass_countdown/ui_daily_pass_countdown_widget.dart';
import '/index.dart';
import 'main_profile_widget.dart' show MainProfileWidget;
import 'package:flutter/material.dart';

class MainProfileModel extends FlutterFlowModel<MainProfileWidget> {
  ///  Local state fields for this page.

  int? dailyPassRenewal;

  ///  State fields for stateful widgets in this page.

  // Model for ui_daily_pass_countdown component.
  late UiDailyPassCountdownModel uiDailyPassCountdownModel;
  // Model for dark_light_mode_switch component.
  late DarkLightModeSwitchModel darkLightModeSwitchModel;

  @override
  void initState(BuildContext context) {
    uiDailyPassCountdownModel =
        createModel(context, () => UiDailyPassCountdownModel());
    darkLightModeSwitchModel =
        createModel(context, () => DarkLightModeSwitchModel());
  }

  @override
  void dispose() {
    uiDailyPassCountdownModel.dispose();
    darkLightModeSwitchModel.dispose();
  }
}
