import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'modal_book_progress_summary_model.dart';
export 'modal_book_progress_summary_model.dart';

class ModalBookProgressSummaryWidget extends StatefulWidget {
  const ModalBookProgressSummaryWidget({
    super.key,
    this.bookRef,
    this.userBook,
  });

  final BooksRow? bookRef;
  final UserBooksRow? userBook;

  @override
  State<ModalBookProgressSummaryWidget> createState() =>
      _ModalBookProgressSummaryWidgetState();
}

class _ModalBookProgressSummaryWidgetState
    extends State<ModalBookProgressSummaryWidget> {
  late ModalBookProgressSummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalBookProgressSummaryModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  -2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.bookRef?.title,
                                    'A Reversal of Fortune',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'PT Serif',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              if (widget.bookRef?.seriesName != null &&
                                  widget.bookRef?.seriesName != '')
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.bookRef?.seriesName,
                                          'Series',
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: ' | Book #',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.bookRef?.seriesOrder
                                              ?.toString(),
                                          '0',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.bookRef?.author,
                                    'TinkerBell62',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 110.0,
                              height: 152.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.bookCurrentReadingModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: BookCurrentReadingWidget(
                                  userbookData: FFAppState()
                                      .userBooksData
                                      .where((e) =>
                                          e.userbookId == widget.userBook?.id)
                                      .toList()
                                      .firstOrNull!,
                                  navigateAction: () async {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Currently Reading',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      '${valueOrDefault<String>(
                                        widget.userBook?.pageNumber.toString(),
                                        '1',
                                      )} / ${valueOrDefault<String>(
                                        widget.userBook?.totalPages
                                            ?.toString(),
                                        '100',
                                      )} pages',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'PT Serif',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'You are ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              formatNumber(
                                                widget.userBook?.bookProgress,
                                                formatType: FormatType.percent,
                                              ),
                                              '0',
                                            ),
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: '% through this book.',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              widget.userBook?.bookProgress,
                              0.5,
                            ),
                            lineHeight: 12.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            barRadius: Radius.circular(44.0),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Divider(
                          height: 12.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Tropes:',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.bookRef?.primaryTrope,
                                'Trope',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                        Builder(
                          builder: (context) {
                            final secondaryTropes =
                                widget.bookRef?.secondaryTrope.toList() ?? [];

                            return Wrap(
                              spacing: 4.0,
                              runSpacing: 4.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(secondaryTropes.length,
                                  (secondaryTropesIndex) {
                                final secondaryTropesItem =
                                    secondaryTropes[secondaryTropesIndex];
                                return Text(
                                  secondaryTropesItem,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                      ),
                                );
                              }),
                            );
                          },
                        ),
                        Divider(
                          height: 12.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'First Opened:',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              dateTimeFormat(
                                  "MMMEd", widget.userBook!.createdAt!),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last Opened:',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              dateTimeFormat(
                                  "relative", widget.userBook!.updatedAt!),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Chapters Unlocked',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.userBook?.chaptersUnlocked.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                        Divider(
                          height: 12.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Text(
                          'Chapter Navigation',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        FutureBuilder<List<ChaptersRow>>(
                          future: _model.bookChapters(
                            uniqueQueryKey: valueOrDefault<String>(
                              widget.bookRef?.id.toString(),
                              '1',
                            ),
                            requestFn: () => ChaptersTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'book_id',
                                    widget.bookRef?.id,
                                  )
                                  .order('chapter_order'),
                            ),
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
                            List<ChaptersRow> listViewChaptersRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChaptersRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewChaptersRow =
                                    listViewChaptersRowList[listViewIndex];
                                return Container(
                                  width: 100.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewChaptersRow.chapter,
                                              'Chapter Name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          FFIcons.kcheckCircleBroken,
                                          color: widget.userBook!
                                                      .chapterIdIndex! <=
                                                  listViewChaptersRow
                                                      .chapterOrder!
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 24.0,
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          BookCommentsWidget.routeName,
                          queryParameters: {
                            'bookRef': serializeParam(
                              widget.bookRef,
                              ParamType.SupabaseRow,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'View comments (52)!!',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        HapticFeedback.mediumImpact();
                        Navigator.pop(context);
                        // update_last_opened
                        await UserBooksTable().update(
                          data: {
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            widget.userBook?.id,
                          ),
                        );

                        context.pushNamed(
                          BookDetailsWithoutScrollWidget.routeName,
                          queryParameters: {
                            'userbookData': serializeParam(
                              FFAppState()
                                  .userBooksData
                                  .where((e) =>
                                      e.userbookId == widget.userBook?.id)
                                  .toList()
                                  .firstOrNull,
                              ParamType.DataStruct,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Continue Reading',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Figtree',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
