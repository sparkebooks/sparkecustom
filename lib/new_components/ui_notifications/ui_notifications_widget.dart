import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_notification/loading_notification_widget.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'ui_notifications_model.dart';
export 'ui_notifications_model.dart';

class UiNotificationsWidget extends StatefulWidget {
  const UiNotificationsWidget({super.key});

  @override
  State<UiNotificationsWidget> createState() => _UiNotificationsWidgetState();
}

class _UiNotificationsWidgetState extends State<UiNotificationsWidget> {
  late UiNotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiNotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => FutureBuilder<List<ActivityRow>>(
        future: ActivityTable().queryRows(
          queryFn: (q) => q
              .containsOrNull(
                'user_list',
                '{${currentUserReference?.id}}',
              )
              .gteOrNull(
                'created_at',
                supaSerialize<DateTime>(
                    currentUserDocument?.lastReadNotification),
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return LoadingNotificationWidget();
          }
          List<ActivityRow> notificationActivityRowList = snapshot.data!;

          return Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
              child: badges.Badge(
                badgeContent: Text(
                  valueOrDefault<String>(
                    notificationActivityRowList.length.toString(),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Figtree',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
                showBadge: true,
                shape: badges.BadgeShape.circle,
                badgeColor: valueOrDefault<int>(
                          notificationActivityRowList.length,
                          0,
                        ) >=
                        1
                    ? FlutterFlowTheme.of(context).error
                    : FlutterFlowTheme.of(context).alternate,
                elevation: 4.0,
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                position: badges.BadgePosition.topEnd(),
                animationType: badges.BadgeAnimationType.scale,
                toAnimate: false,
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    FFIcons.kbell01,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      MainNotificationsListWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
