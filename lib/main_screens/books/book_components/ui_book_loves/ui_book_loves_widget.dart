import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_single/loading_single_widget.dart';
import 'package:flutter/material.dart';
import 'ui_book_loves_model.dart';
export 'ui_book_loves_model.dart';

class UiBookLovesWidget extends StatefulWidget {
  const UiBookLovesWidget({
    super.key,
    int? bookID,
  }) : this.bookID = bookID ?? 0;

  final int bookID;

  @override
  State<UiBookLovesWidget> createState() => _UiBookLovesWidgetState();
}

class _UiBookLovesWidgetState extends State<UiBookLovesWidget> {
  late UiBookLovesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiBookLovesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
          child: Icon(
            FFIcons.kheart,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
          child: FutureBuilder<List<UserBooksRow>>(
            future: UserBooksTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'book_id',
                widget.bookID,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return LoadingSingleWidget(
                  width: 24.0,
                );
              }
              List<UserBooksRow> textUserBooksRowList = snapshot.data!;

              return Text(
                valueOrDefault<String>(
                  formatNumber(
                    textUserBooksRowList.length,
                    formatType: FormatType.compact,
                  ),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
