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

class RawScrollBar extends StatefulWidget {
  const RawScrollBar({
    super.key,
    this.height,
    this.width,
    this.isAlwaysShown = true,
    this.thickness = 8.0,
    this.thumbColor = Colors.grey,
    required this.child,
  });

  final double? height;
  final double? width;
  final bool isAlwaysShown;
  final double thickness;
  final Color thumbColor;
  final Widget Function() child;

  @override
  _RawScrollBarState createState() => _RawScrollBarState();
}

class _RawScrollBarState extends State<RawScrollBar> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Safely handle the child widget
    Widget childWidget;
    try {
      childWidget = widget.child();
    } catch (e) {
      // Provide a fallback widget if child() throws an error
      childWidget = Container();
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: RawScrollbar(
        controller: _scrollController,
        thumbVisibility: widget.isAlwaysShown,
        thickness: widget.thickness,
        thumbColor: widget.thumbColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: childWidget,
        ),
      ),
    );
  }
}
