import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_upgrade_coins_widget.dart' show ModalUpgradeCoinsWidget;
import 'package:flutter/material.dart';

class ModalUpgradeCoinsModel extends FlutterFlowModel<ModalUpgradeCoinsWidget> {
  ///  Local state fields for this component.

  bool? redeemingCoins = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? purchaseRevenuecat;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PurchasesRow? newPurchase;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CoinsRow>? coinData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
