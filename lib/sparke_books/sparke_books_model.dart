import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_page/loading_page_widget.dart';
import '/index.dart';
import 'sparke_books_widget.dart' show SparkeBooksWidget;
import 'package:flutter/material.dart';

class SparkeBooksModel extends FlutterFlowModel<SparkeBooksWidget> {
  ///  Local state fields for this page.

  UserBooksDataStruct? userBook;
  void updateUserBookStruct(Function(UserBooksDataStruct) updateFn) {
    updateFn(userBook ??= UserBooksDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in sparkeBooks widget.
  List<BooksRow>? book;
  // Model for loading_page component.
  late LoadingPageModel loadingPageModel;

  @override
  void initState(BuildContext context) {
    loadingPageModel = createModel(context, () => LoadingPageModel());
  }

  @override
  void dispose() {
    loadingPageModel.dispose();
  }
}
