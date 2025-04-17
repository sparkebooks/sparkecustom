import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_state_current_model.dart';
export 'empty_state_current_model.dart';

class EmptyStateCurrentWidget extends StatefulWidget {
  const EmptyStateCurrentWidget({super.key});

  @override
  State<EmptyStateCurrentWidget> createState() =>
      _EmptyStateCurrentWidgetState();
}

class _EmptyStateCurrentWidgetState extends State<EmptyStateCurrentWidget> {
  late EmptyStateCurrentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateCurrentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FFIcons.kbookOpen01,
            color: FlutterFlowTheme.of(context).primary,
            size: 44.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No recent books',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'You aren\'t reading anything yet. Start reading now.',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
        ].divide(SizedBox(width: 12.0)),
      ),
    );
  }
}
