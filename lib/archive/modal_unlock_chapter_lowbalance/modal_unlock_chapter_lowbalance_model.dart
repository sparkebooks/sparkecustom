import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import '/new_components/ui_daily_pass_countdown/ui_daily_pass_countdown_widget.dart';
import 'modal_unlock_chapter_lowbalance_widget.dart'
    show ModalUnlockChapterLowbalanceWidget;
import 'package:flutter/material.dart';

class ModalUnlockChapterLowbalanceModel
    extends FlutterFlowModel<ModalUnlockChapterLowbalanceWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ui_coin_balance component.
  late UiCoinBalanceModel uiCoinBalanceModel;
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
