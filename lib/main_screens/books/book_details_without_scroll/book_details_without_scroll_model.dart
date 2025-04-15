import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_page/loading_page_widget.dart';
import 'book_details_without_scroll_widget.dart'
    show BookDetailsWithoutScrollWidget;
import 'package:flutter/material.dart';

class BookDetailsWithoutScrollModel
    extends FlutterFlowModel<BookDetailsWithoutScrollWidget> {
  ///  Local state fields for this page.

  int unlockedChapters = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in book_details_without_scroll widget.
  List<BooksRow>? bookref;
  // Stores action output result for [Backend Call - Query Rows] action in book_details_without_scroll widget.
  List<UserBooksRow>? userbookref;
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

  /// Action blocks.
  Future bookReaderPaywallFlow(
    BuildContext context, {
    double? bookProgress,
    int? currentChapter,
  }) async {}
}
