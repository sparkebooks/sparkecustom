import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/modal_remove_library/modal_remove_library_widget.dart';
import '/new_components/loading_states/loading_book_single/loading_book_single_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'book_current_reading_model.dart';
export 'book_current_reading_model.dart';

/// This is a component for a book that you are currently reading.
class BookCurrentReadingWidget extends StatefulWidget {
  const BookCurrentReadingWidget({
    super.key,
    this.navigateAction,
    this.width,
    required this.userbookData,
  });

  final Future Function()? navigateAction;
  final int? width;
  final UserBooksDataStruct? userbookData;

  @override
  State<BookCurrentReadingWidget> createState() =>
      _BookCurrentReadingWidgetState();
}

class _BookCurrentReadingWidgetState extends State<BookCurrentReadingWidget> {
  late BookCurrentReadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookCurrentReadingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      await actions.getVariantCoverAndBlurb(
        FFAppState()
            .userBooksData
            .sortedList(keyOf: (e) => e.updatedAt!, desc: true)
            .firstOrNull!
            .bookId,
        currentUserUid,
        null,
        null,
      );
      _model.isLoading = false;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (!_model.isLoading) {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.navigateAction?.call();
            },
            onLongPress: () async {
              // get_user_book_id
              _model.getUserBookId = await UserBooksTable().queryRows(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  widget.userbookData?.userbookId,
                ),
              );
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: FlutterFlowTheme.of(context).accent4,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: ModalRemoveLibraryWidget(
                      userBookRef: _model.getUserBookId!.firstOrNull!,
                      userBookData: widget.userbookData!,
                      onChapterSelect: (selectedChapter) async {},
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              safeSetState(() {});

              safeSetState(() {});
            },
            child: Container(
              width: valueOrDefault<double>(
                widget.width?.toDouble(),
                150.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: FlutterFlowTheme.of(context).alternate,
                    offset: Offset(
                      -2.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Container(
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 800.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 100),
                                  fadeOutDuration: Duration(milliseconds: 100),
                                  imageUrl: valueOrDefault<String>(
                                    widget.userbookData?.bookImage,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/0c2kl70qgj7o/book_cover%402x.jpg',
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fitHeight,
                                  errorWidget: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpg',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2.0,
                                sigmaY: 2.0,
                              ),
                              child: Container(
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent4,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.userbookData?.bookProgress
                                                .toString(),
                                            '0',
                                          ).maybeHandleOverflow(
                                            maxChars: 3,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '%',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Figtree',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return wrapWithModel(
            model: _model.loadingBookSingleModel,
            updateCallback: () => safeSetState(() {}),
            child: LoadingBookSingleWidget(),
          );
        }
      },
    );
  }
}
