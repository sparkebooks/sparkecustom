import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/empty_states/empty_state_simple/empty_state_simple_widget.dart';
import '/new_components/notification_list/notification_list_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'main_notifications_list_model.dart';
export 'main_notifications_list_model.dart';

class MainNotificationsListWidget extends StatefulWidget {
  const MainNotificationsListWidget({super.key});

  static String routeName = 'main_notifications_list';
  static String routePath = 'mainNotificationsList';

  @override
  State<MainNotificationsListWidget> createState() =>
      _MainNotificationsListWidgetState();
}

class _MainNotificationsListWidgetState
    extends State<MainNotificationsListWidget> {
  late MainNotificationsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainNotificationsListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(valueOrDefault<bool>(
              currentUserDocument?.notificationsDailyReminders, false) &&
          (await getPermissionStatus(notificationsPermission)))) {
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
      }
      await Future.delayed(const Duration(milliseconds: 2000));
      // update_local_state
      FFAppState().lastReadNotification = getCurrentTimestamp;
      safeSetState(() {});
      if (dateTimeFormat("Md", currentUserDocument?.lastReadNotification) !=
          dateTimeFormat("Md", currentUserDocument?.lastReadNotification)) {
        // update_user_last_read

        await currentUserReference!.update(createUsersRecordData(
          lastActiveTime: getCurrentTimestamp,
          lastReadNotification: getCurrentTimestamp,
        ));
        await action_blocks.successSnackBar(
          context,
          snackbarText: 'Notifications are up to date!',
        );
      }
    });

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'PT Serif',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
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
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: FutureBuilder<List<ActivityRow>>(
          future: ActivityTable().queryRows(
            queryFn: (q) => q
                .containsOrNull(
                  'user_list',
                  '{${currentUserReference?.id}}',
                )
                .order('created_at'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<ActivityRow> listViewActivityRowList = snapshot.data!;

            if (listViewActivityRowList.isEmpty) {
              return EmptyStateSimpleWidget(
                title: 'No Notifications',
                subTitle: 'It seems you don\'t have any notifications for now.',
                icon: Icon(
                  FFIcons.kbell01,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 72.0,
                ),
              );
            }

            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                48.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listViewActivityRowList.length,
              separatorBuilder: (_, __) => SizedBox(height: 1.0),
              itemBuilder: (context, listViewIndex) {
                final listViewActivityRow =
                    listViewActivityRowList[listViewIndex];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await currentUserReference!.update(createUsersRecordData(
                      lastActiveTime: getCurrentTimestamp,
                      lastReadNotification: getCurrentTimestamp,
                    ));
                  },
                  child: wrapWithModel(
                    model: _model.notificationListModels.getModel(
                      listViewActivityRow.id.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: NotificationListWidget(
                      key: Key(
                        'Key7ju_${listViewActivityRow.id.toString()}',
                      ),
                      activityDoc: listViewActivityRow,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
