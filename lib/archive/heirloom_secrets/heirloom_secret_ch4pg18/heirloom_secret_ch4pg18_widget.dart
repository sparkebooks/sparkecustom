import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch4pg18_model.dart';
export 'heirloom_secret_ch4pg18_model.dart';

class HeirloomSecretCh4pg18Widget extends StatefulWidget {
  const HeirloomSecretCh4pg18Widget({super.key});

  static String routeName = 'HeirloomSecretCh4pg18';
  static String routePath = 'heirloomSecretCh4pg18';

  @override
  State<HeirloomSecretCh4pg18Widget> createState() =>
      _HeirloomSecretCh4pg18WidgetState();
}

class _HeirloomSecretCh4pg18WidgetState
    extends State<HeirloomSecretCh4pg18Widget> {
  late HeirloomSecretCh4pg18Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh4pg18Model());

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
              context.pushNamed(HeirloomSecretCh4pg19Widget.routeName);
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
                          'Heirloom Secret \nChapter 4',
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
                      'Kirsty\'s frustration mounted. \"It is my business, Ryan. This house, my father\'s legacy, I can\'t just walk away from it. I need to understand.\"\n\nRyan\'s eyes narrowed. \"You want to understand? Maybe you should have tried understanding when he was still alive. I was there for him when he needed someone. Where were you?\"\n\nThe accusation stung, reopening old wounds. \"You think I don\'t regret that? But I can\'t change the past. I\'m here now, trying to make sense of all this.\"\n\nRyan scoffed, \"Making sense of it? Seems like you\'re just trying to stake your claim.\"\nKirsty\'s temper flared. \"And what about you? You claim to have been close to my father, yet here we are, fighting over his house. Did you ever consider that he might have wanted me to have it?\"\n\nTheir voices had risen, attracting the attention of a few passersby. Ryan took a deep breath, his demeanor softening slightly. \"This isn\'t just about the house, Kirsty. It\'s about honoring a man\'s wishes. Your father changed over the years. The man you remember might not be the man he became.\"\n\nKirsty paused, her anger subsiding into a pensive silence. Ryan\'s words echoed in her mind, a reminder of the many facets of her father\'s life that she had missed. \n\nRyan clicked his tongue at her. “Look, I’m working right now. We can talk about this later.”\n\nWith a heavy heart, Kirsty turned and walked away, knowing that the path to resolution would require delving deeper into the past and confronting the painful realities of the present.\n\nLater that afternoon, Kirsty decided to take a walk through the town park, hoping the fresh air and greenery would help clear her mind. ',
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
                            'Page 18 out of 330',
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
