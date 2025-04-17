import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import 'section_trope_just_out_widget.dart' show SectionTropeJustOutWidget;
import 'package:flutter/material.dart';

class SectionTropeJustOutModel
    extends FlutterFlowModel<SectionTropeJustOutWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for list_header_view component.
  late ListHeaderViewModel listHeaderViewModel;
  // Models for book_list_large dynamic component.
  late FlutterFlowDynamicModels<BookListLargeModel> bookListLargeModels;

  @override
  void initState(BuildContext context) {
    listHeaderViewModel = createModel(context, () => ListHeaderViewModel());
    bookListLargeModels = FlutterFlowDynamicModels(() => BookListLargeModel());
  }

  @override
  void dispose() {
    listHeaderViewModel.dispose();
    bookListLargeModels.dispose();
  }
}
