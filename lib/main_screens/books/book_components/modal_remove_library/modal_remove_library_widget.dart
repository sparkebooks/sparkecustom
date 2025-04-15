import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/new_components/loading_states/loading_modal/loading_modal_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'modal_remove_library_model.dart';
export 'modal_remove_library_model.dart';

class ModalRemoveLibraryWidget extends StatefulWidget {
  const ModalRemoveLibraryWidget({
    super.key,
    required this.userBookRef,
    required this.userBookData,
    bool? comingFromBookReader,
    this.onChapterSelect,
  }) : this.comingFromBookReader = comingFromBookReader ?? false;

  final UserBooksRow? userBookRef;
  final UserBooksDataStruct? userBookData;
  final bool comingFromBookReader;
  final Future Function(int selectedChapter)? onChapterSelect;

  @override
  State<ModalRemoveLibraryWidget> createState() =>
      _ModalRemoveLibraryWidgetState();
}

class _ModalRemoveLibraryWidgetState extends State<ModalRemoveLibraryWidget> {
  late ModalRemoveLibraryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalRemoveLibraryModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: FutureBuilder<List<BooksRow>>(
              future: _model.bookUserBookRef(
                uniqueQueryKey: valueOrDefault<String>(
                  widget.userBookRef?.id.toString(),
                  '--',
                ),
                requestFn: () => BooksTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    widget.userBookRef?.bookId,
                  ),
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
                List<BooksRow> bottomSheetEditBooksRowList = snapshot.data!;

                final bottomSheetEditBooksRow =
                    bottomSheetEditBooksRowList.isNotEmpty
                        ? bottomSheetEditBooksRowList.first
                        : null;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3B1D2429),
                        offset: Offset(
                          0.0,
                          -3.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  'Book Details',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'PT Serif',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              if (bottomSheetEditBooksRow
                                                          ?.seriesName !=
                                                      null &&
                                                  bottomSheetEditBooksRow
                                                          ?.seriesName !=
                                                      '')
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          bottomSheetEditBooksRow
                                                              ?.seriesName,
                                                          'Series',
                                                        ),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: ' | Book #',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          bottomSheetEditBooksRow
                                                              ?.seriesOrder
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  'Author: ${valueOrDefault<String>(
                                                    bottomSheetEditBooksRow
                                                        ?.author,
                                                    '@sparke',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 8.0,
                                          borderWidth: 2.0,
                                          buttonSize: 44.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: wrapWithModel(
                                            model:
                                                _model.bookCurrentReadingModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: BookCurrentReadingWidget(
                                              width: 150,
                                              userbookData:
                                                  widget.userBookData!,
                                              navigateAction: () async {},
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Reading Chapter ${valueOrDefault<String>(
                                                    widget.userBookRef
                                                        ?.chapterIndex
                                                        ?.toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    bottomSheetEditBooksRow
                                                        ?.title,
                                                    'Book Name',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'PT Serif',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'You are ',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.userBookData
                                                            ?.bookProgress
                                                            .toString(),
                                                        '0',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 4,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      '% through this book.',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (widget.userBookData?.bookProgress !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: widget
                                                  .userBookData!.bookProgress /
                                              100,
                                          lineHeight: 12.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          barRadius: Radius.circular(44.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    Divider(
                                      height: 12.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
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
                                            bottomSheetEditBooksRow
                                                ?.primaryTrope,
                                            'Trope',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final secondaryTropes =
                                            bottomSheetEditBooksRow
                                                    ?.secondaryTrope
                                                    .toList() ??
                                                [];

                                        return Wrap(
                                          spacing: 4.0,
                                          runSpacing: 4.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(
                                              secondaryTropes.length,
                                              (secondaryTropesIndex) {
                                            final secondaryTropesItem =
                                                secondaryTropes[
                                                    secondaryTropesIndex];
                                            return Text(
                                              secondaryTropesItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    Divider(
                                      height: 12.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'First Opened:',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat("MMMEd",
                                              widget.userBookRef!.createdAt!),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        Text(
                                          dateTimeFormat("jm",
                                              widget.userBookRef!.createdAt!),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Last Opened:',
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
                                            dateTimeFormat(
                                                "relative",
                                                widget
                                                    .userBookData?.updatedAt),
                                            '--',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                    FutureBuilder<List<ChaptersRow>>(
                                      future: _model.bookChapters(
                                        uniqueQueryKey: valueOrDefault<String>(
                                          bottomSheetEditBooksRow?.id
                                              .toString(),
                                          '1',
                                        ),
                                        requestFn: () =>
                                            ChaptersTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'book_id',
                                                bottomSheetEditBooksRow?.id,
                                              )
                                              .order('chapter_order',
                                                  ascending: true),
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return LoadingModalWidget();
                                        }
                                        List<ChaptersRow>
                                            containerChaptersRowList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Chapters Left:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${valueOrDefault<String>(
                                                        ((int totalChapters,
                                                                    int
                                                                        chaptersUnlocked,
                                                                    bool
                                                                        hasPrologue) {
                                                          return totalChapters -
                                                              (hasPrologue
                                                                  ? (chaptersUnlocked +
                                                                      1)
                                                                  : chaptersUnlocked);
                                                        }(
                                                                valueOrDefault<
                                                                    int>(
                                                                  containerChaptersRowList
                                                                      .length,
                                                                  0,
                                                                ),
                                                                valueOrDefault<
                                                                    int>(
                                                                  widget
                                                                      .userBookRef
                                                                      ?.chaptersUnlocked,
                                                                  0,
                                                                ),
                                                                (containerChaptersRowList
                                                                        .firstOrNull
                                                                        ?.title ==
                                                                    'Prologue')))
                                                            .toString(),
                                                        '0',
                                                      )}${widget.userBookData?.chaptersUnlocked == 1 ? ' chapter left.' : ' chapters left.'}',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 16.0)),
                                                ),
                                              ),
                                              Divider(
                                                height: 12.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'View Chapters',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final chaptersList =
                                                        containerChaptersRowList
                                                            .toList();

                                                    return RefreshIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      strokeWidth: 4.0,
                                                      onRefresh: () async {
                                                        FFAppState()
                                                            .clearChaptersQueryCacheKey(
                                                                valueOrDefault<
                                                                    String>(
                                                          bottomSheetEditBooksRow
                                                              ?.id
                                                              .toString(),
                                                          '1',
                                                        ));
                                                      },
                                                      child: ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            chaptersList.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 1.0),
                                                        itemBuilder: (context,
                                                            chaptersListIndex) {
                                                          final chaptersListItem =
                                                              chaptersList[
                                                                  chaptersListIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {},
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 36.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          chaptersListItem
                                                                              .title,
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
                                                                      FFIcons
                                                                          .kcheckCircleBroken,
                                                                      color: (widget.userBookData!.chaptersUnlocked >= chaptersListItem.chapterOrder!) ||
                                                                              (chaptersListItem.title ==
                                                                                  'Prologue') ||
                                                                              (chaptersListItem.title ==
                                                                                  'Chapter 1')
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                // update_app_state
                                FFAppState().removeFromUserBooksData(
                                    widget.userBookData!);
                                safeSetState(() {});
                                _model.removedBook =
                                    await UserBooksTable().delete(
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.userBookRef?.id,
                                  ),
                                  returnRows: true,
                                );
                                // decrease_books

                                await currentUserReference!.update({
                                  ...createUsersRecordData(
                                    lastActiveTime: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'total_books': FieldValue.increment(-(1)),
                                    },
                                  ),
                                });
                                Navigator.pop(context);

                                context.goNamed(
                                  MainLibraryWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'You have removed a book from your library.',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );

                                safeSetState(() {});
                              },
                              text: 'Remove',
                              icon: Icon(
                                FFIcons.kfileMinus02,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                width: 120.0,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).warning,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  HapticFeedback.mediumImpact();
                                  if (widget.comingFromBookReader) {
                                    Navigator.pop(context);
                                  } else {
                                    // update_last_opened
                                    await UserBooksTable().update(
                                      data: {
                                        'updated_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget.userBookRef?.id,
                                      ),
                                    );
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      BookDetailsWithoutScrollWidget.routeName,
                                      queryParameters: {
                                        'userbookData': serializeParam(
                                          widget.userBookData,
                                          ParamType.DataStruct,
                                        ),
                                      }.withoutNulls,
                                    );

                                    // update_app_state_version
                                    FFAppState().updateUserBooksDataAtIndex(
                                      FFAppState()
                                          .userBooksData
                                          .where((e) =>
                                              e.userbookId ==
                                              widget.userBookData?.userbookId)
                                          .toList()
                                          .firstOrNull!
                                          .userbookId,
                                      (e) => e..updatedAt = getCurrentTimestamp,
                                    );
                                    safeSetState(() {});
                                  }
                                },
                                text: 'Continue Reading',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent1,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Figtree',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pop();
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 4.0))
                        .addToEnd(SizedBox(height: 32.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ].addToStart(SizedBox(height: 72.0)),
    );
  }
}
