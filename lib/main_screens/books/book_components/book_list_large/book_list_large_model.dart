import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/ui_book_loves/ui_book_loves_widget.dart';
import '/new_components/loading_states/loading_book/loading_book_widget.dart';
import 'book_list_large_widget.dart' show BookListLargeWidget;
import 'package:flutter/material.dart';

class BookListLargeModel extends FlutterFlowModel<BookListLargeWidget> {
  ///  Local state fields for this component.

  int? blurbCount;

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getVariantCoverAndBlurb] action in book_list_large widget.
  VariantCoverAndBlurbStruct? aBTestBookCoverAndBlurb;
  // Model for loading_book component.
  late LoadingBookModel loadingBookModel;
  // Model for ui_book_loves component.
  late UiBookLovesModel uiBookLovesModel1;
  // Model for book_current_reading component.
  late BookCurrentReadingModel bookCurrentReadingModel;
  // Model for ui_book_loves component.
  late UiBookLovesModel uiBookLovesModel2;
  // Model for ui_book_loves component.
  late UiBookLovesModel uiBookLovesModel3;

  @override
  void initState(BuildContext context) {
    loadingBookModel = createModel(context, () => LoadingBookModel());
    uiBookLovesModel1 = createModel(context, () => UiBookLovesModel());
    bookCurrentReadingModel =
        createModel(context, () => BookCurrentReadingModel());
    uiBookLovesModel2 = createModel(context, () => UiBookLovesModel());
    uiBookLovesModel3 = createModel(context, () => UiBookLovesModel());
  }

  @override
  void dispose() {
    loadingBookModel.dispose();
    uiBookLovesModel1.dispose();
    bookCurrentReadingModel.dispose();
    uiBookLovesModel2.dispose();
    uiBookLovesModel3.dispose();
  }
}
