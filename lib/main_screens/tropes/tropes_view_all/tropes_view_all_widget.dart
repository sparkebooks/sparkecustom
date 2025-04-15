import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/new_components/empty_states/empty_state_library/empty_state_library_widget.dart';
import '/new_components/loading_states/loading_list/loading_list_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'tropes_view_all_model.dart';
export 'tropes_view_all_model.dart';

class TropesViewAllWidget extends StatefulWidget {
  const TropesViewAllWidget({
    super.key,
    this.selectedTrope,
  });

  final String? selectedTrope;

  static String routeName = 'Tropes_View_all';
  static String routePath = 'tropesViewAll';

  @override
  State<TropesViewAllWidget> createState() => _TropesViewAllWidgetState();
}

class _TropesViewAllWidgetState extends State<TropesViewAllWidget> {
  late TropesViewAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TropesViewAllModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.selectedTrope,
              'All',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'PT Serif',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(44.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Sort By',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(
                        _model.dropDownValue ??= 'Top',
                      ),
                      options: ['Top', 'A-Z', 'Most Recent'],
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: 100.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Figtree',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Top',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.PaginatedTropeList(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            selectedTrope: widget.selectedTrope!,
                            pageSize: 10,
                            sortBy: _model.dropDownValue!,
                            bookItemBuilder: (BooksRow book, int index) =>
                                BookListLargeWidget(
                              bookType: BookPreviewType.JustOut,
                              bookRef: book,
                              index: index,
                            ),
                            emptyListWidget: () => EmptyStateLibraryWidget(
                              subtitle:
                                  'It seems there are no books that meet the search criteria.',
                            ),
                            loadingWidget: () => LoadingListWidget(),
                            errorWidget: () => EmptyStateLibraryWidget(
                              subtitle:
                                  'It seems there are no books that meet the search criteria.',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
