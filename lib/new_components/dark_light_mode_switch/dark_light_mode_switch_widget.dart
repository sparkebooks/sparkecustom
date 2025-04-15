import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dark_light_mode_switch_model.dart';
export 'dark_light_mode_switch_model.dart';

class DarkLightModeSwitchWidget extends StatefulWidget {
  const DarkLightModeSwitchWidget({super.key});

  @override
  State<DarkLightModeSwitchWidget> createState() =>
      _DarkLightModeSwitchWidgetState();
}

class _DarkLightModeSwitchWidgetState extends State<DarkLightModeSwitchWidget> {
  late DarkLightModeSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarkLightModeSwitchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if ((Theme.of(context).brightness == Brightness.light) == true) {
          // setDarkmode
          setDarkModeSetting(context, ThemeMode.dark);
        } else {
          // setLightMode
          setDarkModeSetting(context, ThemeMode.light);
        }
      },
      child: Container(
        width: 80.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: AlignmentDirectional(-0.9, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    Icons.wb_sunny_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                  child: Icon(
                    Icons.mode_night_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: valueOrDefault<double>(
                        Theme.of(context).brightness == Brightness.dark
                            ? 38.0
                            : 0.0,
                        38.0,
                      ),
                      height: 36.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceOut,
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x430B0D0F),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
