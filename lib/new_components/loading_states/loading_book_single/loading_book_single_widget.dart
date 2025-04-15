import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_book_single_model.dart';
export 'loading_book_single_model.dart';

/// This component is for loading state of the library.
class LoadingBookSingleWidget extends StatefulWidget {
  const LoadingBookSingleWidget({super.key});

  @override
  State<LoadingBookSingleWidget> createState() =>
      _LoadingBookSingleWidgetState();
}

class _LoadingBookSingleWidgetState extends State<LoadingBookSingleWidget>
    with TickerProviderStateMixin {
  late LoadingBookSingleModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingBookSingleModel());

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
      child: Opacity(
        opacity: 0.5,
        child: Container(
          width: 110.0,
          height: 150.0,
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
              Opacity(
                opacity: 0.2,
                child: Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Container(
                    width: 44.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
