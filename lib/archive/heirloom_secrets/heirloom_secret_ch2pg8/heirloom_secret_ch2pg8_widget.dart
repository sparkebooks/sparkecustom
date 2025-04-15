import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch2pg8_model.dart';
export 'heirloom_secret_ch2pg8_model.dart';

class HeirloomSecretCh2pg8Widget extends StatefulWidget {
  const HeirloomSecretCh2pg8Widget({super.key});

  static String routeName = 'HeirloomSecretCh2pg8';
  static String routePath = 'heirloomSecretCh2pg8';

  @override
  State<HeirloomSecretCh2pg8Widget> createState() =>
      _HeirloomSecretCh2pg8WidgetState();
}

class _HeirloomSecretCh2pg8WidgetState
    extends State<HeirloomSecretCh2pg8Widget> {
  late HeirloomSecretCh2pg8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh2pg8Model());

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
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(HeirloomSecretCh2pg9Widget.routeName);
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 414.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: 406.0,
                      height: 27.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Heirloom Secret \nChapter 2',
                          textAlign: TextAlign.center,
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
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Kirsty nodded, her mind racing with questions. \"Did you know anything about him leaving the house to someone else? There was someone there when I turned up yesterday.\"\n\nMr. Harper frowned, setting down the coffee pot. \"Ryan Hallwell? Yes, I know him. Runs the local grocery store. Decent fellow, but I had no idea about any will. Your father never mentioned anything like that to us.\"\n\nMr. Harper paused, a thoughtful look crossing his face. \"Come to think of it, Ryan did help out your father quite a bit towards the end. He was over at the house often, doing odd jobs, groceries, that sort of thing. Your father wasn\'t in the best of health, you see.\"\n\nKirsty\'s fork paused midway to her mouth. This new information stirred a complex mix of emotions within her. There was a twinge of guilt for not having been there herself, coupled with an irrational flare of frustration. It felt as though this stranger, Ryan, had somehow been imposing himself into her family\'s life. She recognized the childishness of the sentiment — after all, she hadn\'t made any efforts herself — but the wound of abandonment seemed to reopen nonetheless.\n\nShe set her fork down, her appetite waning. \"I didn\'t know that,\" she said quietly.\n\nMr. Harper nodded, a sympathetic expression on his face. \"Yes, Ryan was a regular presence around your father\'s place. Seemed to genuinely care about him.\"\n\nKirsty\'s emotions were a tangled mix of gratitude and resentment. It was heartening to know someone had been there for her father, but it also intensified her feelings of guilt and disconnect. She sighed, a sense of resolve settling over her. \"I need to talk to Ryan again, but he didn\'t exactly give me a warm welcome. He didn\'t believe who I was.\"',
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
                            'Page 8 out of 330',
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
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              '2%',
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
      ),
    );
  }
}
