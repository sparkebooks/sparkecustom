import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:flutter/material.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  Local state fields for this page.

  List<String> selectedTropes = [];
  void addToSelectedTropes(String item) => selectedTropes.add(item);
  void removeFromSelectedTropes(String item) => selectedTropes.remove(item);
  void removeAtIndexFromSelectedTropes(int index) =>
      selectedTropes.removeAt(index);
  void insertAtIndexInSelectedTropes(int index, String item) =>
      selectedTropes.insert(index, item);
  void updateSelectedTropesAtIndex(int index, Function(String) updateFn) =>
      selectedTropes[index] = updateFn(selectedTropes[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Display Name is required';
    }

    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'Display name cannot contain only spaces';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    cityTextControllerValidator = _cityTextControllerValidator;
  }

  @override
  void dispose() {
    cityFocusNode?.dispose();
    cityTextController?.dispose();
  }
}
