import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/notification_list/notification_list_widget.dart';
import '/index.dart';
import 'main_notifications_list_widget.dart' show MainNotificationsListWidget;
import 'package:flutter/material.dart';

class MainNotificationsListModel
    extends FlutterFlowModel<MainNotificationsListWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for notification_list dynamic component.
  late FlutterFlowDynamicModels<NotificationListModel> notificationListModels;

  @override
  void initState(BuildContext context) {
    notificationListModels =
        FlutterFlowDynamicModels(() => NotificationListModel());
  }

  @override
  void dispose() {
    notificationListModels.dispose();
  }
}
