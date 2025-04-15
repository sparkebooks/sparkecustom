import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/unlock_page/modal_unlock_unauth_user/modal_unlock_unauth_user_widget.dart';
import '/new_components/modal_account_options/modal_account_options_widget.dart';
import 'package:flutter/material.dart';
import 'heirloom_secret_ch5pg22_new_user_model.dart';
export 'heirloom_secret_ch5pg22_new_user_model.dart';

class HeirloomSecretCh5pg22NewUserWidget extends StatefulWidget {
  const HeirloomSecretCh5pg22NewUserWidget({super.key});

  static String routeName = 'HeirloomSecretCh5pg22NewUser';
  static String routePath = 'heirloomSecretCh5pg22NewUser';

  @override
  State<HeirloomSecretCh5pg22NewUserWidget> createState() =>
      _HeirloomSecretCh5pg22NewUserWidgetState();
}

class _HeirloomSecretCh5pg22NewUserWidgetState
    extends State<HeirloomSecretCh5pg22NewUserWidget> {
  late HeirloomSecretCh5pg22NewUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeirloomSecretCh5pg22NewUserModel());

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
                          'Heirloom Secret \nChapter 5',
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
                      'Chapter 5',
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
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                                child: Container(
                                  height: 350.0,
                                  child: ModalUnlockUnauthUserWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Text(
                        'The next day, Kirsty found herself inexplicably drawn back to the house. As she approached, she saw Hallie in the garden, delicately placing petals in a pattern on the ground. The innocence and joy in the child\'s actions tugged at Kirsty\'s heart.\n\n\"Those are lovely, Hallie,\" Kirsty said, kneeling beside her.\n\nHallie looked up, her eyes bright. \"I\'m making a fairy circle. Dad says fairies will come if I make it pretty enough.\"\n\n\"That\'s a wonderful idea,\" Kirsty replied, smiling. \"I always knew there were fairies when I lived here.\"\n\nHallie\'s eyes widened. \"You lived here?\"\n\n\"Yes, a long time ago, when I was your age.\"\n\nFrom the porch, Ryan watched them, a faint smile playing on his lips. He seemed to be seeing Kirsty in a different light.\n\nKirsty stood and walked over to where Ryan was leaning against the porch railing. \"She\'s a sweet kid,\" she said.\n\nRyan nodded, his eyes still on Hallie. \"Yeah, she\'s the best part of my life.\"\n\nKirsty hesitated, then said, \"I\'ve been thinking a lot about this place, about my father. I left here to study, to write. I\'ve been living in New York, working on novels and short stories, but I couldn’t get anything out of myself anymore.\"\n\nRyan looked genuinely interested. \"That\'s quite a journey from here.\"',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'PT Serif',
                                  letterSpacing: 0.0,
                                ),
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
                            'Page 22 out of 330',
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
                              '7%',
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
