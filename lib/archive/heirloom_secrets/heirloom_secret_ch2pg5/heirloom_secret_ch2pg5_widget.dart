import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch2pg5_model.dart';
export 'heirloom_secret_ch2pg5_model.dart';

class HeirloomSecretCh2pg5Widget extends StatefulWidget {
  const HeirloomSecretCh2pg5Widget({super.key});

  static String routeName = 'HeirloomSecretCh2pg5';
  static String routePath = 'heirloomSecretCh2pg5';

  @override
  State<HeirloomSecretCh2pg5Widget> createState() =>
      _HeirloomSecretCh2pg5WidgetState();
}

class _HeirloomSecretCh2pg5WidgetState
    extends State<HeirloomSecretCh2pg5Widget> {
  late HeirloomSecretCh2pg5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh2pg5Model());

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
              context.pushNamed(HeirloomSecretCh2pg6Widget.routeName);
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
                      'Chapter 2',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'PT Serif',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Kirsty stood there for a moment longer, the echo of the truck\'s engine fading into the distance. She glanced back at the house, a place that now felt more like a fortress than a home. Shaking off her shock, she knew she had to find somewhere to stay, and fast. With a deep breath, she hoisted her suitcase and began walking down the driveway.\n\nThe town was small, and Kirsty remembered there was only one inn, a quaint place run by a couple who had been friends with her parents. As she trudged along, the weight of her suitcase seemed to grow with each step, mirroring the heaviness in her heart.\n\nFinally, she reached the inn, its familiar facade offering a glimmer of hope. The sign, \"Willow Inn,\" swayed gently in the breeze, as if welcoming her. Kirsty pushed open the door, the bell above it chiming softly.\n\nInside, the inn was cozy and inviting, with the comforting smell of fresh bread wafting from the kitchen. Behind the front desk stood an older couple, their faces lighting up with recognition as they saw her.\n\n\"Kirsty? Kirsty Thomas, is that really you?\" the woman exclaimed, her eyes sparkling with warmth.\n\nKirsty managed a small, weary smile. \"Yes, it\'s me, Mrs. Harper. I\'m sorry to show up unannounced like this.\"\n\nMr. Harper stepped forward, his expression a mix of surprise and concern. \"What brings you back here, dear? We heard about Jonathan\'s passing, but we never expected to see you.\"\n\n\"I\'ve come to stay at my father\'s house, or so I thought,\" Kirsty replied, her voice tinged with fatigue. \"There\'s been... a complication.\"',
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
                            'Pg 5 out of 330',
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
      ),
    );
  }
}
