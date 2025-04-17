import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'ui_daily_pass_countdown_model.dart';
export 'ui_daily_pass_countdown_model.dart';

class UiDailyPassCountdownWidget extends StatefulWidget {
  const UiDailyPassCountdownWidget({
    super.key,
    required this.timerStops,
  });

  final Future Function()? timerStops;

  @override
  State<UiDailyPassCountdownWidget> createState() =>
      _UiDailyPassCountdownWidgetState();
}

class _UiDailyPassCountdownWidgetState extends State<UiDailyPassCountdownWidget>
    with TickerProviderStateMixin {
  late UiDailyPassCountdownModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiDailyPassCountdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // start_timer
      _model.timerController.onStartTimer();
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 800.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.4, 0.4),
            end: Offset(1.0, 1.0),
          ),
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 3300.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Builder(
        builder: (context) {
          if (valueOrDefault<int>(
                functions.returnCountdownTimer(
                    getCurrentTimestamp,
                    functions.getTomorrowsDateTime(
                        currentUserDocument?.dailyPassLastActive)),
                60000,
              ) !=
              0) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    'assets/images/Untitled_design_(3).png',
                    width: 37.0,
                    height: 31.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Next Daily Pass Unlocks in',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Figtree',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (currentUserDocument?.dailyPassLastActive != null) {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowTimer(
                          initialTime: valueOrDefault<int>(
                            functions.returnCountdownTimer(
                                getCurrentTimestamp,
                                functions.getTomorrowsDateTime(
                                    currentUserDocument?.dailyPassLastActive)),
                            60000,
                          ),
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(value,
                                  milliSecond: false),
                          controller: _model.timerController,
                          updateStateInterval: Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          onEnded: () async {
                            await widget.timerStops?.call();
                          },
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      );
                    } else {
                      return Text(
                        '00:00:00',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Figtree',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      );
                    }
                  },
                ),
              ].divide(SizedBox(width: 4.0)),
            );
          } else {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily Pass Available!',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Text(
                            'Read the next chapter for free!',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                  Icon(
                    FFIcons.kstar07,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 32.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation']!),
                ].addToEnd(SizedBox(width: 12.0)),
              ),
            );
          }
        },
      ),
    );
  }
}
