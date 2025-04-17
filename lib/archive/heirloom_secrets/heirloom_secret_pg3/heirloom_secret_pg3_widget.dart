import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_pg3_model.dart';
export 'heirloom_secret_pg3_model.dart';

class HeirloomSecretPg3Widget extends StatefulWidget {
  const HeirloomSecretPg3Widget({super.key});

  static String routeName = 'HeirloomSecretPg3';
  static String routePath = 'heirloomSecretPg3';

  @override
  State<HeirloomSecretPg3Widget> createState() =>
      _HeirloomSecretPg3WidgetState();
}

class _HeirloomSecretPg3WidgetState extends State<HeirloomSecretPg3Widget> {
  late HeirloomSecretPg3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretPg3Model());

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
              context.pushNamed(HeirloomSecretPg4Widget.routeName);
            },
            onLongPress: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                useSafeArea: true,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Kirsty\'s anger boiled over, her voice rising despite her efforts to stay calm. \"I am not a stranger! This house is part of my history, my legacy. You can\'t just dismiss me like this.\"\n\nBut the man remained unmoved, his expression hardening. \"Legacy or not, I\'ve got a life here, and I\'m not letting some city girl come in and disrupt it based on some dubious claim. Now, if you\'ll excuse me, I have things to do.\"\n\nWith that, he began to close the door, the finality of the gesture like a physical barrier to Kirsty\'s hopes and plans. She stood there, a mix of hurt, anger, and disbelief churning inside her, as the door shut firmly in her face. The confrontation, brief as it was, had laid bare the complexities and challenges she would face in reclaiming her past, and perhaps, understanding the father she thought she knew.\n\nFrustration boiling over, Kirsty pounded on the door again, her knocks echoing with a mix of anger and desperation. The door swung open, revealing Ryan\'s increasingly irate face.\n\n\"What do you want now?\" he snapped, his patience clearly at its end.\n\n\"Where the hell am I supposed to stay now?\" Kirsty retorted, her voice laced with anger, the inconvenience of her situation fueling her outrage.\n\nThe man\'s expression was unyielding, his annoyance palpable. \"That\'s not my problem. You show up here with your phony story and expect me to care? Find somewhere else to stay.\"\n\nKirsty opened her mouth to argue, but the man cut her off. \"I\'m telling you for the last time. Don\'t hang around here, and don\'t come back. This is my home, and I don\'t want any trouble from phonies like you.\"',
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
                            'Page 3 out of 330',
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
