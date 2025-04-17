import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_pg1_model.dart';
export 'heirloom_secret_pg1_model.dart';

class HeirloomSecretPg1Widget extends StatefulWidget {
  const HeirloomSecretPg1Widget({super.key});

  static String routeName = 'HeirloomSecretPg1';
  static String routePath = 'heirloomSecretPg1';

  @override
  State<HeirloomSecretPg1Widget> createState() =>
      _HeirloomSecretPg1WidgetState();
}

class _HeirloomSecretPg1WidgetState extends State<HeirloomSecretPg1Widget> {
  late HeirloomSecretPg1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretPg1Model());

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
              context.pushNamed(HeirloomSecretPg1MenuShowingWidget.routeName);
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Chapter 1',
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
                      'Kirsty Thomas paused at the edge of the gravel driveway, her grip on her suitcase handle tightening as a wave of dismay washed over her. She had envisioned this moment for weeks, the summer ahead a canvas to reclaim and reconcile with her past, in the house she thought was hers alone. But the sight before her – curtains at the windows, a bicycle propped against the porch, signs of life where she expected none – it was like a punch to the gut. This was going to be more complicated than she had imagined.\n\nDragging her suitcase behind, she moved closer, each step heavy with a mix of confusion and a deep, unspoken sense of betrayal. She had built up a fantasy of returning to her roots, of finding closure in the empty rooms and silent halls of her childhood. Now, that fantasy was crumbling.\n\nReaching the front door, her heart thudded painfully in her chest. The moment felt surreal, a stark contrast to the idyllic homecoming she had played over in her mind. She lifted her hand, hesitating for a brief second before knocking.\n\nThe door opened abruptly, and Kirsty was met with a sight that further unsettled her. A man stood there, his appearance rugged and weary. He had a rough beard, and the bags under his eyes spoke of long, sleepless nights. His hair was unkempt, and his clothing, though clean, had a worn look about them.\n\n\"Who are you?\" His voice was gruff, the question delivered with a piercing gaze that made it clear he was not in the habit of welcoming strangers. \n\nKirsty\'s voice faltered slightly, the reality of her situation',
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
                            'Pg 1 out of 330',
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
