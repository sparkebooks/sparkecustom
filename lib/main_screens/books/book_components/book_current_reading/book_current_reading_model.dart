import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_book_single/loading_book_single_widget.dart';
import 'book_current_reading_widget.dart' show BookCurrentReadingWidget;
import 'package:flutter/material.dart';

class BookCurrentReadingModel
    extends FlutterFlowModel<BookCurrentReadingWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in book_container widget.
  List<UserBooksRow>? getUserBookId;
  // Model for loading_book_single component.
  late LoadingBookSingleModel loadingBookSingleModel;

  @override
  void initState(BuildContext context) {
    loadingBookSingleModel =
        createModel(context, () => LoadingBookSingleModel());
  }

  @override
  void dispose() {
    loadingBookSingleModel.dispose();
  }
}
