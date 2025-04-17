import '/flutter_flow/flutter_flow_util.dart';
import 'tropes_page_no_results_widget.dart' show TropesPageNoResultsWidget;
import 'package:flutter/material.dart';

class TropesPageNoResultsModel
    extends FlutterFlowModel<TropesPageNoResultsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
