import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_state_library_model.dart';
export 'empty_state_library_model.dart';

class EmptyStateLibraryWidget extends StatefulWidget {
  const EmptyStateLibraryWidget({
    super.key,
    String? subtitle,
  }) : this.subtitle = subtitle ??
            'It seems there are no books that meet the search criteria.';

  final String subtitle;

  @override
  State<EmptyStateLibraryWidget> createState() =>
      _EmptyStateLibraryWidgetState();
}

class _EmptyStateLibraryWidgetState extends State<EmptyStateLibraryWidget> {
  late EmptyStateLibraryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateLibraryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/empty_searching_dark_1.jpg'
                  : 'assets/images/empty_searching_light.jpg',
              width: 300.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'No Books',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Figtree',
                letterSpacing: 0.0,
              ),
        ),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Figtree',
                letterSpacing: 0.0,
              ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
