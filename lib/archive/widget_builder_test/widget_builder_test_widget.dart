import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'widget_builder_test_model.dart';
export 'widget_builder_test_model.dart';

class WidgetBuilderTestWidget extends StatefulWidget {
  const WidgetBuilderTestWidget({
    super.key,
    required this.child,
  });

  final Widget Function()? child;

  @override
  State<WidgetBuilderTestWidget> createState() =>
      _WidgetBuilderTestWidgetState();
}

class _WidgetBuilderTestWidgetState extends State<WidgetBuilderTestWidget> {
  late WidgetBuilderTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetBuilderTestModel());

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
      children: [
        Builder(builder: (_) {
          return widget.child!();
        }),
      ],
    );
  }
}
