import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch4pg17_model.dart';
export 'heirloom_secret_ch4pg17_model.dart';

class HeirloomSecretCh4pg17Widget extends StatefulWidget {
  const HeirloomSecretCh4pg17Widget({super.key});

  static String routeName = 'HeirloomSecretCh4pg17';
  static String routePath = 'heirloomSecretCh4pg17';

  @override
  State<HeirloomSecretCh4pg17Widget> createState() =>
      _HeirloomSecretCh4pg17WidgetState();
}

class _HeirloomSecretCh4pg17WidgetState
    extends State<HeirloomSecretCh4pg17Widget> {
  late HeirloomSecretCh4pg17Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh4pg17Model());

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
              context.pushNamed(HeirloomSecretCh4pg18Widget.routeName);
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
                      'The next morning, Kirsty set out with determination. Her first stop was the town hall, where she hoped to uncover any public records about her father and the property. The building, with its stately architecture and the air of quiet bureaucracy, felt like a stepping stone into the unknown chapters of her father\'s life.\n\nAt the town hall, she requested property records and any documentation related to her father’s estate. While waiting, her mind wandered, piecing together the scattered memories of her father, the house, and her childhood.\n\nThe clerk returned, handing her a folder of documents. Kirsty\'s heart raced as she flipped through them. There was the original deed, a few routine transactions, but nothing that directly addressed the conflicting wills. She needed more, something personal, something that revealed the nature of her father\'s relationship with Ryan.\n\nLeaving the town hall, Kirsty decided her next step was to speak with some of the town\'s long-standing residents who might have known her father. As she walked down the main street, contemplating her approach, she spotted Ryan outside his grocery store, unloading supplies from a truck.\n\nDetermined to confront the situation head-on, Kirsty approached him. \"Ryan, we need to talk,\" she said, her voice steady.\n\nRyan looked up, his expression guarded. \"What is it now, Kirsty?\"\n\n\"I\'ve been going through public records, trying to understand what happened. But I need to know more about you and my father. How did you two meet? What was your relationship like?\"\n\nRyan hesitated, then set down the box he was carrying. \"I don\'t see how that\'s any of your business.\"',
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
                            'Page 17 out of 330',
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
