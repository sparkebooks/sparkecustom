import 'package:flutter/material.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_book_page_widget.dart' show SearchBookPageWidget;

class SearchBookPageModel extends FlutterFlowModel<SearchBookPageWidget> {
  ///  Local state fields for this page.

  List<BooksRow> filteredBooks = [];
  void addToFilteredBooks(BooksRow item) => filteredBooks.add(item);
  void removeFromFilteredBooks(BooksRow item) => filteredBooks.remove(item);
  void removeAtIndexFromFilteredBooks(int index) =>
      filteredBooks.removeAt(index);
  void insertAtIndexInFilteredBooks(int index, BooksRow item) =>
      filteredBooks.insert(index, item);
  void updateFilteredBooksAtIndex(int index, Function(BooksRow) updateFn) =>
      filteredBooks[index] = updateFn(filteredBooks[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
