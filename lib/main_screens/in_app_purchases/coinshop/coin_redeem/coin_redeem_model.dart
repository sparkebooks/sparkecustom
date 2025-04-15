import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/unlock_page/ui_coin_balance/ui_coin_balance_widget.dart';
import 'coin_redeem_widget.dart' show CoinRedeemWidget;
import 'package:flutter/material.dart';

class CoinRedeemModel extends FlutterFlowModel<CoinRedeemWidget> {
  ///  Local state fields for this page.

  bool codeValid = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ui_coin_balance component.
  late UiCoinBalanceModel uiCoinBalanceModel;
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  String? _taskTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a code to continue.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CoinProductOptionsRow>? coinPackage;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<CoinProductOptionsRow>? updatedRedemptionCode;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PurchasesRow? purchasedCoins;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CoinsRow>? myCoinQuery;

  @override
  void initState(BuildContext context) {
    uiCoinBalanceModel = createModel(context, () => UiCoinBalanceModel());
    taskTextControllerValidator = _taskTextControllerValidator;
  }

  @override
  void dispose() {
    uiCoinBalanceModel.dispose();
    taskFocusNode?.dispose();
    taskTextController?.dispose();
  }
}
