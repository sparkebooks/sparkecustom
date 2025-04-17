import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_header_view_model.dart';
export 'list_header_view_model.dart';

/// This component will be used for headers within our home page.
class ListHeaderViewWidget extends StatefulWidget {
  const ListHeaderViewWidget({
    super.key,
    this.title,
    this.action,
    bool? showAction,
  }) : this.showAction = showAction ?? true;

  final String? title;
  final Future Function()? action;
  final bool showAction;

  @override
  State<ListHeaderViewWidget> createState() => _ListHeaderViewWidgetState();
}

class _ListHeaderViewWidgetState extends State<ListHeaderViewWidget> {
  late ListHeaderViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListHeaderViewModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Just Out (last 24hrs)',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Figtree',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          if (widget.showAction)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.action?.call();
              },
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Text(
                          'View More',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Icon(
                        FFIcons.kchevronRight,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                    ]
                        .divide(SizedBox(width: 12.0))
                        .addToStart(SizedBox(width: 12.0)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
