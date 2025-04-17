import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'coin_redeem_model.dart';
export 'coin_redeem_model.dart';

class CoinRedeemWidget extends StatefulWidget {
  const CoinRedeemWidget({
    super.key,
    this.redemptionCode,
  });

  final String? redemptionCode;

  static String routeName = 'coin_redeem';
  static String routePath = 'coinRedeem';

  @override
  State<CoinRedeemWidget> createState() => _CoinRedeemWidgetState();
}

class _CoinRedeemWidgetState extends State<CoinRedeemWidget>
    with TickerProviderStateMixin {
  late CoinRedeemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoinRedeemModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.redemptionCode != null && widget.redemptionCode != '') {
        // set_textfield
        _model.codeValid = false;
        safeSetState(() {});
        safeSetState(() {
          _model.taskTextController?.text = widget.redemptionCode!;
        });
      } else {
        // hide_code
        _model.codeValid = false;
        safeSetState(() {});
      }
    });

    _model.taskTextController ??=
        TextEditingController(text: widget.redemptionCode);
    _model.taskFocusNode ??= FocusNode();
    _model.taskFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
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
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Redeem Coins',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'PT Serif',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Please enter your code below to redeem coins!',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Figtree',
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 770.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    70.0, 12.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Coin_(256_x_256_px)_(1).png',
                                                width: 100.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Coin_(256_x_256_px)_(1).png',
                                            width: 100.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 70.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Coin_(256_x_256_px)_(1).png',
                                                width: 100.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.uiCoinBalanceModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: UiCoinBalanceWidget(),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Enter the Code',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'PT Serif',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Enter your redemption code below to get the coins!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'Please make sure the code matches exactly i.e. \"MOON24\".',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _model.taskTextController,
                                    focusNode: _model.taskFocusNode,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Redeem code...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'PT Serif',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: (_model
                                                  .taskFocusNode?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 20.0, 16.0, 20.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'PT Serif',
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .taskTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  if (_model.codeValid == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Visibility(
                                          visible:
                                              _model.coinPackage?.length == 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 16.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Valid Code',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'The code you entered ',
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
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          _model
                                                              .taskTextController
                                                              .text,
                                                          '--',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' is valid, redeem now for:',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          formatNumber(
                                                            _model
                                                                .coinPackage
                                                                ?.firstOrNull
                                                                ?.coinAmount,
                                                            formatType:
                                                                FormatType
                                                                    .compact,
                                                          ),
                                                          '0',
                                                        ),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: ' coins',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'PT Serif',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                  if (!_model.codeValid)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (!(currentUserDocument
                                                      ?.myRedeemedCodes
                                                      .toList() ??
                                                  [])
                                              .contains(_model
                                                  .taskTextController.text)) {
                                            // GET_ACTIVE_CODES
                                            _model.coinPackage =
                                                await CoinProductOptionsTable()
                                                    .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'package_name',
                                                    _model.taskTextController
                                                        .text,
                                                  )
                                                  .eqOrNull(
                                                    'active',
                                                    true,
                                                  ),
                                            );
                                            if (_model.coinPackage?.length ==
                                                1) {
                                              // code_is_valid
                                              _model.codeValid = true;
                                              safeSetState(() {});
                                            } else {
                                              // code_not_valid
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'The code you entered is not valid or the code is no longer active.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
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
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You have already redeemed this code!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Check Code',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.codeValid)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          // add_code_to_user_list

                                          await currentUserReference!.update({
                                            ...createUsersRecordData(
                                              lastActiveTime:
                                                  getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'my_redeemed_codes':
                                                    FieldValue.arrayUnion([
                                                  _model.coinPackage
                                                      ?.firstOrNull?.packageName
                                                ]),
                                              },
                                            ),
                                          });
                                          // update_times_redeemed
                                          _model.updatedRedemptionCode =
                                              await CoinProductOptionsTable()
                                                  .update(
                                            data: {
                                              'updated_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'times_redeemed':
                                                  (valueOrDefault<int>(
                                                        _model
                                                            .coinPackage
                                                            ?.firstOrNull
                                                            ?.timesRedeemed,
                                                        0,
                                                      ) +
                                                      1),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              _model
                                                  .coinPackage?.firstOrNull?.id,
                                            ),
                                            returnRows: true,
                                          );
                                          // create_purchase
                                          _model.purchasedCoins =
                                              await PurchasesTable().insert({
                                            'currency':
                                                TransactionType.REFERRAL.name,
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'firebase_user_id':
                                                currentUserReference?.id,
                                            'description':
                                                '${valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Guest',
                                            )} has redeemed ${valueOrDefault<String>(
                                              formatNumber(
                                                _model.coinPackage?.firstOrNull
                                                    ?.coinAmount,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            )} coins with code: ${valueOrDefault<String>(
                                              _model.coinPackage?.firstOrNull
                                                  ?.packageName,
                                              'Redemption Code',
                                            )}.',
                                            'coin_amount': valueOrDefault<int>(
                                              _model.coinPackage?.firstOrNull
                                                  ?.coinAmount,
                                              0,
                                            ),
                                            'used': false,
                                            'amount': 0.0,
                                          });
                                          // my_coin_query
                                          _model.myCoinQuery =
                                              await CoinsTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'firebase_user_id',
                                              currentUserReference?.id,
                                            ),
                                          );
                                          // update_user_coin_package
                                          await CoinsTable().update(
                                            data: {
                                              'updated_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'sparke_coins':
                                                  (valueOrDefault<int>(
                                                        _model
                                                            .myCoinQuery
                                                            ?.firstOrNull
                                                            ?.sparkeCoins,
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        _model.purchasedCoins
                                                            ?.coinAmount,
                                                        0,
                                                      )),
                                              'balance': (valueOrDefault<int>(
                                                    _model.myCoinQuery
                                                        ?.firstOrNull?.balance,
                                                    0,
                                                  ) +
                                                  valueOrDefault<int>(
                                                    _model.purchasedCoins
                                                        ?.coinAmount,
                                                    0,
                                                  )),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'firebase_user_id',
                                              currentUserReference?.id,
                                            ),
                                          );
                                          await action_blocks.successSnackBar(
                                            context,
                                            snackbarText:
                                                'You have successfully redeemed ${valueOrDefault<String>(
                                              formatNumber(
                                                _model.coinPackage?.firstOrNull
                                                    ?.coinAmount,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            )} coins with code: ${valueOrDefault<String>(
                                              _model.coinPackage?.firstOrNull
                                                  ?.packageName,
                                              'Redemption Code',
                                            )}.',
                                          );
                                          safeSetState(() {});
                                          context.safePop();

                                          safeSetState(() {});
                                        },
                                        text: 'Redeem COINS',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Figtree',
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
                                    ),
                                ]
                                    .divide(SizedBox(height: 12.0))
                                    .addToStart(SizedBox(height: 16.0))
                                    .addToEnd(SizedBox(height: 32.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 770.0,
                ),
                decoration: BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
