import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/in_app_purchases/coinshop/ui_coins_popular/ui_coins_popular_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/modal_upgrade_coins/modal_upgrade_coins_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'upgrade_coin_shop_model.dart';
export 'upgrade_coin_shop_model.dart';

class UpgradeCoinShopWidget extends StatefulWidget {
  const UpgradeCoinShopWidget({super.key});

  static String routeName = 'upgrade_coin_shop';
  static String routePath = 'upgradeCoinShop';

  @override
  State<UpgradeCoinShopWidget> createState() => _UpgradeCoinShopWidgetState();
}

class _UpgradeCoinShopWidgetState extends State<UpgradeCoinShopWidget> {
  late UpgradeCoinShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpgradeCoinShopModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initialBalance = await CoinsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'firebase_user_id',
          currentUserReference?.id,
        ),
      );
      _model.currentBalance = _model.initialBalance!.firstOrNull!.balance!;
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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<CoinPackagesRow>>(
            future: CoinPackagesTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'active',
                    true,
                  )
                  .order('index', ascending: true),
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
              List<CoinPackagesRow> coinPackagesCoinPackagesRowList =
                  snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: wrapWithModel(
                                model: _model.uiCoinBalanceModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: UiCoinBalanceWidget(),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.anonymousUser,
                                    false) ==
                                true)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          AuthMainWidget.routeName,
                                          queryParameters: {
                                            'showBack': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'Login to purchase coins',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Current offers',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final currentOffers =
                                    coinPackagesCoinPackagesRowList.toList();

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    8.0,
                                    0,
                                    8.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.7,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: currentOffers.length,
                                  itemBuilder: (context, currentOffersIndex) {
                                    final currentOffersItem =
                                        currentOffers[currentOffersIndex];
                                    return InkWell(
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
                                                child: ModalUpgradeCoinsWidget(
                                                  price: revenue_cat
                                                      .offerings!
                                                      .current!
                                                      .availablePackages
                                                      .where((e) =>
                                                          e.storeProduct
                                                              .identifier ==
                                                          currentOffersItem
                                                              .revenuecatPackageId)
                                                      .toList()
                                                      .firstOrNull!
                                                      .storeProduct
                                                      .price,
                                                  packageName: currentOffersItem
                                                              .discountPercent !=
                                                          null
                                                      ? 'Save ${currentOffersItem.discountPercent?.toString()}%'
                                                      : null,
                                                  coinAmount: currentOffersItem
                                                      .baseCoins,
                                                  coinBonus: currentOffersItem
                                                      .bonusCoins,
                                                  revenuecatPackageId:
                                                      currentOffersItem
                                                          .revenuecatPackageId,
                                                  priceStringWithSymbol: revenue_cat
                                                      .offerings!
                                                      .current!
                                                      .availablePackages
                                                      .where((e) =>
                                                          e.storeProduct
                                                              .identifier ==
                                                          currentOffersItem
                                                              .revenuecatPackageId)
                                                      .toList()
                                                      .firstOrNull!
                                                      .storeProduct
                                                      .priceString,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: wrapWithModel(
                                        model: _model.uiCoinsPopularModels
                                            .getModel(
                                          currentOffersIndex.toString(),
                                          currentOffersIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UiCoinsPopularWidget(
                                          key: Key(
                                            'Keytac_${currentOffersIndex.toString()}',
                                          ),
                                          coinTitle:
                                              currentOffersItem.baseCoins,
                                          coinBonus:
                                              currentOffersItem.bonusCoins,
                                          price: revenue_cat.offerings!.current!
                                              .availablePackages
                                              .where((e) =>
                                                  e.storeProduct.identifier ==
                                                  currentOffersItem
                                                      .revenuecatPackageId)
                                              .toList()
                                              .firstOrNull!
                                              .storeProduct
                                              .priceString,
                                          marketingMessage: currentOffersItem
                                                      .discountPercent !=
                                                  null
                                              ? 'Save ${currentOffersItem.discountPercent?.toString()}%'
                                              : null,
                                          cardType:
                                              currentOffersItem.isMostPopular
                                                  ? Type.Popular
                                                  : Type.Regular,
                                          revenuecatPackageId: currentOffersItem
                                              .revenuecatPackageId,
                                          countryCode: (String var1) {
                                            return var1.contains('\$');
                                          }(revenue_cat.offerings!.current!
                                                  .availablePackages
                                                  .where((e) =>
                                                      e.storeProduct
                                                          .identifier ==
                                                      currentOffersItem
                                                          .revenuecatPackageId)
                                                  .toList()
                                                  .firstOrNull!
                                                  .storeProduct
                                                  .priceString)
                                              ? 'USD'
                                              : '',
                                          priceInDouble: revenue_cat.offerings!
                                              .current!.availablePackages
                                              .where((e) =>
                                                  e.storeProduct.identifier ==
                                                  currentOffersItem
                                                      .revenuecatPackageId)
                                              .toList()
                                              .firstOrNull!
                                              .storeProduct
                                              .price,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 16.0)),
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
