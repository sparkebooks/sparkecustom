import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/new_components/card_trope/card_trope_widget.dart';
import '/new_components/loading_states/loading_list/loading_list_widget.dart';
import '/new_components/loading_states/loading_tropes/loading_tropes_widget.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'main_tropes_model.dart';
export 'main_tropes_model.dart';

class MainTropesWidget extends StatefulWidget {
  const MainTropesWidget({super.key});

  static String routeName = 'main_tropes';
  static String routePath = 'mainTropes';

  @override
  State<MainTropesWidget> createState() => _MainTropesWidgetState();
}

class _MainTropesWidgetState extends State<MainTropesWidget> {
  late MainTropesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainTropesModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 6.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ModalAccountOptionsWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-f5j7u5/assets/sh6xt2aktoi2/fantasy_purple.png',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: AuthUserStreamWidget(
                builder: (context) => AutoSizeText(
                  'Welcome back, ${currentUserDisplayName}'.maybeHandleOverflow(
                    maxChars: 120,
                    replacement: '…',
                  ),
                  maxLines: 1,
                  minFontSize: 12.0,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'PT Serif',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: [],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(64.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.isSearchResultLoading = true;
                          safeSetState(() {});
                          _model.searchedBooks =
                              await actions.searchBooksInTropes(
                            _model.textController.text,
                            (currentUserDocument?.selectedTropes.toList() ??
                                    [])
                                .toList(),
                          );
                          _model.isSearchResultLoading = false;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search for books or tropes here...',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: (_model.textFieldFocusNode?.hasFocus ??
                                false)
                            ? FlutterFlowTheme.of(context).accent1
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  _model.isSearchResultLoading = true;
                                  safeSetState(() {});
                                  _model.searchedBooks =
                                      await actions.searchBooksInTropes(
                                    _model.textController.text,
                                    (currentUserDocument?.selectedTropes
                                                .toList() ??
                                            [])
                                        .toList(),
                                  );
                                  _model.isSearchResultLoading = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (_model.isSearchResultLoading) {
                            return wrapWithModel(
                              model: _model.loadingListModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LoadingListWidget(),
                            );
                          } else if ((_model.searchedBooks != null &&
                                  (_model.searchedBooks)!.isNotEmpty) &&
                              (_model.textController.text != '')) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Search results (${valueOrDefault<String>(
                                      _model.searchedBooks?.length.toString(),
                                      '0',
                                    )})',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final searchResults =
                                          _model.searchedBooks!.toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchResults.length,
                                        itemBuilder:
                                            (context, searchResultsIndex) {
                                          final searchResultsItem =
                                              searchResults[searchResultsIndex];
                                          return Visibility(
                                            visible: valueOrDefault<bool>(
                                              (searchResultsItem.impressions >=
                                                          1000) &&
                                                      (searchResultsItem
                                                              .createdByType ==
                                                          'Author')
                                                  ? false
                                                  : true,
                                              true,
                                            ),
                                            child: Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(),
                                              child: custom_widgets
                                                  .VisibilityDetectorWidget(
                                                width: double.infinity,
                                                height: 170.0,
                                                bookRef: searchResultsItem,
                                                child: () =>
                                                    BookListLargeWidget(
                                                  bookType:
                                                      BookPreviewType.JustOut,
                                                  bookRef: searchResultsItem,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (!(_model.searchedBooks != null &&
                                            (_model.searchedBooks)!
                                                .isNotEmpty) &&
                                        (_model.textController.text != ''))
                                      Container(
                                        width: 484.0,
                                        height: 22.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'Searching....',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    Text(
                                      'Browse all Tropes',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Figtree',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: FutureBuilder<List<TropesRow>>(
                                        future: FFAppState().tropes(
                                          requestFn: () =>
                                              TropesTable().queryRows(
                                            queryFn: (q) => q.order('name',
                                                ascending: true),
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return LoadingTropesWidget();
                                          }
                                          List<TropesRow>
                                              gridViewTropesRowList =
                                              snapshot.data!;

                                          return GridView.builder(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              16.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  MediaQuery.sizeOf(context)
                                                              .width >=
                                                          kBreakpointMedium
                                                      ? 3
                                                      : 2,
                                              crossAxisSpacing: 12.0,
                                              mainAxisSpacing: 12.0,
                                              childAspectRatio: 2.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                gridViewTropesRowList.length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewTropesRow =
                                                  gridViewTropesRowList[
                                                      gridViewIndex];
                                              return wrapWithModel(
                                                model: _model.cardTropeModels
                                                    .getModel(
                                                  gridViewTropesRow.id
                                                      .toString(),
                                                  gridViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: CardTropeWidget(
                                                  key: Key(
                                                    'Keym26_${gridViewTropesRow.id.toString()}',
                                                  ),
                                                  image: valueOrDefault<String>(
                                                    gridViewTropesRow
                                                        .coverImage,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-f5j7u5/assets/sh6xt2aktoi2/fantasy_purple.png',
                                                  ),
                                                  name: gridViewTropesRow.name!,
                                                  action: () async {
                                                    context.pushNamed(
                                                      TropesViewAllWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'selectedTrope':
                                                            serializeParam(
                                                          gridViewTropesRow
                                                              .name,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ].addToEnd(SizedBox(height: 24.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
