import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_main_widget.dart' show AuthMainWidget;
import 'package:flutter/material.dart';

class AuthMainModel extends FlutterFlowModel<AuthMainWidget> {
  ///  Local state fields for this page.

  String? email;

  String? password;

  int loopCount = 0;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  String? _emailAddressCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email address';
    }
    return null;
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  String? _passwordCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 6) {
      return 'Minimum 6 characters required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - upgradeAnonymousUser] action in Button widget.
  UsersRecord? updatedUser;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid email address';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 6) {
      return 'Minimum 6 character required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressCreateTextControllerValidator =
        _emailAddressCreateTextControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateTextControllerValidator =
        _passwordCreateTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks.
  Future assignRecentBooks(BuildContext context) async {
    List<UserBooksRow>? myUserBooksCopy;
    List<BooksRow>? bookCopy;

    // get_user_books
    myUserBooksCopy = await UserBooksTable().queryRows(
      queryFn: (q) => q
          .eqOrNull(
            'firebase_user_id',
            currentUserReference?.id,
          )
          .order('updated_at'),
    );
    FFAppState().userBooksData = [];
    while (loopCount <
        valueOrDefault<int>(
          myUserBooksCopy.length,
          0,
        )) {
      bookCopy = await BooksTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          myUserBooksCopy?.elementAtOrNull(loopCount)?.bookId,
        ),
      );
      FFAppState().addToUserBooksData(UserBooksDataStruct(
        userbookId: myUserBooksCopy.elementAtOrNull(loopCount)?.id,
        userbookPageNumber:
            myUserBooksCopy.elementAtOrNull(loopCount)?.pageNumber,
        indexInLocal: loopCount,
        bookTotalPages: bookCopy.firstOrNull?.totalPages,
        readingMode: true,
        chaptersUnlocked:
            myUserBooksCopy.elementAtOrNull(loopCount)?.chaptersUnlocked,
        bookName: bookCopy.firstOrNull?.title,
        bookImage: bookCopy.firstOrNull?.coverImage,
        bookId: bookCopy.firstOrNull?.id,
        updatedAt: myUserBooksCopy.elementAtOrNull(loopCount)?.updatedAt,
        nextChapterFirst: false,
        bookProgress: myUserBooksCopy.elementAtOrNull(loopCount)?.bookProgress,
        currentChapter:
            myUserBooksCopy.elementAtOrNull(loopCount)?.chapterIndex,
        isPaymentRequired: false,
      ));
      loopCount = loopCount + 1;
    }
  }
}
