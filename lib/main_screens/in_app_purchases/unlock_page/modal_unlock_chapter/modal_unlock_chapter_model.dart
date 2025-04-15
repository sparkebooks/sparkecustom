import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/new_components/ui_daily_pass_countdown/ui_daily_pass_countdown_widget.dart';
import 'modal_unlock_chapter_widget.dart' show ModalUnlockChapterWidget;
import 'package:flutter/material.dart';

class ModalUnlockChapterModel
    extends FlutterFlowModel<ModalUnlockChapterWidget> {
  ///  Local state fields for this component.

  bool notifyMe = false;

  int? coinSelected;

  int? totalAmount;

  int bulkChapterNumber = 0;

  ///  State fields for stateful widgets in this component.

  // Model for ui_coin_balance component.
  late UiCoinBalanceModel uiCoinBalanceModel;
  // Stores action output result for [Custom Action - redeemChapters] action in Button widget.
  bool? isSingleChapterRedeemed;
  // Stores action output result for [Custom Action - redeemChapters] action in Button widget.
  bool? areMultipleChaptersRedeemed;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PurchasesRow? redeemedCoins2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CoinsRow>? userCoins2;
  // Model for ui_daily_pass_countdown component.
  late UiDailyPassCountdownModel uiDailyPassCountdownModel;

  @override
  void initState(BuildContext context) {
    uiCoinBalanceModel = createModel(context, () => UiCoinBalanceModel());
    uiDailyPassCountdownModel =
        createModel(context, () => UiDailyPassCountdownModel());
  }

  @override
  void dispose() {
    uiCoinBalanceModel.dispose();
    uiDailyPassCountdownModel.dispose();
  }
}
