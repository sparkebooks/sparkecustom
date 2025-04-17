import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'selection_age_model.dart';
export 'selection_age_model.dart';

/// This card can be selected and will display a custom look and feel.
class SelectionAgeWidget extends StatefulWidget {
  const SelectionAgeWidget({
    super.key,
    bool? isSelected,
    this.text,
  }) : this.isSelected = isSelected ?? false;

  final bool isSelected;
  final String? text;

  @override
  State<SelectionAgeWidget> createState() => _SelectionAgeWidgetState();
}

class _SelectionAgeWidgetState extends State<SelectionAgeWidget>
    with TickerProviderStateMixin {
  late SelectionAgeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectionAgeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selected = valueOrDefault<bool>(
        widget.isSelected,
        false,
      );
      _model.updatePage(() {});
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.7, 0.7),
            end: Offset(1.0, 1.0),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.8,
            end: 1.0,
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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          HapticFeedback.mediumImpact();
          FFAppState().age = widget.text!;
          safeSetState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOutQuint,
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              FFAppState().age == widget.text
                  ? FlutterFlowTheme.of(context).accent1
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: valueOrDefault<Color>(
                FFAppState().age == widget.text
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
                FlutterFlowTheme.of(context).alternate,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.text,
                    '18 - 24 years old',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                if (valueOrDefault<bool>(
                  FFAppState().age == widget.text,
                  false,
                ))
                  Icon(
                    FFIcons.kcheckCircleBroken,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation']!),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
