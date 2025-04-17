// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:visibility_detector/visibility_detector.dart';

class VisibilityDetectorWidget extends StatefulWidget {
  const VisibilityDetectorWidget({
    super.key,
    this.height,
    this.width,
    this.bookRef,
    required this.child,
  });

  final double? height;
  final double? width;
  final BooksRow? bookRef;
  final Widget Function() child;

  @override
  State<VisibilityDetectorWidget> createState() =>
      _VisibilityDetectorWidgetState();
}

class _VisibilityDetectorWidgetState extends State<VisibilityDetectorWidget> {
  bool hasBeenVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onVisibilityChanged(VisibilityInfo info) async {
    if ((info.visibleFraction * 100) >= 100 &&
        !hasBeenVisible &&
        !FFAppState()
            .alreadyCalculatedImpressionsID
            .contains(widget!.bookRef?.id)) {
      hasBeenVisible = true;

      await updateImpressions(widget!.bookRef!.id);

      FFAppState().alreadyCalculatedImpressionsID.add(widget!.bookRef!.id);
    } else if (info.visibleFraction == 0 && hasBeenVisible) {
      hasBeenVisible = false;
    }
  }

  Future<void> updateImpressions(int id) async {
    final supabase = Supabase.instance.client;

    try {
      await supabase
          .rpc('increment_impressions', params: {'row_id': id}).select();
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget!.bookRef!.id.toString()),
      onVisibilityChanged: _onVisibilityChanged,
      child: widget.child(),
    );
  }
}
