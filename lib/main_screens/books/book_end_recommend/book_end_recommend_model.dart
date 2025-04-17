import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/main_screens/books/book_components/card_comment/card_comment_widget.dart';
import '/index.dart';
import 'book_end_recommend_widget.dart' show BookEndRecommendWidget;
import 'package:flutter/material.dart';

class BookEndRecommendModel extends FlutterFlowModel<BookEndRecommendWidget> {
  ///  Local state fields for this page.

  bool newComment = false;

  double? yourRating;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for book_current_reading component.
  late BookCurrentReadingModel bookCurrentReadingModel;
  // Model for card_comment component.
  late CardCommentModel cardCommentModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in RatingBar widget.
  List<UserBooksRow>? updatedBook;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a comment...';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UserCommentsRow? newCommentEndBook;
  // Models for book_list_large dynamic component.
  late FlutterFlowDynamicModels<BookListLargeModel> bookListLargeModels;

  @override
  void initState(BuildContext context) {
    bookCurrentReadingModel =
        createModel(context, () => BookCurrentReadingModel());
    cardCommentModel = createModel(context, () => CardCommentModel());
    textControllerValidator = _textControllerValidator;
    bookListLargeModels = FlutterFlowDynamicModels(() => BookListLargeModel());
  }

  @override
  void dispose() {
    bookCurrentReadingModel.dispose();
    cardCommentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bookListLargeModels.dispose();
  }
}
