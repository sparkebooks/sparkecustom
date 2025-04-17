import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui_opensans_content_model.dart';
export 'ui_opensans_content_model.dart';

class UiOpensansContentWidget extends StatefulWidget {
  const UiOpensansContentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  State<UiOpensansContentWidget> createState() =>
      _UiOpensansContentWidgetState();
}

class _UiOpensansContentWidgetState extends State<UiOpensansContentWidget> {
  late UiOpensansContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiOpensansContentModel());

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
                      fontFamily: 'Open Sans',
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
                    fontFamily: 'Open Sans',
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
