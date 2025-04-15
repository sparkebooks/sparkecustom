import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/ui_book_loves/ui_book_loves_widget.dart';
import 'modal_book_details_widget.dart' show ModalBookDetailsWidget;
import 'package:flutter/material.dart';

class ModalBookDetailsModel extends FlutterFlowModel<ModalBookDetailsWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getVariantCoverAndBlurb] action in modal_book_details widget.
  VariantCoverAndBlurbStruct? aBTestVariantCoverAndBlurb;
  // Stores action output result for [Backend Call - Update Row(s)] action in modal_book_details widget.
  List<BooksRow>? newView;
  // Model for ui_book_loves component.
  late UiBookLovesModel uiBookLovesModel;

  @override
  void initState(BuildContext context) {
    uiBookLovesModel = createModel(context, () => UiBookLovesModel());
  }

  @override
  void dispose() {
    uiBookLovesModel.dispose();
  }
}
