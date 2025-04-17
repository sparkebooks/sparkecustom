import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/index.dart';
import 'main_library_widget.dart' show MainLibraryWidget;
import 'package:flutter/material.dart';

class MainLibraryModel extends FlutterFlowModel<MainLibraryWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for book_current_reading dynamic component.
  late FlutterFlowDynamicModels<BookCurrentReadingModel>
      bookCurrentReadingModels;

  @override
  void initState(BuildContext context) {
    bookCurrentReadingModels =
        FlutterFlowDynamicModels(() => BookCurrentReadingModel());
  }

  @override
  void dispose() {
    bookCurrentReadingModels.dispose();
  }
}
