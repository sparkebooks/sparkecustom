import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/main_screens/books/book_components/empty_state_current/empty_state_current_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import '/new_components/loading_states/loading_book/loading_book_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'section_trope_selected_model.dart';
export 'section_trope_selected_model.dart';

class SectionTropeSelectedWidget extends StatefulWidget {
  const SectionTropeSelectedWidget({
    super.key,
    required this.tropeTitle,
  });

  final String? tropeTitle;

  @override
  State<SectionTropeSelectedWidget> createState() =>
      _SectionTropeSelectedWidgetState();
}

class _SectionTropeSelectedWidgetState
    extends State<SectionTropeSelectedWidget> {
  late SectionTropeSelectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTropeSelectedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.listHeaderViewModel,
          updateCallback: () => safeSetState(() {}),
          child: ListHeaderViewWidget(
            title: widget.tropeTitle,
            showAction: true,
            action: () async {
              context.pushNamed(
                TropesViewAllWidget.routeName,
                queryParameters: {
                  'selectedTrope': serializeParam(
                    widget.tropeTitle,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
          ),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(),
          child: FutureBuilder<List<BooksRow>>(
            future: FFAppState().bookQueries(
              uniqueQueryKey: valueOrDefault<String>(
                widget.tropeTitle,
                'Trope',
              ),
              requestFn: () => BooksTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'primary_trope',
                      widget.tropeTitle,
                    )
                    .eqOrNull(
                      'Status',
                      BookStatus.Published.name,
                    ),
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: LoadingBookWidget(),
                  ),
                );
              }
              List<BooksRow> tropeBooksBooksRowList = snapshot.data!;

              if (tropeBooksBooksRowList.isEmpty) {
                return Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: EmptyStateCurrentWidget(),
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  16.0,
                  0,
                  16.0,
                  0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: tropeBooksBooksRowList.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.0),
                itemBuilder: (context, tropeBooksIndex) {
                  final tropeBooksBooksRow =
                      tropeBooksBooksRowList[tropeBooksIndex];
                  return Visibility(
                    visible: valueOrDefault<bool>(
                      (tropeBooksBooksRow.impressions >= 1000) &&
                              (tropeBooksBooksRow.createdByType == 'Author')
                          ? false
                          : true,
                      true,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: 330.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: custom_widgets.VisibilityDetectorWidget(
                            width: double.infinity,
                            height: 170.0,
                            bookRef: tropeBooksBooksRow,
                            child: () => BookListLargeWidget(
                              bookType: BookPreviewType.JustOut,
                              bookRef: tropeBooksBooksRow,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
