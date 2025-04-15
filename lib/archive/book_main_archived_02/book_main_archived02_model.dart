import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'book_main_archived02_widget.dart' show BookMainArchived02Widget;
import 'package:flutter/material.dart';

class BookMainArchived02Model
    extends FlutterFlowModel<BookMainArchived02Widget> {
  ///  Local state fields for this page.

  bool readingMode = false;

  int? pageNumber;

  int? totalPages;

  int? currentChapter = 0;

  int? currentChapterIndex;

  bool pagePurchased = false;

  int chaptersUnlocked = 0;

  List<int> chapterPages = [];
  void addToChapterPages(int item) => chapterPages.add(item);
  void removeFromChapterPages(int item) => chapterPages.remove(item);
  void removeAtIndexFromChapterPages(int index) => chapterPages.removeAt(index);
  void insertAtIndexInChapterPages(int index, int item) =>
      chapterPages.insert(index, item);
  void updateChapterPagesAtIndex(int index, Function(int) updateFn) =>
      chapterPages[index] = updateFn(chapterPages[index]);

  String? chapterText;

  String? chapterTitle;

  GetMetaDataStruct? getMetaData;
  void updateGetMetaDataStruct(Function(GetMetaDataStruct) updateFn) {
    updateFn(getMetaData ??= GetMetaDataStruct());
  }

  int? totalPagesss;

  bool chapterChanged = false;

  dynamic chapterDate;

  bool nextPageFirst = false;

  int? nextChapterID;

  List<dynamic> paginatedChapters = [];
  void addToPaginatedChapters(dynamic item) => paginatedChapters.add(item);
  void removeFromPaginatedChapters(dynamic item) =>
      paginatedChapters.remove(item);
  void removeAtIndexFromPaginatedChapters(int index) =>
      paginatedChapters.removeAt(index);
  void insertAtIndexInPaginatedChapters(int index, dynamic item) =>
      paginatedChapters.insert(index, item);
  void updatePaginatedChaptersAtIndex(int index, Function(dynamic) updateFn) =>
      paginatedChapters[index] = updateFn(paginatedChapters[index]);

  BooksRow? bookRef;

  UserBooksRow? userbookRef;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in book_main_archived_02 widget.
  List<BooksRow>? bookref;
  // Stores action output result for [Backend Call - Query Rows] action in book_main_archived_02 widget.
  List<UserBooksRow>? userbookref;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
