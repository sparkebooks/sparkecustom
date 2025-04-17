import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch2pg6_model.dart';
export 'heirloom_secret_ch2pg6_model.dart';

class HeirloomSecretCh2pg6Widget extends StatefulWidget {
  const HeirloomSecretCh2pg6Widget({super.key});

  static String routeName = 'HeirloomSecretCh2pg6';
  static String routePath = 'heirloomSecretCh2pg6';

  @override
  State<HeirloomSecretCh2pg6Widget> createState() =>
      _HeirloomSecretCh2pg6WidgetState();
}

class _HeirloomSecretCh2pg6WidgetState
    extends State<HeirloomSecretCh2pg6Widget> {
  late HeirloomSecretCh2pg6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh2pg6Model());

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
              context.pushNamed(HeirloomSecretCh2pg7Widget.routeName);
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
                      'Mrs. Harper\'s expression turned sympathetic. \"Oh, you poor thing. Don\'t you worry, we have a room for you. You can stay as long as you need.\"\n\nKirsty felt a wave of relief wash over her. At least for tonight, she had a place to rest. But as she followed Mrs. Harper to her room, her mind was already racing with the challenges that lay ahead. She needed to unravel the mystery of the house, of her father\'s will, and of the man who now claimed it as his own. But for now, rest was her first priority.\n\nKirsty\'s room at the inn was a small but comfortable space, decorated with floral wallpaper and furnished with an antique dresser and a cozy bed. As Mrs. Harper set down a pitcher of water on the bedside table, she looked at Kirsty with a kind, maternal gaze.\n\n\"You must be exhausted, dear,\" Mrs. Harper said softly. \"Get some rest, and we can talk more over breakfast. The whole town\'s been buzzing about the house since Jonathan passed and Ryan moved in. It\'s all very strange.\"\n\n\"Thank you, Mrs. Harper,\" Kirsty replied, her voice heavy with exhaustion. Ryan - that was the man\'s name. \"I really appreciate it.\"\n\nAfter Mrs. Harper left, Kirsty sat on the edge of the bed, her mind a whirlwind of thoughts. She felt a strange mix of being back in a familiar place and yet feeling utterly alienated. Her father\'s death, the confrontation with the strange but attractive man, the mystery of the wills — it all felt overwhelming.\n\nShe unpacked a few essentials from her suitcase and decided to take a quick shower. The warm water was soothing, helping to wash away some of the tension from the day. Afterward, she climbed into bed, the soft sheets a small comfort.',
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
                            'Page 6 out of 330',
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
