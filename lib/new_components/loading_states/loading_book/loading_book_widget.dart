import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_book_model.dart';

export 'loading_book_model.dart';

/// This component is for the loading state of the library.
class LoadingBookWidget extends StatefulWidget {
  const LoadingBookWidget({Key? key}) : super(key: key);

  @override
  State<LoadingBookWidget> createState() => _LoadingBookWidgetState();
}

class _LoadingBookWidgetState extends State<LoadingBookWidget>
    with TickerProviderStateMixin {
  late LoadingBookModel _model;

  final Map<String, AnimationInfo> animationsMap = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingBookModel());

    // Configure the page load shimmer animation.
    animationsMap['containerOnPageLoadAnimation'] = AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effectsBuilder: () => [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
      ],
    );

    // Trigger a rebuild after the first frame if necessary.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          // Left side: Book image container.
          Opacity(
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
                  // Centered placeholder icon.
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.2,
                      child: Icon(
                        FFIcons.kimage03,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 84.0,
                      ),
                    ),
                  ),
                  // Top-right accent box.
                  Align(
                    alignment: Alignment.topRight,
                    child: Opacity(
                      opacity: 0.2,
                      child: Container(
                        width: 44.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
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
          const SizedBox(width: 16.0),
          // Right side: Expanded column with loading text placeholders.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First line placeholder.
                Container(
                  height: 24.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Second line placeholder.
                Container(
                  height: 24.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Third line placeholder.
                Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Fourth line placeholder.
                Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
