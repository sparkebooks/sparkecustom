import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/list_transaction_coins/list_transaction_coins_widget.dart';
import 'profile_transactions_widget.dart' show ProfileTransactionsWidget;
import 'package:flutter/material.dart';

class ProfileTransactionsModel
    extends FlutterFlowModel<ProfileTransactionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for list_transaction_coins dynamic component.
  late FlutterFlowDynamicModels<ListTransactionCoinsModel>
      listTransactionCoinsModels2;

  @override
  void initState(BuildContext context) {
    listTransactionCoinsModels2 =
        FlutterFlowDynamicModels(() => ListTransactionCoinsModel());
  }

  @override
  void dispose() {
    listTransactionCoinsModels2.dispose();
  }
}
