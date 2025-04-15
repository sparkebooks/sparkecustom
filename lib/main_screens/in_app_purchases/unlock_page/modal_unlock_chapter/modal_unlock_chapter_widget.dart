import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/in_app_purchases/unlock_page/modal_upgrade_coins/modal_upgrade_coins_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/new_components/loading_states/loading_modal/loading_modal_widget.dart';
import '/new_components/ui_daily_pass_countdown/ui_daily_pass_countdown_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'modal_unlock_chapter_model.dart';
export 'modal_unlock_chapter_model.dart';

class ModalUnlockChapterWidget extends StatefulWidget {
  const ModalUnlockChapterWidget({
    super.key,
    this.bookID,
    this.callBack,
    this.userBook,
    this.pageView,
    this.isRedeemedSuccessfully,
    required this.remainingChapters,
  });

  final BooksRow? bookID;
  final Future Function(int chapterNum)? callBack;
  final UserBooksRow? userBook;
  final Future Function()? pageView;
  final Future Function(bool isRedeemed, int noOfChaptersRedeemed)?
      isRedeemedSuccessfully;
  final int? remainingChapters;

  @override
  State<ModalUnlockChapterWidget> createState() =>
      _ModalUnlockChapterWidgetState();
}

class _ModalUnlockChapterWidgetState extends State<ModalUnlockChapterWidget> {
  late ModalUnlockChapterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalUnlockChapterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.uiDailyPassCountdownModel.timerValue == '00:00:00') {
        // set_notify_false
        _model.notifyMe = false;
        safeSetState(() {});
      } else {
        // set_notify_true
        _model.notifyMe = true;
        safeSetState(() {});
      }

      _model.bulkChapterNumber = widget.remainingChapters! <
              valueOrDefault<int>(
                widget.bookID?.bulkChapterNumber,
                10,
              )
          ? widget.remainingChapters!
          : valueOrDefault<int>(
              widget.bookID?.bulkChapterNumber,
              10,
            );
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: FutureBuilder<List<CoinsRow>>(
            future: CoinsTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'firebase_user_id',
                currentUserReference?.id,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return LoadingModalWidget();
              }
              List<CoinsRow> updatedDesignCoinsRowList = snapshot.data!;

              final updatedDesignCoinsRow = updatedDesignCoinsRowList.isNotEmpty
                  ? updatedDesignCoinsRowList.first
                  : null;

              return Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x34111417),
                      offset: Offset(
                        0.0,
                        -2.0,
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
                    width: 1.0,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Unlock Next Chapter',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Figtree',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.88, -0.9),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
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
                                    Navigator.pop(context);
                                    FFAppState().isBottomSheetOpen = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.uiCoinBalanceModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: UiCoinBalanceWidget(),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 8.0,
                                borderWidth: 2.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  FFIcons.kbuilding02,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                      UpgradeCoinShopWidget.routeName);
                                },
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Read Now',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.4,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '1 Chapter',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.28),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(${valueOrDefault<String>(
                                                          widget.bookID
                                                              ?.costPerChapter
                                                              ?.toString(),
                                                          '5',
                                                        )}x)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Coin_(256_x_256_px)_(2).png',
                                                      width: 20.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (updatedDesignCoinsRow!.balance! >=
                                              valueOrDefault<int>(
                                                widget.bookID?.costPerChapter,
                                                5,
                                              )) {
                                            _model.isSingleChapterRedeemed =
                                                await actions.redeemChapters(
                                              currentUserUid,
                                              widget.bookID!.id,
                                              1,
                                              valueOrDefault<int>(
                                                widget.bookID?.costPerChapter,
                                                5,
                                              ),
                                              widget.userBook!.id,
                                            );
                                            if (_model
                                                .isSingleChapterRedeemed!) {
                                              // success
                                              Navigator.pop(context);
                                              // successfully_redemed
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Chapter redeemed successfully.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                ),
                                              );
                                            } else {
                                              // failed
                                              Navigator.pop(context);
                                              // failed_to_redeem
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Failed to redeem chapter! Please try again later.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              // go_to_home_page
                                              context.safePop();
                                            }

                                            // I have added an update of the user book details here ... because the book wasn't updated on failure of coin redemption.
                                            // update_user_book_data
                                            FFAppState()
                                                .updateUserBooksDataAtIndex(
                                              FFAppState()
                                                  .userBooksData
                                                  .where((e) =>
                                                      valueOrDefault<bool>(
                                                        e.userbookId ==
                                                            e.userbookId,
                                                        false,
                                                      ))
                                                  .toList()
                                                  .firstOrNull!
                                                  .indexInLocal,
                                              (e) => e
                                                ..userbookPageNumber = (widget
                                                        .userBook!
                                                        .pageNumber!) +
                                                    1,
                                            );
                                            FFAppState().isBottomSheetOpen =
                                                false;
                                            safeSetState(() {});
                                            // single_chapter_redeemed
                                            await widget.isRedeemedSuccessfully
                                                ?.call(
                                              _model.isSingleChapterRedeemed!,
                                              1,
                                            );
                                          } else {
                                            context.pushNamed(
                                                UpgradeCoinShopWidget
                                                    .routeName);
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Redeem',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Figtree',
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 2.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (updatedDesignCoinsRow?.balance != null)
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {},
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Read Now',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.4),
                                                      child: Container(
                                                        height: 24.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                widget.bookID
                                                                    ?.discountPerChapter
                                                                    ?.toString(),
                                                                '20',
                                                              )}% OFF',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          _model
                                                              .bulkChapterNumber
                                                              .toString(),
                                                          '10',
                                                        )} Chapters',
                                                        '10',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.28),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '(${functions.calculateDiscountedCoins(valueOrDefault<int>(
                                                                  _model
                                                                      .bulkChapterNumber,
                                                                  10,
                                                                ), valueOrDefault<double>(
                                                                  widget.bookID
                                                                      ?.costPerChapter
                                                                      ?.toDouble(),
                                                                  5.0,
                                                                ), valueOrDefault<double>(
                                                                  widget.bookID
                                                                      ?.discountPerChapter,
                                                                  30.0,
                                                                )).toString()}x)',
                                                            '0x',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Figtree',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Coin_(256_x_256_px)_(2).png',
                                                        width: 20.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (updatedDesignCoinsRow!
                                                    .balance! >=
                                                functions.getTotalDiscount(
                                                    valueOrDefault<int>(
                                                      _model.bulkChapterNumber,
                                                      10,
                                                    ),
                                                    valueOrDefault<double>(
                                                      widget.bookID
                                                          ?.costPerChapter
                                                          ?.toDouble(),
                                                      5.0,
                                                    ))!) {
                                              // chapters_redeemable
                                              _model.areMultipleChaptersRedeemed =
                                                  await actions.redeemChapters(
                                                currentUserUid,
                                                widget.bookID!.id,
                                                valueOrDefault<int>(
                                                  _model.bulkChapterNumber,
                                                  10,
                                                ),
                                                valueOrDefault<int>(
                                                  widget
                                                      .bookID?.costPerChapter,
                                                  5,
                                                ),
                                                widget.userBook!.id,
                                              );
                                              if (_model
                                                  .areMultipleChaptersRedeemed!) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Chapters redeemed successfully.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                  ),
                                                );
                                              } else {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Failed to redeem chapters! Please try again later.',
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
                                                            .error,
                                                  ),
                                                );
                                                context.safePop();
                                              }

                                              FFAppState().isBottomSheetOpen =
                                                  false;
                                              safeSetState(() {});
                                              await widget
                                                  .isRedeemedSuccessfully
                                                  ?.call(
                                                _model
                                                    .areMultipleChaptersRedeemed!,
                                                valueOrDefault<int>(
                                                  _model.bulkChapterNumber,
                                                  10,
                                                ),
                                              );
                                            } else {
                                              // go_to_coin_shop

                                              context.pushNamed(
                                                  UpgradeCoinShopWidget
                                                      .routeName);
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Redeem',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (updatedDesignCoinsRow!.balance! >= 5)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        // redeem_coins_purchases
                                        _model.redeemedCoins2 =
                                            await PurchasesTable().insert({
                                          'book_id': widget.bookID?.id,
                                          'amount': 5.0,
                                          'currency': TransactionType.COIN.name,
                                          'created_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'updated_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'firebase_user_id':
                                              currentUserReference?.id,
                                          'description':
                                              'Redeemed 5 coins for ${valueOrDefault<String>(
                                            widget.bookID?.title,
                                            'Book',
                                          )}',
                                          'coin_amount': 5,
                                        });
                                        // get_user_coins
                                        _model.userCoins2 =
                                            await CoinsTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'firebase_user_id',
                                            currentUserReference?.id,
                                          ),
                                        );
                                        // reduce_coins_user
                                        await CoinsTable().update(
                                          data: {
                                            'balance': ((_model.userCoins2!
                                                    .firstOrNull!.balance!) -
                                                5),
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'firebase_user_id',
                                            currentUserReference?.id,
                                          ),
                                        );
                                        await action_blocks.successSnackBar(
                                          context,
                                          snackbarText:
                                              'Congrats! You have redeemed 5 coins!',
                                        );
                                        await UserBooksTable().update(
                                          data: {
                                            'chapters_unlocked': widget
                                                    .userBook!
                                                    .chaptersUnlocked +
                                                1,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.userBook?.id,
                                          ),
                                        );
                                        await widget.callBack?.call(
                                          1,
                                        );
                                        Navigator.pop(context);

                                        safeSetState(() {});
                                      },
                                      text: '5 coins to read this chapter',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (updatedDesignCoinsRow.balance! >= 103)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('coin_purchase_103 pressed ...');
                                      },
                                      text: '103 coins to read 20 chapters',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (updatedDesignCoinsRow.balance! < 103)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalUpgradeCoinsWidget(
                                              price: 9.99,
                                              packageName:
                                                  '20 Chapter Discount',
                                              coinAmount: 103,
                                              coinBonus: 0,
                                              revenuecatPackageId: 'coins_50',
                                              priceStringWithSymbol: revenue_cat
                                                  .offerings!.current!
                                                  .getPackage('coins_50')!
                                                  .storeProduct
                                                  .priceString,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Unlock more than 1 chapter',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                                          width: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 2.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'PURCHASE NOW',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 2.0))
                                                    .addToEnd(
                                                        SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.4),
                                              child: Container(
                                                width: 80.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '20% OFF',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (updatedDesignCoinsRow.balance! < 103)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalUpgradeCoinsWidget(
                                              price: 9.99,
                                              packageName:
                                                  '20 Chapter Discount',
                                              coinAmount: 103,
                                              coinBonus: 0,
                                              revenuecatPackageId: 'coins_50',
                                              priceStringWithSymbol: revenue_cat
                                                  .offerings!.current!
                                                  .getPackage('coins_50')!
                                                  .storeProduct
                                                  .priceString,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Unlock more than 1 chapter',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                                          width: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 2.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'PURCHASE NOW',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 2.0))
                                                    .addToEnd(
                                                        SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.4),
                                              child: Container(
                                                width: 80.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '20% OFF',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: wrapWithModel(
                                model: _model.uiDailyPassCountdownModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: UiDailyPassCountdownWidget(
                                  timerStops: () async {
                                    // update_page_notify
                                    _model.notifyMe = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                            if ((_model.uiDailyPassCountdownModel.timerValue ==
                                    '00:00:00') &&
                                (_model.notifyMe == false))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      // update_user_doc_with_daily_pass

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        dailyPassLastActive:
                                            getCurrentTimestamp,
                                      ));
                                      // updating_book_daily_pass_counter
                                      await BooksTable().update(
                                        data: {
                                          'daily_pass_counter':
                                              valueOrDefault<int>(
                                                    widget.bookID
                                                        ?.dailyPassCounter,
                                                    0,
                                                  ) +
                                                  1,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.bookID?.id,
                                        ),
                                      );
                                      await widget.callBack?.call(
                                        1,
                                      );
                                      FFAppState().isBottomSheetOpen = false;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    },
                                    text: 'Use Daily Pass',
                                    icon: FaIcon(
                                      FontAwesomeIcons.ticketAlt,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            if ((_model.uiDailyPassCountdownModel.timerValue !=
                                    '00:00:00') ||
                                (_model.notifyMe == true))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().notificationScheduled) {
                                        // already_scheduled
                                        await action_blocks.successSnackBar(
                                          context,
                                          snackbarText:
                                              'You already have a notification scheduled.',
                                        );
                                        safeSetState(() {});
                                      } else {
                                        // send_reminder_notification
                                        triggerPushNotification(
                                          notificationTitle:
                                              'Continue reading ${valueOrDefault<String>(
                                            widget.bookID?.title,
                                            'your book',
                                          )}.',
                                          notificationText:
                                              'Jump back into chapter ${valueOrDefault<String>(
                                            widget.userBook?.chapterIndex
                                                ?.toString(),
                                            '0',
                                          )}.',
                                          notificationImageUrl:
                                              widget.bookID?.coverImage,
                                          scheduledTime:
                                              functions.getTomorrowsDateTime(
                                                  getCurrentTimestamp)!,
                                          notificationSound: 'default',
                                          userRefs: [currentUserReference!],
                                          initialPageName: 'sparkeBooks',
                                          parameterData: {
                                            'bookId': widget.bookID?.id,
                                          },
                                        );
                                        await action_blocks.successSnackBar(
                                          context,
                                          snackbarText:
                                              'You got it! We\'ll notify you once your daily pass is available again.',
                                        );
                                        safeSetState(() {});
                                        // notification_Scheduled_true
                                        FFAppState().notificationScheduled =
                                            true;
                                        safeSetState(() {});
                                      }

                                      Navigator.pop(context);
                                      FFAppState().isBottomSheetOpen = false;
                                      safeSetState(() {});
                                      context.safePop();
                                    },
                                    text: 'Notify Me',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            if (false)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      FFAppState().isBottomSheetOpen = false;
                                      safeSetState(() {});
                                      context.safePop();
                                    },
                                    text: 'Stop reading for now...',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                          ]
                              .divide(SizedBox(height: 12.0))
                              .addToStart(SizedBox(height: 8.0)),
                        ),
                      ]
                          .addToStart(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
