import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/new_components/selection_age/selection_age_widget.dart';
import 'dart:async';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding_user_model.dart';
export 'onboarding_user_model.dart';

class OnboardingUserWidget extends StatefulWidget {
  const OnboardingUserWidget({
    super.key,
    bool? createProfile,
  }) : this.createProfile = createProfile ?? false;

  final bool createProfile;

  static String routeName = 'onboarding_user';
  static String routePath = 'onboardingUser';

  @override
  State<OnboardingUserWidget> createState() => _OnboardingUserWidgetState();
}

class _OnboardingUserWidgetState extends State<OnboardingUserWidget> {
  late OnboardingUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: AnimatedDefaultTextStyle(
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'PT Serif',
                letterSpacing: 0.0,
              ),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: Text(
            _model.pageViewCurrentIndex == 0 ? 'Tropes' : 'Select Age',
          ),
        ),
        actions: [
          Visibility(
            visible: widget.createProfile == false,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  FFIcons.kxClose,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600.0,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            onPageChanged: (_) => safeSetState(() {}),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 12.0),
                                      child: Text(
                                        'Which tropes do you enjoy reading? Please select at least 3 tropes from below.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<List<TropesRow>>(
                                          future: TropesTable().queryRows(
                                            queryFn: (q) => q.order('name',
                                                ascending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TropesRow>
                                                choiceChipsTropesRowList =
                                                snapshot.data!;

                                            return FlutterFlowChoiceChips(
                                              options: choiceChipsTropesRowList
                                                  .map((e) => e.name)
                                                  .withoutNulls
                                                  .toList()
                                                  .map((label) =>
                                                      ChipData(label))
                                                  .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .choiceChipsValues = val);
                                                FFAppState().selectedTropes =
                                                    _model.choiceChipsValues!
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 18.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 4.0,
                                                            12.0, 4.0),
                                                elevation: 0.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderWidth: 2.0,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 18.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 4.0,
                                                            12.0, 4.0),
                                                elevation: 0.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized:
                                                  _model.choiceChipsValues !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                FFAppState().selectedTropes,
                                              ),
                                              wrapped: true,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 0.0),
                                        child: Text(
                                          '${valueOrDefault<String>(
                                            _model.choiceChipsValues?.length
                                                .toString(),
                                            '0',
                                          )} selected',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 16.0)),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Please select your age below',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final ageOptions =
                                            FFAppState().ageOptions.toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: ageOptions.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, ageOptionsIndex) {
                                            final ageOptionsItem =
                                                ageOptions[ageOptionsIndex];
                                            return wrapWithModel(
                                              model: _model.selectionAgeModels
                                                  .getModel(
                                                ageOptionsIndex.toString(),
                                                ageOptionsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: SelectionAgeWidget(
                                                key: Key(
                                                  'Keyuvt_${ageOptionsIndex.toString()}',
                                                ),
                                                isSelected: FFAppState().age ==
                                                    ageOptionsItem,
                                                text: ageOptionsItem,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].addToEnd(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 2,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 16.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.choiceChipsValues!.length >= 3) {
                        if ((_model.pageViewCurrentIndex == 0) &&
                            widget.createProfile) {
                          // go_to_age
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          // create_daily_pass
                          unawaited(
                            () async {
                              await DailyPassTable().insert({
                                'firebase_user_id': currentUserReference?.id,
                                'created_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                              });
                            }(),
                          );
                        } else if ((_model.pageViewCurrentIndex == 0) &&
                            !widget.createProfile) {
                          // update_user_no_age

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              lastActiveTime: getCurrentTimestamp,
                              userRole: currentUserDocument?.userRole == null
                                  ? UserRole.Customer
                                  : currentUserDocument?.userRole,
                            ),
                            ...mapToFirestore(
                              {
                                'selected_tropes': _model.choiceChipsValues,
                              },
                            ),
                          });

                          context.goNamed(MainHomeWidget.routeName);
                        } else {
                          // update_user_age_tropes

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              ageRange: FFAppState().age,
                              lastActiveTime: getCurrentTimestamp,
                              userRole: currentUserDocument?.userRole == null
                                  ? UserRole.Customer
                                  : currentUserDocument?.userRole,
                            ),
                            ...mapToFirestore(
                              {
                                'selected_tropes': _model.choiceChipsValues,
                              },
                            ),
                          });

                          context.goNamed(MainHomeWidget.routeName);
                        }
                      } else {
                        if (_model.pageViewCurrentIndex == 1) {
                          await _model.pageViewController?.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          // show_error
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select at least 3 tropes from above.',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                              duration: Duration(milliseconds: 3000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }

                        return;
                      }
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Figtree',
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
