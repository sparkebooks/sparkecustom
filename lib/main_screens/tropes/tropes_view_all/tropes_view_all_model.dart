import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tropes_view_all_widget.dart' show TropesViewAllWidget;
import 'package:flutter/material.dart';

class TropesViewAllModel extends FlutterFlowModel<TropesViewAllWidget> {
  ///  Local state fields for this page.

  String sort = 'Top';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
