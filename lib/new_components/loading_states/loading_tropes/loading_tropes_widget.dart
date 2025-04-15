import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_tropes_model.dart';
export 'loading_tropes_model.dart';

/// This component is for loading state of the library.
class LoadingTropesWidget extends StatefulWidget {
  const LoadingTropesWidget({super.key});

  @override
  State<LoadingTropesWidget> createState() => _LoadingTropesWidgetState();
}

class _LoadingTropesWidgetState extends State<LoadingTropesWidget>
    with TickerProviderStateMixin {
  late LoadingTropesModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingTropesModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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
    return Container(
      decoration: BoxDecoration(),
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.0,
        ),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
