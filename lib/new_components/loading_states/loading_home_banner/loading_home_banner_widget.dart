import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_home_banner_model.dart';
export 'loading_home_banner_model.dart';

/// This component is for loading state of the library.
class LoadingHomeBannerWidget extends StatefulWidget {
  const LoadingHomeBannerWidget({super.key});

  @override
  State<LoadingHomeBannerWidget> createState() =>
      _LoadingHomeBannerWidgetState();
}

class _LoadingHomeBannerWidgetState extends State<LoadingHomeBannerWidget>
    with TickerProviderStateMixin {
  late LoadingHomeBannerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingHomeBannerModel());

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
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 700.0,
      ),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Opacity(
              opacity: 0.5,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 0.0, 12.0),
                child: Container(
                  width: 110.0,
                  height: 190.0,
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
                            size: 144.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(0.0),
              ),
              child: Container(
                width: 30.0,
                height: 160.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.2,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            FFIcons.kimage03,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 84.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
