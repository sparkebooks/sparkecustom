import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'modal_upgrade_coins_model.dart';
export 'modal_upgrade_coins_model.dart';

/// A component for upgrading coins, a confirmation dialog before purchase.
class ModalUpgradeCoinsWidget extends StatefulWidget {
  const ModalUpgradeCoinsWidget({
    super.key,
    double? price,
    required this.packageName,
    required this.coinAmount,
    required this.coinBonus,
    required this.revenuecatPackageId,
    required this.priceStringWithSymbol,
  }) : this.price = price ?? 0.0;

  final double price;
  final String? packageName;
  final int? coinAmount;
  final int? coinBonus;
  final String? revenuecatPackageId;
  final String? priceStringWithSymbol;

  @override
  State<ModalUpgradeCoinsWidget> createState() =>
      _ModalUpgradeCoinsWidgetState();
}

class _ModalUpgradeCoinsWidgetState extends State<ModalUpgradeCoinsWidget>
    with TickerProviderStateMixin {
  late ModalUpgradeCoinsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalUpgradeCoinsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.redeemingCoins = false;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -50.0),
            end: Offset(0.0, 50.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 52.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -50.0),
            end: Offset(0.0, 50.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 52.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1200.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -50.0),
            end: Offset(0.0, 50.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 50.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -50.0),
            end: Offset(0.0, 50.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 55.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 800.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, -50.0),
            end: Offset(0.0, 50.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 40.0),
          ),
        ],
      ),
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
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 60.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Purchase Coins',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'PT Serif',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Text(
                  'Review your order below before checking out.',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Coin_(256_x_256_px)_(2).png',
                            width: 30.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${valueOrDefault<String>(
                                formatNumber(
                                  widget.coinAmount,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                ),
                                '0',
                              )}',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: ' +',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.coinBonus?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'PT Serif',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            'Upgrade details',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New coins',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '+${valueOrDefault<String>(
                            formatNumber(
                              widget.coinAmount,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                            ),
                            '0',
                          )}',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bonus coins',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '+${valueOrDefault<String>(
                            widget.coinBonus?.toString(),
                            '0',
                          )}',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New coin total',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            formatNumber(
                              ((widget.coinAmount!) + (widget.coinBonus!)),
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                            ),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Total Cost',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 36.0,
                                icon: Icon(
                                  Icons.info_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                          if (false)
                            Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  widget.price,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: '\$',
                                ),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'PT Serif',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          Text(
                            valueOrDefault<String>(
                              widget.priceStringWithSymbol,
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    if (_model.redeemingCoins ?? true)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            child: Container(
                              height: 60.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          160.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation1']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 120.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Coin_(256_x_256_px)_(2).png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation3']!),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation4']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Coin_(256_x_256_px)_(2).png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation5']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Adding coins to your account...',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 12.0)),
                      ),
                    FFButtonWidget(
                      onPressed: _model.redeemingCoins!
                          ? null
                          : () async {
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.anonymousUser,
                                      false) ==
                                  true) {
                                // login

                                context.pushNamed(
                                  AuthMainWidget.routeName,
                                  queryParameters: {
                                    'showBack': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              } else {
                                // show_loading_action
                                _model.redeemingCoins = true;
                                safeSetState(() {});
                                _model.purchaseRevenuecat =
                                    await revenue_cat.purchasePackage(
                                        widget.revenuecatPackageId!);
                                if (_model.purchaseRevenuecat!) {
                                  // add_new_purchase
                                  _model.newPurchase =
                                      await PurchasesTable().insert({
                                    'amount': widget.price,
                                    'currency': 'USD',
                                    'created_at': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                    'updated_at': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                    'firebase_user_id':
                                        currentUserReference?.id,
                                    'description': widget.packageName,
                                    'coin_amount': valueOrDefault<int>(
                                      ((widget.coinAmount!) +
                                          (widget.coinBonus!)),
                                      0,
                                    ),
                                  });
                                  // get_current_coin_data
                                  _model.coinData =
                                      await CoinsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'firebase_user_id',
                                      currentUserUid,
                                    ),
                                  );
                                  if (_model.coinData != null &&
                                      (_model.coinData)!.isNotEmpty) {
                                    // update_user_coin_table
                                    await CoinsTable().update(
                                      data: {
                                        'balance': valueOrDefault<int>(
                                          ((_model.coinData!.firstOrNull!
                                                  .balance!) +
                                              valueOrDefault<int>(
                                                (valueOrDefault<int>(
                                                      widget.coinAmount,
                                                      0,
                                                    ) +
                                                    valueOrDefault<int>(
                                                      widget.coinBonus,
                                                      0,
                                                    )),
                                                0,
                                              )),
                                          0,
                                        ),
                                        'firebase_user_id': currentUserUid,
                                        'purchased_coins':
                                            (widget.coinAmount!) +
                                                (widget.coinBonus!),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'firebase_user_id',
                                        currentUserReference?.id,
                                      ),
                                    );
                                  } else {
                                    // update_user_coin_table
                                    await CoinsTable().insert({
                                      'balance': valueOrDefault<int>(
                                        widget.coinAmount,
                                        0,
                                      ),
                                      'firebase_user_id': currentUserUid,
                                    });
                                  }

                                  // succes_message
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'You have successfully purchased ${valueOrDefault<String>(
                                          formatNumber(
                                            ((widget.coinAmount!) +
                                                (widget.coinBonus!)),
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          ),
                                          '0',
                                        )} more coins!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Figtree',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  // hide_redeeming_coin
                                  _model.redeemingCoins = false;
                                  safeSetState(() {});
                                  context.safePop();
                                } else {
                                  // hide_redeeming_coin
                                  _model.redeemingCoins = false;
                                  safeSetState(() {});
                                }
                              }

                              FFAppState().isBottomSheetOpen = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                      text: 'Complete Purchase',
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
                        disabledColor: FlutterFlowTheme.of(context).accent1,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).primary800,
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 4.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
        ),
      ),
    );
  }
}
