import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import 'section_trope_selected_widget.dart' show SectionTropeSelectedWidget;
import 'package:flutter/material.dart';

class SectionTropeSelectedModel
    extends FlutterFlowModel<SectionTropeSelectedWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for list_header_view component.
  late ListHeaderViewModel listHeaderViewModel;

  @override
  void initState(BuildContext context) {
    listHeaderViewModel = createModel(context, () => ListHeaderViewModel());
  }

  @override
  void dispose() {
    listHeaderViewModel.dispose();
  }
}
