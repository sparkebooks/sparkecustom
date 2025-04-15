import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/main_screens/books/book_components/card_comment/card_comment_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'book_end_recommend_model.dart';
export 'book_end_recommend_model.dart';

class BookEndRecommendWidget extends StatefulWidget {
  const BookEndRecommendWidget({
    super.key,
    required this.userBook,
    required this.bookDoc,
    required this.userBookData,
  });

  final UserBooksRow? userBook;
  final BooksRow? bookDoc;
  final UserBooksDataStruct? userBookData;

  static String routeName = 'book_end_recommend';
  static String routePath = 'bookEndRecommend';

  @override
  State<BookEndRecommendWidget> createState() => _BookEndRecommendWidgetState();
}

class _BookEndRecommendWidgetState extends State<BookEndRecommendWidget>
    with TickerProviderStateMixin {
  late BookEndRecommendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookEndRecommendModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.newComment = false;
      _model.yourRating = null;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'cardCommentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'ratingBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Thank you for reading',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'PT Serif',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                child: FlutterFlowIconButton(
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
                    context.pushNamed(MainLibraryWidget.routeName);
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 110.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.bookCurrentReadingModel,
                                updateCallback: () => safeSetState(() {}),
                                child: BookCurrentReadingWidget(
                                  width: 86,
                                  userbookData: widget.userBookData!,
                                  navigateAction: () async {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.bookDoc?.title,
                                          'Book Title',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.bookDoc?.author,
                                                'Author',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      if (_model.yourRating != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 4.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.yourRating
                                                        ?.toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Icon(
                                                  FFIcons.kstar01,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.newComment)
                      wrapWithModel(
                        model: _model.cardCommentModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: CardCommentWidget(
                          commentRef: _model.newCommentEndBook!,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['cardCommentOnPageLoadAnimation']!),
                    Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: AnimatedDefaultTextStyle(
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                          child: Text(
                            _model.yourRating != null
                                ? 'Thank you for rating your experience!'
                                : 'Leave a rating & comment below.',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) async {
                            safeSetState(
                                () => _model.ratingBarValue = newValue);
                            await UserBooksTable().update(
                              data: {
                                'rating': _model.ratingBarValue,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.userBook?.id,
                              ),
                            );
                            // update_page_with_rating
                            _model.yourRating = _model.ratingBarValue;
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= 3.0,
                          unratedColor: FlutterFlowTheme.of(context).accent3,
                          itemCount: 5,
                          itemSize: 44.0,
                          glowColor: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['ratingBarOnPageLoadAnimation']!),
                    ),
                    if (!_model.newComment)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                (_model.textFieldFocusNode?.hasFocus ?? false)
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color:
                                  (_model.textFieldFocusNode?.hasFocus ?? false)
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Leave a comment...',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Figtree',
                                                    letterSpacing: 0.0,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Figtree',
                                                    letterSpacing: 0.0,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: 8,
                                        minLines: 3,
                                        keyboardType: TextInputType.multiline,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                HapticFeedback.mediumImpact();
                                                // validate_comment_exists
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                // create_comment
                                                _model.newCommentEndBook =
                                                    await UserCommentsTable()
                                                        .insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'updated_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'book_id':
                                                      widget.bookDoc?.id,
                                                  'firebase_user_id':
                                                      currentUserReference?.id,
                                                  'comment': _model
                                                      .textController.text,
                                                  'verified': false,
                                                  'status': CommentStatus
                                                      .Pending.name,
                                                });
                                                _model.newComment = true;
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'You have left a comment!',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });

                                                safeSetState(() {});
                                              },
                                              text: 'Submit',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Other Recommended Books',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'PT Serif',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<List<UserBooksRow>>(
                      future: UserBooksTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'firebase_user_id',
                          currentUserReference?.id,
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
                        List<UserBooksRow> userBooksUserBooksRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<BooksRow>>(
                              future: BooksTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'primary_trope',
                                      widget.bookDoc?.primaryTrope,
                                    )
                                    .inFilterOrNull(
                                      'id',
                                      userBooksUserBooksRowList
                                          .map((e) => e.bookId)
                                          .withoutNulls
                                          .toList(),
                                    )
                                    .order('book_score', ascending: true),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BooksRow> listViewBooksRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    144.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewBooksRowList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBooksRow =
                                        listViewBooksRowList[listViewIndex];
                                    return Container(
                                      height: 220.0,
                                      decoration: BoxDecoration(),
                                      child: wrapWithModel(
                                        model:
                                            _model.bookListLargeModels.getModel(
                                          listViewBooksRow.id.toString(),
                                          listViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BookListLargeWidget(
                                          key: Key(
                                            'Keyqrf_${listViewBooksRow.id.toString()}',
                                          ),
                                          index: listViewIndex,
                                          bookRef: widget.bookDoc,
                                          bookType: BookPreviewType.Search,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .around(SizedBox(height: 12.0)),
                ),
              ),
              if (_model.newComment)
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).overlay0,
                          FlutterFlowTheme.of(context).secondaryBackground
                        ],
                        stops: [0.0, 0.7],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 32.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Go Home',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
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
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
