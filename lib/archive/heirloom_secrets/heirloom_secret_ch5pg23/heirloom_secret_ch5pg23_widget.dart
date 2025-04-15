import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/new_components/modal_font_style_update/modal_font_style_update_widget.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch5pg23_model.dart';
export 'heirloom_secret_ch5pg23_model.dart';

class HeirloomSecretCh5pg23Widget extends StatefulWidget {
  const HeirloomSecretCh5pg23Widget({super.key});

  static String routeName = 'HeirloomSecretCh5pg23';
  static String routePath = 'heirloomSecretCh5pg23';

  @override
  State<HeirloomSecretCh5pg23Widget> createState() =>
      _HeirloomSecretCh5pg23WidgetState();
}

class _HeirloomSecretCh5pg23WidgetState
    extends State<HeirloomSecretCh5pg23Widget> {
  late HeirloomSecretCh5pg23Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh5pg23Model());

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
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: FlutterFlowTheme.of(context).accent4,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ModalFontStyleUpdateWidget(
                        onApplyChanges: () async {},
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
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
                      '\"It is,\" Kirsty agreed. \"But coming back, I\'m reminded of so many memories in this house.\"\n\nThere was a pause, filled with unspoken understanding. Ryan finally broke the silence. \"Do you want to come in? See the house?\"\n\nKirsty\'s heart leaped at the invitation. \"I would like that, yes.\"\n\nAs they walked through the house, Kirsty was hit by a wave of nostalgia. Each room held fragments of her past, moments of joy and pain intertwined. Ryan watched her quietly, allowing her the space to reconnect with her childhood home.\n\n\"It\'s a beautiful house,\" Ryan remarked as they stood in the living room, the setting sun casting a warm glow through the windows.\n\n\"It is,\" Kirsty replied softly. \"It holds a lot of painful memories... but beautiful ones too. It\'s been my dream house since I was a child.\"\n\nRyan\'s expression softened. \"I can see why. It\'s a special place.\"\n\nKirsty looked around, the walls echoing with echoes of her past. As they wandered through the house, Ryan glanced at Kirsty, curiosity evident in his expression. \"So, you write novels. What kind are they?\"\n\nKirsty, taken aback by the sudden interest, smiled slightly. \"Mostly contemporary fiction. Stories about people finding their way, dealing with life\'s complexities.\"\n\n\"That sounds... profound,\" Ryan said, a hint of genuine admiration in his voice.',
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
                            'Page 329 out of 330',
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
                              '99%',
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
