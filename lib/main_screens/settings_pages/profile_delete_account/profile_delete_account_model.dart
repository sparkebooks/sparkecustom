import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_delete_account_widget.dart' show ProfileDeleteAccountWidget;
import 'package:flutter/material.dart';

class ProfileDeleteAccountModel
    extends FlutterFlowModel<ProfileDeleteAccountWidget> {
  ///  Local state fields for this page.

  bool showConfirm = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Buildship Delete User)] action in Button widget.
  ApiCallResponse? userDeleted;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
