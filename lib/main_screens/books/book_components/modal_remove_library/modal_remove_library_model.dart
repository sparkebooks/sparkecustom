import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'modal_remove_library_widget.dart' show ModalRemoveLibraryWidget;
import 'package:flutter/material.dart';

class ModalRemoveLibraryModel
    extends FlutterFlowModel<ModalRemoveLibraryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for book_current_reading component.
  late BookCurrentReadingModel bookCurrentReadingModel;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<UserBooksRow>? removedBook;

  /// Query cache managers for this widget.

  final _bookUserBookRefManager = FutureRequestManager<List<BooksRow>>();
  Future<List<BooksRow>> bookUserBookRef({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BooksRow>> Function() requestFn,
  }) =>
      _bookUserBookRefManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookUserBookRefCache() => _bookUserBookRefManager.clear();
  void clearBookUserBookRefCacheKey(String? uniqueKey) =>
      _bookUserBookRefManager.clearRequest(uniqueKey);

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

    clearBookUserBookRefCache();

    clearBookChaptersCache();
  }
}
