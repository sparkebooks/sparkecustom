import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/main_screens/books/book_components/empty_state_current/empty_state_current_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'section_trope_just_out_model.dart';
export 'section_trope_just_out_model.dart';

class SectionTropeJustOutWidget extends StatefulWidget {
  const SectionTropeJustOutWidget({
    super.key,
    required this.tropeTitle,
  });

  final String? tropeTitle;

  @override
  State<SectionTropeJustOutWidget> createState() =>
      _SectionTropeJustOutWidgetState();
}

class _SectionTropeJustOutWidgetState extends State<SectionTropeJustOutWidget> {
  late SectionTropeJustOutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTropeJustOutModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        wrapWithModel(
          model: _model.listHeaderViewModel,
          updateCallback: () => safeSetState(() {}),
          child: ListHeaderViewWidget(
            title: widget.tropeTitle,
            showAction: false,
            action: () async {},
          ),
        ),
        Container(
          height: 210.0,
          decoration: BoxDecoration(),
          child: FutureBuilder<List<BooksRow>>(
            future: BooksTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'Status',
                    BookStatus.Published.name,
                  )
                  .order('created_at'),
              limit: 10,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<BooksRow> justOutCardsBooksRowList = snapshot.data!;

              if (justOutCardsBooksRowList.isEmpty) {
                return EmptyStateCurrentWidget();
              }

              return ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  16.0,
                  0,
                  16.0,
                  0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: justOutCardsBooksRowList.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.0),
                itemBuilder: (context, justOutCardsIndex) {
                  final justOutCardsBooksRow =
                      justOutCardsBooksRowList[justOutCardsIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      width: 330.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: wrapWithModel(
                                model: _model.bookListLargeModels.getModel(
                                  justOutCardsBooksRow.id.toString(),
                                  justOutCardsIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: BookListLargeWidget(
                                  key: Key(
                                    'Keysk8_${justOutCardsBooksRow.id.toString()}',
                                  ),
                                  bookType: BookPreviewType.JustOut,
                                  bookRef: justOutCardsBooksRow,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: custom_widgets.VisibilityDetectorWidget(
                                width: double.infinity,
                                height: 170.0,
                                bookRef: justOutCardsBooksRow,
                                child: () => BookListLargeWidget(
                                  bookType: BookPreviewType.JustOut,
                                  bookRef: justOutCardsBooksRow,
                                ),
                              ),
                            ),
                          ),
                        ],
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
