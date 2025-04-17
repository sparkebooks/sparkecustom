import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_pg2_model.dart';
export 'heirloom_secret_pg2_model.dart';

class HeirloomSecretPg2Widget extends StatefulWidget {
  const HeirloomSecretPg2Widget({super.key});

  static String routeName = 'HeirloomSecretPg2';
  static String routePath = 'heirloomSecretPg2';

  @override
  State<HeirloomSecretPg2Widget> createState() =>
      _HeirloomSecretPg2WidgetState();
}

class _HeirloomSecretPg2WidgetState extends State<HeirloomSecretPg2Widget> {
  late HeirloomSecretPg2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretPg2Model());

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
          backgroundColor: Colors.white,
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
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.type_specimen_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(HeirloomSecretPg3Widget.routeName);
            },
            onLongPress: () async {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 406.0,
                  height: 27.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Heirloom Secret \nChapter 1',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Figtree',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 11.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    ' \"I... I\'m Kirsty Thomas. I think there\'s been a mistake. This house was left to me by my father.\"\n\nThe man\'s expression didn\'t soften. Instead, his eyes narrowed, a clear sign of distrust. \"I don\'t know any Kirsty Thomas. And as far as I\'m concerned, this is my house. You got any proof to back up your claim?\"\n\nHer plans, her dreams for the summer, they all seemed to hang precariously in the balance. Kirsty fumbled in her purse for her documents, her hands shaking slightly. This was not the homecoming she had imagined – it was a confrontation, one that threatened the very foundation of her long-held expectations.\n\nThe man handed back the documents with a dismissive flick of his wrist. \"These don\'t prove anything. Who\'s your father supposed to be anyway?\"\n\nKirsty\'s patience, already thin, began to fray. \"Jonathan Thomas. He was my father, and he left this house to me in his will.\"\n\nThe man scoffed, an edge of cynicism in his tone. \"Jonathan Thomas, huh? That\'s a new one. I\'ve been living here for years, and I\'ve never heard of you. For all I know, you could be just another phony trying to stake a claim.\"\n\nThe word \'phony\' struck a nerve in Kirsty, igniting a spark of anger. \"Phony? I grew up in this house! My entire childhood was within these walls. How dare you accuse me of lying!\"\n\nHe crossed his arms, leaning against the doorframe with a look of defiance. \"Well, you can take your accusations and',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'PT Serif',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Container(
                  width: 444.0,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pg 2 out of 330',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Figtree',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 11.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            '1%',
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)).around(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
