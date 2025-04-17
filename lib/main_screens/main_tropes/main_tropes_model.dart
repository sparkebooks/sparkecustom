import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/card_trope/card_trope_widget.dart';
import '/new_components/loading_states/loading_list/loading_list_widget.dart';
import '/index.dart';
import 'main_tropes_widget.dart' show MainTropesWidget;
import 'package:flutter/material.dart';

class MainTropesModel extends FlutterFlowModel<MainTropesWidget> {
  ///  Local state fields for this page.

  bool isSearchResultLoading = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchBooksInTropes] action in TextField widget.
  List<BooksRow>? searchedBooks;
  // Model for loading_list component.
  late LoadingListModel loadingListModel;
  // Models for card_trope dynamic component.
  late FlutterFlowDynamicModels<CardTropeModel> cardTropeModels;

  @override
  void initState(BuildContext context) {
    loadingListModel = createModel(context, () => LoadingListModel());
    cardTropeModels = FlutterFlowDynamicModels(() => CardTropeModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingListModel.dispose();
    cardTropeModels.dispose();
  }
}
