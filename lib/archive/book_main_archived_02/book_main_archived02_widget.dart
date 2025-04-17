import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/modal_book_details/modal_book_details_widget.dart';
import '/main_screens/books/book_components/ui_fig_tree_content/ui_fig_tree_content_widget.dart';
import '/main_screens/books/book_components/ui_opensans_content/ui_opensans_content_widget.dart';
import '/main_screens/books/book_components/ui_ptserif_content/ui_ptserif_content_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/modal_unlock_chapter/modal_unlock_chapter_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/modal_unlock_unauth_user/modal_unlock_unauth_user_widget.dart';
import '/new_components/loading_states/loading_page/loading_page_widget.dart';
import '/new_components/modal_font_style_update/modal_font_style_update_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'book_main_archived02_model.dart';
export 'book_main_archived02_model.dart';

class BookMainArchived02Widget extends StatefulWidget {
  const BookMainArchived02Widget({
    super.key,
    int? currentPageNumber,
    double? percentageComplete,
    int? totalPages,
    this.bookRef,
    this.readingMode,
    this.userBookRef,
    int? currentChapterIndex,
    int? currentChapter,
    int? chaptersUnlocked,
    required this.userbookData,
  })  : this.currentPageNumber = currentPageNumber ?? 1,
        this.percentageComplete = percentageComplete ?? 12.0,
        this.totalPages = totalPages ?? 300,
        this.currentChapterIndex = currentChapterIndex ?? 1,
        this.currentChapter = currentChapter ?? 0,
        this.chaptersUnlocked = chaptersUnlocked ?? 0;

  final int currentPageNumber;
  final double percentageComplete;
  final int totalPages;
  final BooksRow? bookRef;
  final bool? readingMode;
  final UserBooksRow? userBookRef;
  final int currentChapterIndex;
  final int currentChapter;
  final int chaptersUnlocked;
  final UserBooksDataStruct? userbookData;

  static String routeName = 'book_main_archived_02';
  static String routePath = 'bookMainDetails';

  @override
  State<BookMainArchived02Widget> createState() =>
      _BookMainArchived02WidgetState();
}

