import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch3pg14_model.dart';
export 'heirloom_secret_ch3pg14_model.dart';

class HeirloomSecretCh3pg14Widget extends StatefulWidget {
  const HeirloomSecretCh3pg14Widget({super.key});

  static String routeName = 'HeirloomSecretCh3pg14';
  static String routePath = 'heirloomSecretCh3pg14';

  @override
  State<HeirloomSecretCh3pg14Widget> createState() =>
      _HeirloomSecretCh3pg14WidgetState();
}

class _HeirloomSecretCh3pg14WidgetState
    extends State<HeirloomSecretCh3pg14Widget> {
  late HeirloomSecretCh3pg14Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh3pg14Model());

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
              context.pushNamed(HeirloomSecretCh3pg15Widget.routeName);
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
                          'Heirloom Secret \nChapter 3',
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
                      '\"Complicated or not, you weren\'t here,\" Ryan shot back. \"I was. I knew your father in ways you probably never did. And now you just show up and claim this house because of some will?\"\n\nThe intensity of the conversation escalated, and Kirsty felt the walls she had built around her emotions beginning to crumble. She struggled to maintain composure, to not let Ryan see how deeply his words affected her.\n\n\"Look, I understand that you have a connection to this house, to my father. But so do I. This isn\'t just about legal rights. It\'s about coming to terms with my past,\" Kirsty explained, her voice laced with emotion.\n\nRyan\'s expression softened slightly, but the skepticism remained. \"Your past? You left all that behind. What makes you think you can just walk back into it now?\"\nKirsty took a step back, the weight of the situation settling heavily on her. She realized this wasn\'t going to be resolved with a simple conversation. \"I don\'t have all the answers, Ryan. But I need to try. This house, my father\'s legacy... it\'s a part of me.\"\n\nRyan looked at her skeptically. \"A part of you? You haven\'t been here in years. You didn\'t see how your father lived, how he changed. This house is a part of me now, too.\"\n\nAs Kirsty began to mention her will again, Ryan interrupted her, pulling out a folded piece of paper from his pocket. \"Your will isn\'t the whole story,\" he said, handing it to her. \"Jonathan left the house to me in his actual will.\"\n\nTaking the document, Kirsty\'s eyes widened in disbelief. The date was indeed more recent than hers, but by over a year. The reality of two wills, so fundamentally different, made her head spin.\n\n\"This doesn\'t make any sense,\" she muttered, scanning the document immediately with her phone. \"Why would my father do this?\"',
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
                            'Page 14 out of 330',
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
                              '5%',
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
