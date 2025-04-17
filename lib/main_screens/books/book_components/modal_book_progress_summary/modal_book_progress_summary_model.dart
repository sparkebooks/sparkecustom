import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'modal_book_progress_summary_widget.dart'
    show ModalBookProgressSummaryWidget;
import 'package:flutter/material.dart';

class ModalBookProgressSummaryModel
    extends FlutterFlowModel<ModalBookProgressSummaryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for book_current_reading component.
  late BookCurrentReadingModel bookCurrentReadingModel;

  /// Query cache managers for this widget.

  final _bookChaptersManager = FutureRequestManager<List<ChaptersRow>>();
  Future<List<ChaptersRow>> bookChapters({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ChaptersRow>> Function() requestFn,
  }) =>
      _bookChaptersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookChaptersCache() => _bookChaptersManager.clear();
  void clearBookChaptersCacheKey(String? uniqueKey) =>
      _bookChaptersManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bookCurrentReadingModel =
        createModel(context, () => BookCurrentReadingModel());
  }

  @override
  void dispose() {
    bookCurrentReadingModel.dispose();

    /// Dispose query cache managers for this widget.

    clearBookChaptersCache();
  }
}
