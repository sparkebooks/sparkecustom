import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/main_screens/books/book_components/empty_state_current/empty_state_current_widget.dart';
import '/main_screens/books/book_components/modal_book_details/modal_book_details_widget.dart';
import '/main_screens/books/book_components/modal_remove_library/modal_remove_library_widget.dart';
import '/new_components/empty_states/empty_state_simple/empty_state_simple_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import '/new_components/loading_states/loading_home_banner/loading_home_banner_widget.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/new_components/section_trope_just_out/section_trope_just_out_widget.dart';
import '/new_components/section_trope_popular_today/section_trope_popular_today_widget.dart';
import '/new_components/section_trope_selected/section_trope_selected_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'main_home_model.dart';
export 'main_home_model.dart';

class MainHomeWidget extends StatefulWidget {
  const MainHomeWidget({super.key});

  static String routeName = 'main_home';
  static String routePath = 'mainHome';

  @override
  State<MainHomeWidget> createState() => _MainHomeWidgetState();
}

class _MainHomeWidgetState extends State<MainHomeWidget> {
  late MainHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainHomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firebaseUser =
          await UsersRecord.getDocumentOnce(currentUserReference!);
      if (_model.firebaseUser != null) {
        if ((FFAppState().userBooksLastFetched! <
                functions.getDateUsingVar(getCurrentTimestamp, 0)!) ||
            valueOrDefault<bool>(
              FFAppState().userBooksData.firstOrNull?.userbookId == null,
              true,
            ) ||
            (true == true)) {
          // get_user_books
          _model.myUserBooks = await UserBooksTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'firebase_user_id',
                  currentUserReference?.id,
                )
                .order('updated_at'),
          );
          FFAppState().userBooksData = [];
          safeSetState(() {});
          while (_model.loopCount <
              valueOrDefault<int>(
                _model.myUserBooks?.length,
                0,
              )) {
            _model.bookCopy = await BooksTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'id',
                _model.myUserBooks?.elementAtOrNull(_model.loopCount)?.bookId,
              ),
            );
            FFAppState().addToUserBooksData(UserBooksDataStruct(
              userbookId:
                  _model.myUserBooks?.elementAtOrNull(_model.loopCount)?.id,
              userbookPageNumber: valueOrDefault<int>(
                _model.myUserBooks
                    ?.elementAtOrNull(_model.loopCount)
                    ?.pageNumber,
                0,
              ),
              indexInLocal: _model.loopCount,
              bookTotalPages: valueOrDefault<int>(
                _model.myUserBooks
                    ?.elementAtOrNull(_model.loopCount)
                    ?.totalPages,
                0,
              ),
              readingMode: true,
              chaptersUnlocked: valueOrDefault<int>(
                _model.myUserBooks
                    ?.elementAtOrNull(_model.loopCount)
                    ?.chaptersUnlocked,
                0,
              ),
              bookName: _model.bookCopy?.firstOrNull?.title,
              bookImage: _model.bookCopy?.firstOrNull?.coverImage,
              bookId: _model.bookCopy?.firstOrNull?.id,
              updatedAt: _model.myUserBooks
                  ?.elementAtOrNull(_model.loopCount)
                  ?.updatedAt,
              nextChapterFirst: false,
              bookProgress: valueOrDefault<double>(
                _model.myUserBooks
                    ?.elementAtOrNull(_model.loopCount)
                    ?.bookProgress,
                0.0,
              ),
              currentChapter: valueOrDefault<int>(
                _model.myUserBooks
                    ?.elementAtOrNull(_model.loopCount)
                    ?.chapterIndex,
                0,
              ),
              isPaymentRequired: false,
            ));
            safeSetState(() {});
            _model.loopCount = _model.loopCount + 1;
            safeSetState(() {});
          }
          _model.loopAddIndex = 0;
          safeSetState(() {});
        }
        if ((FFAppState().age != '') ||
            ((currentUserDocument?.selectedTropes.toList() ?? []).length <=
                2)) {
          // update_user_tropes
          FFAppState().selectedTropes =
              (currentUserDocument?.selectedTropes.toList() ?? [])
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        } else if (valueOrDefault<bool>(
                currentUserDocument?.anonymousUser, false) ==
            false) {
          // update_user_tropes
          FFAppState().selectedTropes =
              (currentUserDocument?.selectedTropes.toList() ?? [])
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        } else {
          context.pushNamedAuth(
            OnboardingUserWidget.routeName,
            context.mounted,
            queryParameters: {
              'createProfile': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        }

        await actions.setupFCMTokenInSupabase();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Your account has been deleted',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        FFAppState().selectedTropes = [];
        FFAppState().readingMode = false;
        FFAppState().userBooksData = [];
        FFAppState().alreadyCalculatedImpressionsID = [];
        FFAppState().selectedTypographyFamily = SelectedTypography.Figtree;
        FFAppState().userBooksLastFetched =
            DateTime.fromMillisecondsSinceEpoch(1731294420000);
        FFAppState().defaultTextSize = 18.0;
        FFAppState().currentChapterPages = [];
        FFAppState().lastReadNotification = null;
        FFAppState().alreadyFetchedABTestCoverAndBlurbIds = [];
        FFAppState().selectedFontFamily = 'PT Serif';
        safeSetState(() {});
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.pushNamedAuth(AuthWelcomeWidget.routeName, context.mounted);
      }
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 6.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).accent4,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: ModalAccountOptionsWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-f5j7u5/assets/sh6xt2aktoi2/fantasy_purple.png',
                        ),
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
            child: AuthUserStreamWidget(
              builder: (context) => AutoSizeText(
                'Welcome back, ${currentUserDisplayName}'.maybeHandleOverflow(
                  maxChars: 120,
                  replacement: '…',
                ),
                textAlign: TextAlign.start,
                maxLines: 1,
                minFontSize: 10.0,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'PT Serif',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<HomeAdsRow>>(
                  future: _model.homeBanners(
                    requestFn: () => HomeAdsTable().queryRows(
                      queryFn: (q) => q.order('created_at'),
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return LoadingHomeBannerWidget();
                    }
                    List<HomeAdsRow> homeBannersHomeAdsRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final homeBanners = homeBannersHomeAdsRowList
                              .toList()
                              .take(4)
                              .toList();
                          if (homeBanners.isEmpty) {
                            return Container(
                              height: 200.0,
                              child: EmptyStateSimpleWidget(
                                title: 'No Banners',
                                subTitle: 'There are no home banners here.',
                                icon: Icon(
                                  FFIcons.kairplay,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 48.0,
                                ),
                              ),
                            );
                          }

                          return Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width >=
                                    kBreakpointMedium
                                ? 400.0
                                : 210.0,
                            child: CarouselSlider.builder(
                              itemCount: homeBanners.length,
                              itemBuilder: (context, homeBannersIndex, _) {
                                final homeBannersItem =
                                    homeBanners[homeBannersIndex];
                                return Builder(
                                  builder: (context) {
                                    if (homeBannersItem.type ==
                                        HomeBannerTypes.Book.name) {
                                      return Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: FutureBuilder<List<BooksRow>>(
                                          future: _model.bannerBook(
                                            uniqueQueryKey:
                                                homeBannersItem.id.toString(),
                                            requestFn: () =>
                                                BooksTable().querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'id',
                                                homeBannersItem.bookId,
                                              ),
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return LoadingHomeBannerWidget();
                                            }
                                            List<BooksRow> bannerBooksRowList =
                                                snapshot.data!;

                                            final bannerBooksRow =
                                                bannerBooksRowList.isNotEmpty
                                                    ? bannerBooksRowList.first
                                                    : null;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (homeBannersItem.type ==
                                                    HomeBannerTypes.Book.name) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ModalBookDetailsWidget(
                                                            bookRef:
                                                                bannerBooksRow,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else if (homeBannersItem
                                                        .type ==
                                                    HomeBannerTypes
                                                        .Referral.name) {
                                                  context.pushNamed(
                                                      CoinRedeemWidget
                                                          .routeName);
                                                } else {
                                                  context.pushNamed(
                                                    TropesViewAllWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'selectedTrope':
                                                          serializeParam(
                                                        '',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 400.0,
                                                height: 150.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .bookListLargeModels
                                                      .getModel(
                                                    bannerBooksRow!.id
                                                        .toString(),
                                                    homeBannersIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: BookListLargeWidget(
                                                    key: Key(
                                                      'Keyirs_${bannerBooksRow.id.toString()}',
                                                    ),
                                                    index: 0,
                                                    bookType:
                                                        BookPreviewType.JustOut,
                                                    bookRef: bannerBooksRow,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (homeBannersItem.type ==
                                                HomeBannerTypes.Referral.name) {
                                              context.pushNamed(
                                                CoinRedeemWidget.routeName,
                                                queryParameters: {
                                                  'redemptionCode':
                                                      serializeParam(
                                                    homeBannersItem.codeString,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed(
                                                TropesViewAllWidget.routeName,
                                                queryParameters: {
                                                  'selectedTrope':
                                                      serializeParam(
                                                    '',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 400.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 300),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 300),
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    homeBannersItem.coverImage,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/ctqq8vdknsgv/marketing_03.jpg',
                                                  ),
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage:
                                    max(0, min(0, homeBanners.length - 1)),
                                viewportFraction: 0.9,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 300),
                                autoPlayInterval:
                                    Duration(milliseconds: (300 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: false,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Visibility(
                      visible: FFAppState().userBooksData.isNotEmpty,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 12.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                BookDetailsWithoutScrollWidget.routeName,
                                queryParameters: {
                                  'userbookData': serializeParam(
                                    FFAppState()
                                        .userBooksData
                                        .sortedList(
                                            keyOf: (e) => e.updatedAt!,
                                            desc: true)
                                        .firstOrNull,
                                    ParamType.DataStruct,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            onDoubleTap: () async {
                              context.pushNamed(
                                BookDetailsWithoutScrollWidget.routeName,
                                queryParameters: {
                                  'userbookData': serializeParam(
                                    FFAppState()
                                        .userBooksData
                                        .sortedList(
                                            keyOf: (e) => e.updatedAt!,
                                            desc: true)
                                        .firstOrNull,
                                    ParamType.DataStruct,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            onLongPress: () async {
                              _model.userBookData =
                                  await UserBooksTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  FFAppState()
                                      .userBooksData
                                      .sortedList(
                                          keyOf: (e) => e.updatedAt!,
                                          desc: true)
                                      .firstOrNull
                                      ?.userbookId,
                                ),
                              );
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor:
                                    FlutterFlowTheme.of(context).accent4,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ModalRemoveLibraryWidget(
                                        userBookRef:
                                            _model.userBookData!.firstOrNull!,
                                        userBookData: FFAppState()
                                            .userBooksData
                                            .sortedList(
                                                keyOf: (e) => e.updatedAt!,
                                                desc: true)
                                            .firstOrNull!,
                                        onChapterSelect:
                                            (selectedChapter) async {},
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (FFAppState().userBooksData.isNotEmpty)
                                  Container(
                                    width: 130.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: wrapWithModel(
                                      model: _model.bookCurrentReadingModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BookCurrentReadingWidget(
                                        width: 120,
                                        userbookData: FFAppState()
                                            .userBooksData
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        if (false)
                                          Text(
                                            valueOrDefault<String>(
                                              '${FFAppState().userBooksData.sortedList(keyOf: (e) => e.updatedAt!, desc: true).firstOrNull?.userbookPageNumber.toString()} / ${FFAppState().userBooksData.sortedList(keyOf: (e) => e.updatedAt!, desc: true).firstOrNull?.bookTotalPages.toString()} pages',
                                              '- / - pages',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'PT Serif',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        Text(
                                          valueOrDefault<String>(
                                            FFAppState()
                                                .userBooksData
                                                .firstOrNull
                                                ?.bookName,
                                            'Book Name',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'PT Serif',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: LinearPercentIndicator(
                                            percent: valueOrDefault<double>(
                                                  FFAppState()
                                                      .userBooksData
                                                      .firstOrNull
                                                      ?.bookProgress,
                                                  0.0,
                                                ) /
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'You are ',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .userBooksData
                                                    .firstOrNull
                                                    ?.bookProgress
                                                    .toString(),
                                                '0',
                                              ).maybeHandleOverflow(
                                                maxChars: 4,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '% through this book.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: valueOrDefault<bool>(
                          FFAppState().userBooksData.length >= 2,
                          false,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 278.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.listHeaderViewModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ListHeaderViewWidget(
                                    title:
                                        'Recent books (${valueOrDefault<String>(
                                      FFAppState()
                                          .userBooksData
                                          .length
                                          .toString(),
                                      '0',
                                    )})',
                                    showAction: false,
                                    action: () async {
                                      context.goNamed(
                                        MainLibraryWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final recentReads =
                                          FFAppState().userBooksData.toList();
                                      if (recentReads.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            child: EmptyStateCurrentWidget(),
                                          ),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          16.0,
                                          0,
                                          16.0,
                                          0,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: recentReads.length,
                                        itemBuilder:
                                            (context, recentReadsIndex) {
                                          final recentReadsItem =
                                              recentReads[recentReadsIndex];
                                          return Visibility(
                                            visible: recentReadsIndex != 0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 12.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .bookCurrentReadingModels2
                                                    .getModel(
                                                  recentReadsItem.userbookId
                                                      .toString(),
                                                  recentReadsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: BookCurrentReadingWidget(
                                                  key: Key(
                                                    'Key1oq_${recentReadsItem.userbookId.toString()}',
                                                  ),
                                                  width: 160,
                                                  userbookData: recentReadsItem,
                                                  navigateAction: () async {
                                                    context.pushNamed(
                                                      BookDetailsWithoutScrollWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'userbookData':
                                                            serializeParam(
                                                          recentReadsItem,
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.sectionTropeJustOutModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SectionTropeJustOutWidget(
                          tropeTitle: 'Just Out (24 hrs)',
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.sectionTropePopularTodayModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SectionTropePopularTodayWidget(
                          tropeTitle: 'Most Popular',
                        ),
                      ),
                    ),
                  ],
                ),
                AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final selectedTropes =
                          ((currentUserDocument?.selectedTropes.toList() ?? [])
                                      .isNotEmpty
                                  ? (currentUserDocument?.selectedTropes
                                          .toList() ??
                                      [])
                                  : FFAppState()
                                      .selectedTropes
                                      .map((e) => e)
                                      .toList())
                              .toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: selectedTropes.length,
                        itemBuilder: (context, selectedTropesIndex) {
                          final selectedTropesItem =
                              selectedTropes[selectedTropesIndex];
                          return Container(
                            decoration: BoxDecoration(),
                            child: SectionTropeSelectedWidget(
                              key: Key(
                                  'Keyyzy_${selectedTropesIndex}_of_${selectedTropes.length}'),
                              tropeTitle: selectedTropesItem,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
