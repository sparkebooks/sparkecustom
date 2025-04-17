import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/new_components/empty_states/empty_state_simple/empty_state_simple_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'section_trope_popular_today_model.dart';
export 'section_trope_popular_today_model.dart';

class SectionTropePopularTodayWidget extends StatefulWidget {
  const SectionTropePopularTodayWidget({
    super.key,
    required this.tropeTitle,
  });

  final String? tropeTitle;

  @override
  State<SectionTropePopularTodayWidget> createState() =>
      _SectionTropePopularTodayWidgetState();
}

class _SectionTropePopularTodayWidgetState
    extends State<SectionTropePopularTodayWidget> {
  late SectionTropePopularTodayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTropePopularTodayModel());

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
              queryFn: (q) => q.order('book_score'),
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
              List<BooksRow> popularCardsBooksRowList = snapshot.data!;

              if (popularCardsBooksRowList.isEmpty) {
                return EmptyStateSimpleWidget(
                  title: 'No Popular Books',
                  subTitle: 'Seems like there aren\'t any popular books today.',
                  icon: Icon(
                    FFIcons.kbookOpen01,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 36.0,
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
                itemCount: popularCardsBooksRowList.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.0),
                itemBuilder: (context, popularCardsIndex) {
                  final popularCardsBooksRow =
                      popularCardsBooksRowList[popularCardsIndex];
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
                                  0.0, 0.0, 0.0, 12.0),
                              child: wrapWithModel(
                                model: _model.bookListLargeModels.getModel(
                                  popularCardsBooksRow.id.toString(),
                                  popularCardsIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: BookListLargeWidget(
                                  key: Key(
                                    'Keyaw7_${popularCardsBooksRow.id.toString()}',
                                  ),
                                  bookType: BookPreviewType.Popular,
                                  bookRef: popularCardsBooksRow,
                                  index: popularCardsIndex,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 170.0,
                                child: custom_widgets.VisibilityDetectorWidget(
                                  width: double.infinity,
                                  height: 170.0,
                                  bookRef: popularCardsBooksRow,
                                  child: () => BookListLargeWidget(
                                    bookType: BookPreviewType.Popular,
                                    bookRef: popularCardsBooksRow,
                                    index: popularCardsIndex,
                                  ),
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
