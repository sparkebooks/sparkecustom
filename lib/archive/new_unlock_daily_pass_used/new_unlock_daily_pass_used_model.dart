import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_unlock_daily_pass_used_widget.dart'
    show NewUnlockDailyPassUsedWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class NewUnlockDailyPassUsedModel
    extends FlutterFlowModel<NewUnlockDailyPassUsedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60400634;
  int timerMilliseconds = 60400634;
  String timerValue =
      StopWatchTimer.getDisplayTime(60400634, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
