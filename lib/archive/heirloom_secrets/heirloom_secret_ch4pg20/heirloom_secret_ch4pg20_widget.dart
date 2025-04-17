import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch4pg20_model.dart';
export 'heirloom_secret_ch4pg20_model.dart';

class HeirloomSecretCh4pg20Widget extends StatefulWidget {
  const HeirloomSecretCh4pg20Widget({super.key});

  static String routeName = 'HeirloomSecretCh4pg20';
  static String routePath = 'heirloomSecretCh4pg20';

  @override
  State<HeirloomSecretCh4pg20Widget> createState() =>
      _HeirloomSecretCh4pg20WidgetState();
}

class _HeirloomSecretCh4pg20WidgetState
    extends State<HeirloomSecretCh4pg20Widget> {
  late HeirloomSecretCh4pg20Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh4pg20Model());

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
              context.pushNamed(HeirloomSecretCh4pg21Widget.routeName);
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
                      'Ryan\'s demeanor softened as he looked at Hallie. \"Yeah, this is Hallie. My world,\" he said, a hint of pride in his voice.\n\nKirsty smiled at Hallie, then turned to Ryan. \"She\'s lovely, Ryan. I... I didn\'t realize you were a father.\"\n\nHallie, oblivious to the adults\' conversation, tugged at Ryan\'s hand. \"Daddy, can I get an ice cream?\"\n\nRyan chuckled. \"Sure, let\'s go get one.\" He then looked at Kirsty. \"Do you want to join us? Maybe we can talk a bit more... calmly.\"\n\nKirsty hesitated for a moment, then nodded. \"I\'d like that, thank you.\"\n\nAs they walked towards the ice cream stand, Kirsty watched Ryan interact with his daughter, his gentleness and affection painting a very different picture from the man she had been so quick to judge. She realized that there was more to Ryan than she had assumed, and perhaps, in understanding him, she could better understand the situation they were both entangled in.\n\nAs they enjoyed their ice creams, a cautious tension underlined their conversation. Ryan, while sharing a story about Hallie, maintained a guarded demeanor. \"Last spring, we planted a garden in the backyard. Hallie was so excited, digging in the dirt, planting seeds,\" he recounted, a faint smile touching his lips. \"She kept checking every morning, wondering why the flowers weren\'t growing overnight.\"\n\nKirsty smiled at the image, but her smile didn\'t quite reach her eyes. \"It sounds like you\'ve made a lot of memories in that house,\" she said, her voice tinged with a mix of warmth and underlying conflict.\n\n\"Yeah, we have,\" Ryan replied, his gaze shifting to Hallie, who was now making a small pile of leaves. ',
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
                            'Page 20 out of 330',
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
                              '6%',
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
