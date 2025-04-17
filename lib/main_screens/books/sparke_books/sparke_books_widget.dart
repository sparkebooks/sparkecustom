import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_page/loading_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'sparke_books_model.dart';
export 'sparke_books_model.dart';

class SparkeBooksWidget extends StatefulWidget {
  const SparkeBooksWidget({
    super.key,
    required this.bookId,
    this.chapterId,
  });

  final int? bookId;
  final int? chapterId;

  static String routeName = 'sparkeBooks';
  static String routePath = 'sparkeBooks';

  @override
  State<SparkeBooksWidget> createState() => _SparkeBooksWidgetState();
}

class _SparkeBooksWidgetState extends State<SparkeBooksWidget> {
  late SparkeBooksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SparkeBooksModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userBook = FFAppState()
          .userBooksData
          .where((e) => e.bookId == widget.bookId)
          .toList()
          .firstOrNull;
      safeSetState(() {});
      if (_model.userBook != null) {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          BookDetailsWithoutScrollWidget.routeName,
          queryParameters: {
            'userbookData': serializeParam(
              FFAppState()
                  .userBooksData
                  .where((e) => e.bookId == widget.bookId)
                  .toList()
                  .firstOrNull,
              ParamType.DataStruct,
            ),
            'isFromSparkeBooks': serializeParam(
              true,
              ParamType.bool,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        _model.book = await BooksTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.bookId,
          ),
        );
        await action_blocks.createUserBook(
          context,
          bookID: _model.book?.firstOrNull,
          isModal: true,
          userbookData: _model.userBook,
          isFromSparkeBooks: true,
          chapterToNavigate: widget.chapterId,
        );
      }
    });

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 30.0),
                child: wrapWithModel(
                  model: _model.loadingPageModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoadingPageWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
