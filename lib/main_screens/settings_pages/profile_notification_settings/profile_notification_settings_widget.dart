import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'profile_notification_settings_model.dart';
export 'profile_notification_settings_model.dart';

class ProfileNotificationSettingsWidget extends StatefulWidget {
  const ProfileNotificationSettingsWidget({super.key});

  static String routeName = 'profile_notification_settings';
  static String routePath = 'profileNotificationSettings';

  @override
  State<ProfileNotificationSettingsWidget> createState() =>
      _ProfileNotificationSettingsWidgetState();
}

class _ProfileNotificationSettingsWidgetState
    extends State<ProfileNotificationSettingsWidget> {
  late ProfileNotificationSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileNotificationSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 25.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notification Settings',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'PT Serif',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Choose what notifcations you want to recieve below and we will update the settings.',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        child: SwitchListTile.adaptive(
                          value: _model.dailyRemindersValue ??=
                              valueOrDefault<bool>(
                                  currentUserDocument
                                      ?.notificationsDailyReminders,
                                  false),
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.dailyRemindersValue = newValue);
                          },
                          title: Text(
                            'Daily Reminders',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Would you like to be reminded about your daily pass each morning?',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).info,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 12.0, 0.0),
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        child: SwitchListTile.adaptive(
                          value: _model.newBookAlertsValue ??=
                              valueOrDefault<bool>(
                                  currentUserDocument
                                      ?.notificationsNewBookAlerts,
                                  false),
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.newBookAlertsValue = newValue);
                          },
                          title: Text(
                            'New Book Alerts',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Figtree',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Would you like to receive a notification when new books have been released that are within the tropes you have selected?',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).info,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 12.0, 0.0),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .addToStart(SizedBox(height: 4.0))
                      .addToEnd(SizedBox(height: 16.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (!(await getPermissionStatus(notificationsPermission))) {
                    context.pushNamed(
                      PermissionsNotificationsWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 400),
                        ),
                      },
                    );
                  } else {
                    await currentUserReference!.update(createUsersRecordData(
                      lastActiveTime: getCurrentTimestamp,
                      notificationsDailyReminders: _model.dailyRemindersValue,
                      notificationsNewBookAlerts: _model.newBookAlertsValue,
                    ));
                  }

                  context.pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'We have updated your notification settings!',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Figtree',
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                            ),
                      ),
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                },
                text: 'Save Changes',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Figtree',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
