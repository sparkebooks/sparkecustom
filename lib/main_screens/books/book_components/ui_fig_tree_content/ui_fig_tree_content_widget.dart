import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui_fig_tree_content_model.dart';
export 'ui_fig_tree_content_model.dart';

class UiFigTreeContentWidget extends StatefulWidget {
  const UiFigTreeContentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  State<UiFigTreeContentWidget> createState() => _UiFigTreeContentWidgetState();
}

class _UiFigTreeContentWidgetState extends State<UiFigTreeContentWidget> {
  late UiFigTreeContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiFigTreeContentModel());

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.parameter2 ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: AnimatedDefaultTextStyle(
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Figtree',
                      letterSpacing: 0.0,
                    ),
                duration: Duration(milliseconds: 400),
                curve: Curves.easeIn,
                child: Text(
                  widget.parameter1!.toString(),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: AnimatedDefaultTextStyle(
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Figtree',
                    fontSize: FFAppState().defaultTextSize,
                    letterSpacing: 0.0,
                  ),
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              child: Text(
                widget.parameter3!.toString(),
              ),
            ),
          ),
        ]
            .divide(SizedBox(height: 12.0))
            .addToStart(SizedBox(height: 5.0))
            .addToEnd(SizedBox(height: 16.0)),
      ),
    );
  }
}
