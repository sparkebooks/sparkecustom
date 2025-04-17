import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch2pg7_model.dart';
export 'heirloom_secret_ch2pg7_model.dart';

class HeirloomSecretCh2pg7Widget extends StatefulWidget {
  const HeirloomSecretCh2pg7Widget({super.key});

  static String routeName = 'HeirloomSecretCh2pg7';
  static String routePath = 'heirloomSecretCh2pg7';

  @override
  State<HeirloomSecretCh2pg7Widget> createState() =>
      _HeirloomSecretCh2pg7WidgetState();
}

class _HeirloomSecretCh2pg7WidgetState
    extends State<HeirloomSecretCh2pg7Widget> {
  late HeirloomSecretCh2pg7Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh2pg7Model());

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
              context.pushNamed(HeirloomSecretCh2pg8Widget.routeName);
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
                      'As she lay there, the quietness of the inn enveloped her, a stark contrast to the constant hum of New York City. Her thoughts drifted to Ryan, the man who had disrupted her plans so completely. His rugged appearance, his blunt demeanor, and his claim to the house — it was all so unexpected. And yet, there was something about the way he spoke, the conviction in his eyes, that made her wonder about the story he carried.\n\nKirsty knew she needed to find answers, not just for the sake of the house, but to understand her father\'s decisions, and perhaps, to find closure for a part of her life that had been left unresolved for too long.\nAs sleep finally claimed her, her last thoughts were of the days ahead, of the challenges and revelations they might bring. She knew one thing for certain — her journey was just beginning.\n\nThe first light of dawn filtered through the curtains, casting a soft glow across Kirsty\'s room. She stirred, her sleep having been fitful and filled with dreams of her childhood home. With a sigh, she rose, feeling the weight of the day\'s tasks ahead. \n\nDownstairs, the smell of fresh coffee and baking bread filled the air. In the dining area, Mrs. Harper was setting out plates of eggs and bacon, her movements methodical and comforting.\n\n\"Good morning, dear,\" Mrs. Harper greeted her with a warm smile. \"I hope you slept well.\"\n\nKirsty managed a half-smile as she took a seat. \"As well as I could, considering everything. Thank you for the breakfast, it smells wonderful.\"\n\nAs she ate, Mr. Harper joined them, carrying a pot of coffee. \"We were just talking about your father, Kirsty,\" he said, pouring her a cup. \"He was a good man, but he kept to himself these last few years. It was a shock to everyone when he passed.\"',
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
                            'Page 7 out of 330',
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
