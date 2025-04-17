import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'loading_notification_model.dart';
export 'loading_notification_model.dart';

class LoadingNotificationWidget extends StatefulWidget {
  const LoadingNotificationWidget({super.key});

  @override
  State<LoadingNotificationWidget> createState() =>
      _LoadingNotificationWidgetState();
}

class _LoadingNotificationWidgetState extends State<LoadingNotificationWidget> {
  late LoadingNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 60.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
        child: badges.Badge(
          badgeContent: Text(
            '0',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Figtree',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          showBadge: true,
          shape: badges.BadgeShape.circle,
          badgeColor: FlutterFlowTheme.of(context).secondaryText,
          elevation: 0.0,
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          position: badges.BadgePosition.topEnd(),
          animationType: badges.BadgeAnimationType.scale,
          toAnimate: false,
          child: Icon(
            FFIcons.kbell01,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
