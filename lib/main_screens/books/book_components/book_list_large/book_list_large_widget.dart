import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/modal_book_details/modal_book_details_widget.dart';
import '/main_screens/books/book_components/ui_book_loves/ui_book_loves_widget.dart';
import '/new_components/loading_states/loading_book/loading_book_widget.dart';
import '/new_components/loading_states/loading_single/loading_single_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'book_list_large_model.dart';
export 'book_list_large_model.dart';

class BookListLargeWidget extends StatefulWidget {
  const BookListLargeWidget({
    super.key,
    this.bookType,
    this.bookRef,
    int? index,
  }) : this.index = index ?? 1;

  final BookPreviewType? bookType;
  final BooksRow? bookRef;
  final int index;

  @override
  State<BookListLargeWidget> createState() => _BookListLargeWidgetState();
}

class _BookListLargeWidgetState extends State<BookListLargeWidget> {
  late BookListLargeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookListLargeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.aBTestBookCoverAndBlurb = await actions.getVariantCoverAndBlurb(
        widget.bookRef!.id,
        currentUserUid,
        widget.bookRef?.coverImage,
        widget.bookRef?.blurb,
      );
      _model.blurbCount = functions.returnCharacterCount(valueOrDefault<String>(
        widget.bookRef?.blurb,
        '0',
      ));
      safeSetState(() {});
      _model.isLoading = false;
      safeSetState(() {});
    });

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await action_blocks.createUserBook(
          context,
          bookID: widget.bookRef,
          isModal: false,
          userbookData: FFAppState()
              .userBooksData
              .where((e) => valueOrDefault<bool>(
                    e.userbookId == widget.bookRef?.id,
                    false,
                  ))
              .toList()
              .firstOrNull,
          isFromSparkeBooks: false,
        );
        safeSetState(() {});
      },
      onLongPress: () async {
        HapticFeedback.selectionClick();
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: FlutterFlowTheme.of(context).accent4,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ModalBookDetailsWidget(
                bookRef: widget.bookRef,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Builder(
        builder: (context) {
          if (_model.isLoading) {
            return wrapWithModel(
              model: _model.loadingBookModel,
              updateCallback: () => safeSetState(() {}),
              child: LoadingBookWidget(),
            );
          } else if (widget.bookType == BookPreviewType.JustOut) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 120.0,
                    height: 182.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: Offset(
                            -2.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 300),
                        fadeOutDuration: Duration(milliseconds: 300),
                        imageUrl: valueOrDefault<String>(
                          _model.aBTestBookCoverAndBlurb?.coverImage,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/0c2kl70qgj7o/book_cover%402x.jpg',
                        ),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment(0.1, 0.0),
                        errorWidget: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.jpg',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment(0.1, 0.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.bookRef?.title,
                              'Book Title',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 4.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.bookRef?.author,
                                'TinkerBell62',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  FFIcons.keye,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      valueOrDefault<int>(
                                            widget.bookRef?.promoImpressions,
                                            0,
                                          ) +
                                          valueOrDefault<int>(
                                            widget.bookRef?.impressions,
                                            0,
                                          ),
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Figtree',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.uiBookLovesModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: UiBookLovesWidget(
                                    bookID: widget.bookRef?.id,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  FFIcons.kmessageChatSquare,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FutureBuilder<List<UserCommentsRow>>(
                                  future: UserCommentsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'book_id',
                                      widget.bookRef?.id,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return LoadingSingleWidget(
                                        width: 24.0,
                                      );
                                    }
                                    List<UserCommentsRow>
                                        textUserCommentsRowList =
                                        snapshot.data!;

                                    return Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          textUserCommentsRowList.length,
                                          formatType: FormatType.compact,
                                        ),
                                        '0',
                                      ),
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                _model.aBTestBookCoverAndBlurb?.blurb,
                                '\"You\'ve always hated me,\" Grace said, tears spilling down her cheeks. She startled with Derek gently cupped her face, \"Never - never, ever, I\'ve always loved you.\"',
                              ).maybeHandleOverflow(
                                maxChars: 120,
                                replacement: '…',
                              ),
                              maxLines: 4,
                              minFontSize: 10.0,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (_model.blurbCount != null
                              ? (_model.blurbCount! >= 120)
                              : false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                'Read more',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 10.0,
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
            );
          } else if (widget.bookType == BookPreviewType.Reading) {
            return FutureBuilder<List<UserBooksRow>>(
              future: UserBooksTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'book_id',
                      widget.bookRef?.id,
                    )
                    .eqOrNull(
                      'firebase_user_id',
                      currentUserReference?.id,
                    ),
                limit: 1,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return LoadingBookWidget();
                }
                List<UserBooksRow> userBookQueryUserBooksRowList =
                    snapshot.data!;

                return Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: wrapWithModel(
                            model: _model.bookCurrentReadingModel,
                            updateCallback: () => safeSetState(() {}),
                            child: BookCurrentReadingWidget(
                              width: 140,
                              userbookData: UserBooksDataStruct(),
                              navigateAction: () async {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.bookRef?.title,
                                    'A Reversal of Fortune',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Figtree',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.bookRef?.author,
                                      '@sparke',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        FFIcons.kbookmark,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          widget.bookRef?.chapterCount
                                              ?.toString(),
                                          '0',
                                        )} chap',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.uiBookLovesModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: UiBookLovesWidget(
                                          bookID: widget.bookRef?.id,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        FFIcons.kmessageChatSquare,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child:
                                          FutureBuilder<List<UserCommentsRow>>(
                                        future: UserCommentsTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'book_id',
                                            widget.bookRef?.id,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return LoadingSingleWidget(
                                              width: 24.0,
                                            );
                                          }
                                          List<UserCommentsRow>
                                              textUserCommentsRowList =
                                              snapshot.data!;

                                          return Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                textUserCommentsRowList.length,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            ),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        widget.bookRef?.blurb,
                                        '\"You\'ve always hated me,\" Grace said, tears spilling down her cheeks. She startled with Derek gently cupped her face, \"Never - never, ever, I\'ve always loved you.\"',
                                      ).maybeHandleOverflow(
                                        maxChars: 120,
                                        replacement: '…',
                                      ),
                                      maxLines: 4,
                                      minFontSize: 10.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'Last Opened ${valueOrDefault<String>(
                                      dateTimeFormat(
                                          "relative",
                                          userBookQueryUserBooksRowList
                                              .firstOrNull?.updatedAt),
                                      '--',
                                    )}',
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
                  ),
                );
              },
            );
          } else {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 120.0,
                    height: 182.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: Offset(
                            -2.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 300),
                                fadeOutDuration: Duration(milliseconds: 300),
                                imageUrl: valueOrDefault<String>(
                                  _model.aBTestBookCoverAndBlurb?.coverImage,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/i7aojolzw44w/book_cover_empty.jpg',
                                ),
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment(0.1, 0.0),
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.jpg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment(0.1, 0.0),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: 40.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '#${valueOrDefault<String>(
                                        ((widget.index + 1)).toString(),
                                        '0',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.bookRef?.title,
                              'A Reversal of Fortune',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.bookRef?.author,
                                '@sparke',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  FFIcons.keye,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      valueOrDefault<int>(
                                            widget.bookRef?.promoImpressions,
                                            0,
                                          ) +
                                          valueOrDefault<int>(
                                            widget.bookRef?.impressions,
                                            0,
                                          ),
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Figtree',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.uiBookLovesModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: UiBookLovesWidget(
                                    bookID: widget.bookRef?.id,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  FFIcons.kmessageChatSquare,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FutureBuilder<List<UserCommentsRow>>(
                                  future: UserCommentsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'book_id',
                                      widget.bookRef?.id,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return LoadingSingleWidget(
                                        width: 24.0,
                                      );
                                    }
                                    List<UserCommentsRow>
                                        textUserCommentsRowList =
                                        snapshot.data!;

                                    return Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          textUserCommentsRowList.length,
                                          formatType: FormatType.compact,
                                        ),
                                        '0',
                                      ),
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            widget.bookRef?.primaryTrope,
                                            '--',
                                          ).maybeHandleOverflow(
                                            maxChars: 32,
                                            replacement: '…',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                _model.aBTestBookCoverAndBlurb?.blurb,
                                '\"You\'ve always hated me,\" Grace said, tears spilling down her cheeks. She startled with Derek gently cupped her face, \"Never - never, ever, I\'ve always loved you.\"',
                              ).maybeHandleOverflow(
                                maxChars: valueOrDefault<int>(
                                  MediaQuery.sizeOf(context).width >=
                                          kBreakpointMedium
                                      ? 240
                                      : 120,
                                  120,
                                ),
                                replacement: '…',
                              ),
                              maxLines: 3,
                              minFontSize: 10.0,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                kBreakpointMedium
                                            ? 16.0
                                            : 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (_model.blurbCount! >= 120)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                'Read more',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 10.0,
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
            );
          }
        },
      ),
    );
  }
}
