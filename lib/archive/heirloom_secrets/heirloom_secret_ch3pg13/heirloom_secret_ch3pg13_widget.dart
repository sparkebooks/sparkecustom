import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch3pg13_model.dart';
export 'heirloom_secret_ch3pg13_model.dart';

class HeirloomSecretCh3pg13Widget extends StatefulWidget {
  const HeirloomSecretCh3pg13Widget({super.key});

  static String routeName = 'HeirloomSecretCh3pg13';
  static String routePath = 'heirloomSecretCh3pg13';

  @override
  State<HeirloomSecretCh3pg13Widget> createState() =>
      _HeirloomSecretCh3pg13WidgetState();
}

class _HeirloomSecretCh3pg13WidgetState
    extends State<HeirloomSecretCh3pg13Widget> {
  late HeirloomSecretCh3pg13Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh3pg13Model());

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
              context.pushNamed(HeirloomSecretCh3pg14Widget.routeName);
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
                      'Ryan\'s scrutinizing gaze lingered on Kirsty, an unspoken assessment in his eyes. Their eye contact was intense, almost piercing, and Kirsty felt an unexpected warmth rise to her cheeks. She quickly looked away, embarrassed by her reaction and frustrated at herself for letting it show. She tried to mask her discomfort, focusing instead on the matter at hand.\n\n\"The will isn\'t just \'a piece of paper,\'\" Kirsty said, her voice tinged with irritation. \"It represents my father\'s wishes, and this house is a part of that. But maybe there\'s a way we can work this out, some kind of arrangement.\"\n\nShe took a breath, trying to regain some sense of control over the conversation. \"Can we at least sit down and discuss this over tea or something?\" she asked, hoping to shift the discussion to a more neutral setting.\n\nRyan, however, remained unyielding, his expression firm. \"I don\'t think that\'s a good idea. This isn\'t a social visit, and I\'m not in the habit of having tea with strangers, especially under these circumstances.\"\n\nKirsty bristled at his outright denial, feeling both rebuffed and more determined. \"I\'m not a stranger, Ryan. I grew up in this house. I\'m trying to be reasonable here, but you\'re not giving me much to work with.\"\n\nRyan\'s gaze hardened, and his voice took on a cutting edge. \"Some daughter you are, not even bothering to return in your father\'s last days.\"\n\nKirsty felt as if she had been slapped. The accusation stung, bringing up a swirl of guilt and hurt. She had wrestled with her decision to stay away, and his words hit too close to home.\n\n\"I had my reasons,\" Kirsty said, her voice strained with a mixture of defensiveness and regret. \"It\'s complicated.\"',
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
                            'Page 13 out of 330',
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
                              '4%',
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