class _BookMainArchived02WidgetState extends State<BookMainArchived02Widget> {
  late BookMainArchived02Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookMainArchived02Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.bookref = await BooksTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.userbookData?.bookId,
            ),
          );
        }),
        Future(() async {
          _model.userbookref = await UserBooksTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.userbookData?.userbookId,
            ),
          );
        }),
      ]);
      _model.readingMode = false;
      _model.pageNumber = widget.userbookData?.userbookPageNumber;
      _model.currentChapter = widget.currentChapter;
      _model.currentChapterIndex = widget.currentChapterIndex;
      _model.totalPages = widget.userbookData?.bookTotalPages;
      _model.chaptersUnlocked = widget.userbookData!.chaptersUnlocked;
      _model.nextPageFirst = widget.userbookData!.nextChapterFirst;
      _model.bookRef = _model.bookref?.firstOrNull;
      _model.userbookRef = _model.userbookref?.firstOrNull;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<ChaptersRow>>(
            future: ChaptersTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'book_id',
                widget.userbookData?.bookId,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return LoadingPageWidget(
                  bookTitle: widget.bookRef?.title,
                  showTop: true,
                );
              }
              List<ChaptersRow> chaptersQueryChaptersRowList = snapshot.data!;

              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height:
                              FFAppState().readingMode == false ? 64.0 : 0.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: FFAppState().readingMode == false,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 4.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().updateUserBooksDataAtIndex(
                                        FFAppState()
                                            .userBooksData
                                            .where((e) => valueOrDefault<bool>(
                                                  e.userbookId ==
                                                      widget.userbookData
                                                          ?.userbookId,
                                                  false,
                                                ))
                                            .toList()
                                            .firstOrNull!
                                            .indexInLocal,
                                        (e) => e
                                          ..userbookPageNumber =
                                              _model.pageNumber
                                          ..chaptersUnlocked =
                                              _model.chaptersUnlocked
                                          ..updatedAt = getCurrentTimestamp,
                                      );
                                      safeSetState(() {});
                                      await UserBooksTable().update(
                                        data: {
                                          'page_number': _model.pageNumber,
                                          'chapters_unlocked':
                                              _model.chaptersUnlocked,
                                          'updated_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.userbookData?.userbookId,
                                        ),
                                      );

                                      context
                                          .pushNamed(MainHomeWidget.routeName);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.bookRef?.title,
                                        'Book Title',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      FFIcons.kalignLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 28.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: ModalBookDetailsWidget(
                                                bookRef: widget.bookRef,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      FFIcons.ktype02,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: ModalFontStyleUpdateWidget(
                                                defaultTextSize: FFAppState()
                                                    .defaultTextSize,
                                                userBookData:
                                                    widget.userbookData,
                                                onApplyChanges: () async {},
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.readingMode = !_model.readingMode;
                            safeSetState(() {});
                            FFAppState().readingMode =
                                !(FFAppState().readingMode ?? true);
                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final chapterContent = functions
                                          .paginateChapterContent(
                                              chaptersQueryChaptersRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.chapterOrder!,
                                                      desc: false)
                                                  .map((e) => e.content)
                                                  .withoutNulls
                                                  .toList(),
                                              250,
                                              chaptersQueryChaptersRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.chapterOrder!,
                                                      desc: false)
                                                  .map((e) => e.title)
                                                  .withoutNulls
                                                  .toList(),
                                              chaptersQueryChaptersRowList
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.chapterOrder!,
                                                      desc: false)
                                                  .map((e) => e.id)
                                                  .toList(),
                                              MediaQuery.sizeOf(context).height,
                                              MediaQuery.sizeOf(context).width,
                                              FFAppState().defaultTextSize,
                                              65.0,
                                              30.0)
                                          .toList();

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: PageView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          valueOrDefault<int>(
                                                            widget.userbookData!
                                                                    .userbookPageNumber -
                                                                1,
                                                            0,
                                                          ),
                                                          chapterContent
                                                                  .length -
                                                              1))),
                                          onPageChanged: (_) async {
                                            _model.nextChapterID = getJsonField(
                                              chapterContent.elementAtOrNull(
                                                  _model.pageViewCurrentIndex +
                                                      1),
                                              r'''$.id''',
                                            );
                                            _model.nextPageFirst = getJsonField(
                                              chapterContent.elementAtOrNull(
                                                  _model.pageViewCurrentIndex +
                                                      1),
                                              r'''$.firstPageOfChapter''',
                                            );
                                            _model.currentChapter =
                                                getJsonField(
                                              chapterContent.elementAtOrNull(
                                                  _model.pageViewCurrentIndex),
                                              r'''$.id''',
                                            );
                                            _model.totalPages =
                                                chapterContent.length;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateUserBooksDataAtIndex(
                                              FFAppState()
                                                  .userBooksData
                                                  .where((e) =>
                                                      e.userbookId ==
                                                      widget.userbookData
                                                          ?.userbookId)
                                                  .toList()
                                                  .firstOrNull!
                                                  .indexInLocal,
                                              (e) => e
                                                ..nextChapterFirst =
                                                    _model.nextPageFirst,
                                            );
                                            safeSetState(() {});
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: chapterContent.length,
                                          itemBuilder:
                                              (context, chapterContentIndex) {
                                            final chapterContentItem =
                                                chapterContent[
                                                    chapterContentIndex];
                                            return Builder(
                                              builder: (context) {
                                                if (FFAppState()
                                                        .selectedTypographyFamily ==
                                                    SelectedTypography
                                                        .PTSerif) {
                                                  return Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                      ))
                                                        UiPtserifContentWidget(
                                                          key: Key(
                                                              'Keybmr_${chapterContentIndex}_of_${chapterContent.length}'),
                                                          parameter1:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.chapterName''',
                                                          ),
                                                          parameter2:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.firstPageOfChapter''',
                                                          ),
                                                          parameter3:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.content''',
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          child: custom_widgets
                                                              .RawScrollBar(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                1.0,
                                                            isAlwaysShown: true,
                                                            thickness: 5.0,
                                                            thumbColor: Color(
                                                                0xFF737373),
                                                            child: () =>
                                                                UiPtserifContentWidget(
                                                              parameter1:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.chapterName''',
                                                              ),
                                                              parameter2:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.firstPageOfChapter''',
                                                              ),
                                                              parameter3:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.content''',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (FFAppState()
                                                        .selectedTypographyFamily ==
                                                    SelectedTypography
                                                        .OpenSans) {
                                                  return Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        UiOpensansContentWidget(
                                                          key: Key(
                                                              'Keyd01_${chapterContentIndex}_of_${chapterContent.length}'),
                                                          parameter1:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.chapterName''',
                                                          ),
                                                          parameter2:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.firstPageOfChapter''',
                                                          ),
                                                          parameter3:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.content''',
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          child: custom_widgets
                                                              .RawScrollBar(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                1.0,
                                                            isAlwaysShown: true,
                                                            thickness: 5.0,
                                                            thumbColor: Color(
                                                                0xFF737373),
                                                            child: () =>
                                                                UiOpensansContentWidget(
                                                              parameter1:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.chapterName''',
                                                              ),
                                                              parameter2:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.firstPageOfChapter''',
                                                              ),
                                                              parameter3:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.content''',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        UiFigTreeContentWidget(
                                                          key: Key(
                                                              'Keyq52_${chapterContentIndex}_of_${chapterContent.length}'),
                                                          parameter1:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.chapterName''',
                                                          ),
                                                          parameter2:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.firstPageOfChapter''',
                                                          ),
                                                          parameter3:
                                                              getJsonField(
                                                            chapterContentItem,
                                                            r'''$.content''',
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          child: custom_widgets
                                                              .RawScrollBar(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                1.0,
                                                            isAlwaysShown: true,
                                                            thickness: 5.0,
                                                            thumbColor: Color(
                                                                0xFF737373),
                                                            child: () =>
                                                                UiFigTreeContentWidget(
                                                              parameter1:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.chapterName''',
                                                              ),
                                                              parameter2:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.firstPageOfChapter''',
                                                              ),
                                                              parameter3:
                                                                  getJsonField(
                                                                chapterContentItem,
                                                                r'''$.content''',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.03, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.pageNumber != 1) {
                                        _model.pageNumber =
                                            _model.pageNumber! + -1;
                                        safeSetState(() {});
                                        FFAppState().updateUserBooksDataAtIndex(
                                          FFAppState()
                                              .userBooksData
                                              .where(
                                                  (e) => valueOrDefault<bool>(
                                                        e.userbookId ==
                                                            widget.userbookData
                                                                ?.userbookId,
                                                        false,
                                                      ))
                                              .toList()
                                              .firstOrNull!
                                              .indexInLocal,
                                          (e) => e
                                            ..userbookPageNumber = widget
                                                    .userbookData!
                                                    .userbookPageNumber +
                                                1,
                                        );
                                        safeSetState(() {});
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.nextPageFirst) {
                                        if (widget.userbookData!
                                                .chaptersUnlocked <
                                            1) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            isDismissible: false,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ModalUnlockChapterWidget(
                                                    bookID: _model.bookRef,
                                                    userBook:
                                                        _model.userbookRef,
                                                    remainingChapters: 0,
                                                    callBack:
                                                        (chapterNum) async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Hey',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    },
                                                    pageView: () async {},
                                                    isRedeemedSuccessfully:
                                                        (isRedeemed,
                                                            noOfChaptersRedeemed) async {},
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          return;
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ModalUnlockUnauthUserWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      }
                                      // update_page_number
                                      _model.pageNumber =
                                          _model.pageNumber! + 1;
                                      safeSetState(() {});
                                      // update_user_book_data
                                      FFAppState().updateUserBooksDataAtIndex(
                                        FFAppState()
                                            .userBooksData
                                            .where((e) => valueOrDefault<bool>(
                                                  e.userbookId ==
                                                      widget.userbookData
                                                          ?.userbookId,
                                                  false,
                                                ))
                                            .toList()
                                            .firstOrNull!
                                            .indexInLocal,
                                        (e) => e
                                          ..userbookPageNumber = widget
                                                  .userbookData!
                                                  .userbookPageNumber +
                                              1,
                                      );
                                      safeSetState(() {});
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Page ${_model.pageNumber?.toString()} of ${_model.totalPages?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '${valueOrDefault<String>(
                                  formatNumber(
                                    functions.getProgressBarValueUpdate(
                                        valueOrDefault<int>(
                                          _model.totalPages,
                                          300,
                                        ),
                                        _model.pageNumber),
                                    formatType: FormatType.custom,
                                    format: '0',
                                    locale: '',
                                  ),
                                  '1',
                                )}%',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
