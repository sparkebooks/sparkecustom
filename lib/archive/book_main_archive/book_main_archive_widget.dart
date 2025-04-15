import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/modal_book_details/modal_book_details_widget.dart';
import '/new_components/modal_font_style_update/modal_font_style_update_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'book_main_archive_model.dart';
export 'book_main_archive_model.dart';

class BookMainArchiveWidget extends StatefulWidget {
  const BookMainArchiveWidget({
    super.key,
    int? pageNumber,
    double? percentageComplete,
    int? totalPages,
    this.bookRef,
    this.readingMode,
  })  : this.pageNumber = pageNumber ?? 1,
        this.percentageComplete = percentageComplete ?? 12.0,
        this.totalPages = totalPages ?? 300;

  final int pageNumber;
  final double percentageComplete;
  final int totalPages;
  final BooksRow? bookRef;
  final bool? readingMode;

  static String routeName = 'book_main_archive';
  static String routePath = 'bookMainArchive';

  @override
  State<BookMainArchiveWidget> createState() => _BookMainArchiveWidgetState();
}

class _BookMainArchiveWidgetState extends State<BookMainArchiveWidget> {
  late BookMainArchiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookMainArchiveModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readingMode = widget.readingMode!;
      safeSetState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: _model.readingMode == false
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    widget.bookRef?.title,
                    'Book Title',
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.kalignLeft,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 28.0,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).accent4,
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
                                child: ModalBookDetailsWidget(
                                  bookRef: widget.bookRef,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      FFIcons.ktype02,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: FlutterFlowTheme.of(context).accent4,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ModalFontStyleUpdateWidget(
                                onApplyChanges: () async {},
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.readingMode = !_model.readingMode;
                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            if (FFAppState().selectedTypographyFamily ==
                                SelectedTypography.PTSerif) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        _model.chapterTitle,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'PT Serif',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: AnimatedDefaultTextStyle(
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'PT Serif',
                                              fontSize:
                                                  FFAppState().defaultTextSize,
                                              letterSpacing: 0.0,
                                            ),
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeIn,
                                        child: Text(
                                          _model.pageContent,
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToStart(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ),
                              );
                            } else if (FFAppState().selectedTypographyFamily ==
                                SelectedTypography.OpenSans) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        _model.chapterTitle,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: AnimatedDefaultTextStyle(
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize:
                                                  FFAppState().defaultTextSize,
                                              letterSpacing: 0.0,
                                            ),
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeIn,
                                        child: Text(
                                          _model.pageContent,
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToStart(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ),
                              );
                            } else {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        _model.chapterTitle,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: AnimatedDefaultTextStyle(
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              fontSize:
                                                  FFAppState().defaultTextSize,
                                              letterSpacing: 0.0,
                                            ),
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeIn,
                                        child: Text(
                                          _model.pageContent,
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToStart(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ),
                              );
                            }
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                BookMainArchiveWidget.routeName,
                                queryParameters: {
                                  'pageNumber': serializeParam(
                                    (widget.pageNumber - 1),
                                    ParamType.int,
                                  ),
                                  'percentageComplete': serializeParam(
                                    functions.getProgressBarValue(
                                        valueOrDefault<int>(
                                          widget.totalPages,
                                          326,
                                        ),
                                        (widget.pageNumber - 1)),
                                    ParamType.double,
                                  ),
                                  'totalPages': serializeParam(
                                    widget.totalPages,
                                    ParamType.int,
                                  ),
                                  'bookRef': serializeParam(
                                    widget.bookRef,
                                    ParamType.SupabaseRow,
                                  ),
                                  'readingMode': serializeParam(
                                    _model.readingMode,
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
                            },
                            child: Container(
                              width: 100.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                BookMainArchiveWidget.routeName,
                                queryParameters: {
                                  'pageNumber': serializeParam(
                                    (widget.pageNumber + 1),
                                    ParamType.int,
                                  ),
                                  'percentageComplete': serializeParam(
                                    functions.getProgressBarValue(
                                        valueOrDefault<int>(
                                          widget.totalPages,
                                          326,
                                        ),
                                        (widget.pageNumber + 1)),
                                    ParamType.double,
                                  ),
                                  'totalPages': serializeParam(
                                    widget.totalPages,
                                    ParamType.int,
                                  ),
                                  'bookRef': serializeParam(
                                    widget.bookRef,
                                    ParamType.SupabaseRow,
                                  ),
                                  'readingMode': serializeParam(
                                    _model.readingMode,
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
                            },
                            child: Container(
                              width: 100.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pg ${valueOrDefault<String>(
                        widget.pageNumber.toString(),
                        '0',
                      )} out of ${valueOrDefault<String>(
                        widget.totalPages.toString(),
                        '321',
                      )}',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Text(
                        '${valueOrDefault<String>(
                          formatNumber(
                            widget.percentageComplete,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          '0',
                        )}%',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Figtree',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
