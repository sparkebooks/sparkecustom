import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch2pg9_model.dart';
export 'heirloom_secret_ch2pg9_model.dart';

class HeirloomSecretCh2pg9Widget extends StatefulWidget {
  const HeirloomSecretCh2pg9Widget({super.key});

  static String routeName = 'HeirloomSecretCh2pg9';
  static String routePath = 'heirloomSecretCh2pg9';

  @override
  State<HeirloomSecretCh2pg9Widget> createState() =>
      _HeirloomSecretCh2pg9WidgetState();
}

class _HeirloomSecretCh2pg9WidgetState
    extends State<HeirloomSecretCh2pg9Widget> {
  late HeirloomSecretCh2pg9Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh2pg9Model());

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
              context.pushNamed(HeirloomSecretCh3pg10Widget.routeName);
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
                      'Mrs. Harper\'s eyes brightened with an idea. \"Well, why don\'t I give him a call? I can vouch for you, Kirsty. Everyone in town knows us, and they know we wouldn\'t vouch for someone who wasn\'t who they say they are.\"\n\nKirsty felt a flicker of hope. \"Would you do that? I just want a chance to talk to him, explain my side without him seeing me as an intruder.\"\n\n\"Of course, dear,\" Mrs. Harper replied, standing up to fetch the phone. \"Let\'s clear up this misunderstanding first. Then you can try talking to him again.\"\n\nKirsty watched as Mrs. Harper dialed the number, her heart beating a little faster. She knew this was just the first step in a potentially long journey, but it was a start.\n\n As she listened to Mrs. Harper speaking kindly but firmly on the phone, advocating for her, Kirsty realized how much this small-town community still meant to her. They were rallying behind her, a gesture that warmed her heart amidst the chaos of her return.',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'PT Serif',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 313.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            'Page 9 out of 330',
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
                              '3%',
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
