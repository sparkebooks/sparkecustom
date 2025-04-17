import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/coinshop/ui_coins_popular/ui_coins_popular_widget.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/index.dart';
import 'upgrade_coin_shop_widget.dart' show UpgradeCoinShopWidget;
import 'package:flutter/material.dart';

class UpgradeCoinShopModel extends FlutterFlowModel<UpgradeCoinShopWidget> {
  ///  Local state fields for this page.

  int currentBalance = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in upgrade_coin_shop widget.
  List<CoinsRow>? initialBalance;
  // Model for ui_coin_balance component.
  late UiCoinBalanceModel uiCoinBalanceModel;
  // Models for ui_coins_popular dynamic component.
  late FlutterFlowDynamicModels<UiCoinsPopularModel> uiCoinsPopularModels;

  @override
  void initState(BuildContext context) {
    uiCoinBalanceModel = createModel(context, () => UiCoinBalanceModel());
    uiCoinsPopularModels =
        FlutterFlowDynamicModels(() => UiCoinsPopularModel());
  }

  @override
  void dispose() {
    uiCoinBalanceModel.dispose();
    uiCoinsPopularModels.dispose();
  }
}
