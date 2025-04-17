import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/new_components/selection_age/selection_age_widget.dart';
import '/index.dart';
import 'onboarding_user_widget.dart' show OnboardingUserWidget;
import 'package:flutter/material.dart';

class OnboardingUserModel extends FlutterFlowModel<OnboardingUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Models for selection_age dynamic component.
  late FlutterFlowDynamicModels<SelectionAgeModel> selectionAgeModels;

  @override
  void initState(BuildContext context) {
    selectionAgeModels = FlutterFlowDynamicModels(() => SelectionAgeModel());
  }

  @override
  void dispose() {
    selectionAgeModels.dispose();
  }
}
