import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_screens/books/book_components/card_comment/card_comment_widget.dart';
import '/new_components/empty_states/empty_state_simple/empty_state_simple_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'book_comments_model.dart';
export 'book_comments_model.dart';

class BookCommentsWidget extends StatefulWidget {
  const BookCommentsWidget({
    super.key,
    this.bookRef,
  });

  final BooksRow? bookRef;

  static String routeName = 'book_comments';
  static String routePath = 'bookComments';

  @override
  State<BookCommentsWidget> createState() => _BookCommentsWidgetState();
}

class _BookCommentsWidgetState extends State<BookCommentsWidget> {
  late BookCommentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookCommentsModel());

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 25.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          valueOrDefault<String>(
            widget.bookRef?.title,
            ' Book Title',
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'PT Serif',
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
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
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (_model.textFieldFocusNode?.hasFocus ?? false)
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.comment = _model.textController.text;
                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.send,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Leave a review...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                              alignLabelWithHint: true,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                              errorStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 8,
                            minLines: 3,
                            keyboardType: TextInputType.multiline,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  onPressed: (_model.textController.text
                                          .trim()
                                          .isEmpty)
                                      ? null
                                      : () async {
                                          HapticFeedback.mediumImpact();
                                          // validate_comment_exists
                                          _model.isvalid = true;
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            safeSetState(
                                                () => _model.isvalid = false);
                                            return;
                                          }
                                          _model.badWordCheck =
                                              await actions.badWordCheckAction(
                                            _model.textController.text,
                                            BadWords.values
                                                .map((e) => e.name)
                                                .toList(),
                                          );
                                          if (_model.badWordCheck!) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please input another comment',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                          } else {
                                            // create_comment
                                            _model.newComment =
                                                await UserCommentsTable()
                                                    .insert({
                                              'book_id': widget.bookRef?.id,
                                              'firebase_user_id':
                                                  currentUserReference?.id,
                                              'comment':
                                                  _model.textController.text,
                                              'verified': false,
                                              'status':
                                                  CommentStatus.Pending.name,
                                            });
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                            _model.bookCreated = true;
                                            safeSetState(() {});
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You have left a comment!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                  text: 'Submit',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: (_model.textFieldFocusNode?.hasFocus ?? false)
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<UserCommentsRow>>(
                future: UserCommentsTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'book_id',
                        widget.bookRef?.id,
                      )
                      .eqOrNull(
                        'status',
                        CommentStatus.Approved.name,
                      ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UserCommentsRow> commentsQueryUserCommentsRowList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 8.0),
                          child: Text(
                            'Comments (${valueOrDefault<String>(
                              formatNumber(
                                commentsQueryUserCommentsRowList.length,
                                formatType: FormatType.compact,
                              ),
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
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final containerVar =
                                  commentsQueryUserCommentsRowList.toList();
                              if (containerVar.isEmpty) {
                                return Center(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 300.0,
                                    child: EmptyStateSimpleWidget(
                                      title: 'No Comments',
                                      subTitle:
                                          'You can be the first one to leave a comment on this book!',
                                      icon: Icon(
                                        FFIcons.kmessageChatCircle,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 72.0,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  4.0,
                                  0,
                                  32.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: containerVar.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return Visibility(
                                    visible: (containerVarItem.firebaseUserId ==
                                            currentUserUid) ||
                                        (containerVarItem.status ==
                                            CommentStatus.Approved.name),
                                    child: wrapWithModel(
                                      model: _model.cardCommentModels.getModel(
                                        containerVarItem.id.toString(),
                                        containerVarIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: CardCommentWidget(
                                        key: Key(
                                          'Keyi6w_${containerVarItem.id.toString()}',
                                        ),
                                        commentRef: containerVarItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
