import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/new_components/empty_states/empty_state_library/empty_state_library_widget.dart';
import '/new_components/loading_states/loading_library/loading_library_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_library_model.dart';
export 'main_library_model.dart';

class MainLibraryWidget extends StatefulWidget {
  const MainLibraryWidget({super.key});

  static String routeName = 'main_library';
  static String routePath = 'mainLibrary';

  @override
  State<MainLibraryWidget> createState() => _MainLibraryWidgetState();
}

class _MainLibraryWidgetState extends State<MainLibraryWidget> {
  late MainLibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLibraryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Library',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'PT Serif',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Your recently read books below.',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Figtree',
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                  child: FutureBuilder<List<UserBooksRow>>(
                    future: UserBooksTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'firebase_user_id',
                            currentUserReference?.id,
                          )
                          .order('updated_at'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return LoadingLibraryWidget();
                      }
                      List<UserBooksRow> gridViewUserBooksRowList =
                          snapshot.data!;

                      if (gridViewUserBooksRowList.isEmpty) {
                        return Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 400.0,
                            child: EmptyStateLibraryWidget(
                              subtitle:
                                  'You don\'t have any books in your library, start reading now.',
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.sizeOf(context).width >=
                                  kBreakpointMedium
                              ? 4
                              : 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewUserBooksRowList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewUserBooksRow =
                              gridViewUserBooksRowList[gridViewIndex];
                          return wrapWithModel(
                            model: _model.bookCurrentReadingModels.getModel(
                              gridViewUserBooksRow.id.toString(),
                              gridViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: BookCurrentReadingWidget(
                              key: Key(
                                'Key28w_${gridViewUserBooksRow.id.toString()}',
                              ),
                              width: 400,
                              userbookData: FFAppState()
                                  .userBooksData
                                  .where((e) =>
                                      e.userbookId == gridViewUserBooksRow.id)
                                  .toList()
                                  .firstOrNull!,
                              navigateAction: () async {
                                context.pushNamed(
                                  BookDetailsWithoutScrollWidget.routeName,
                                  queryParameters: {
                                    'userbookData': serializeParam(
                                      FFAppState()
                                          .userBooksData
                                          .where((e) =>
                                              e.userbookId ==
                                              gridViewUserBooksRow.id)
                                          .toList()
                                          .firstOrNull,
                                      ParamType.DataStruct,
                                    ),
                                  }.withoutNulls,
                                );

                                FFAppState().updateUserBooksDataAtIndex(
                                  FFAppState()
                                      .userBooksData
                                      .where((e) =>
                                          e.userbookId ==
                                          gridViewUserBooksRow.id)
                                      .toList()
                                      .firstOrNull!
                                      .userbookId,
                                  (e) => e..updatedAt = getCurrentTimestamp,
                                );
                                safeSetState(() {});
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
