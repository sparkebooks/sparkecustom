import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/card_comment/card_comment_widget.dart';
import 'book_comments_widget.dart' show BookCommentsWidget;
import 'package:flutter/material.dart';

class BookCommentsModel extends FlutterFlowModel<BookCommentsWidget> {
  ///  Local state fields for this page.

  bool bookCreated = false;

  String? comment;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isvalid;
  // Stores action output result for [Custom Action - badWordCheckAction] action in Button widget.
  bool? badWordCheck;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UserCommentsRow? newComment;
  // Models for card_comment dynamic component.
  late FlutterFlowDynamicModels<CardCommentModel> cardCommentModels;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    cardCommentModels = FlutterFlowDynamicModels(() => CardCommentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardCommentModels.dispose();
  }
}
