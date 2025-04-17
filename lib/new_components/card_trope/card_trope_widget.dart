import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'card_trope_model.dart';
export 'card_trope_model.dart';

class CardTropeWidget extends StatefulWidget {
  const CardTropeWidget({
    super.key,
    required this.image,
    required this.name,
    this.action,
  });

  final String? image;
  final String? name;
  final Future Function()? action;

  @override
  State<CardTropeWidget> createState() => _CardTropeWidgetState();
}

class _CardTropeWidgetState extends State<CardTropeWidget> {
  late CardTropeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardTropeModel());

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
        await widget.action?.call();
      },
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 300),
                fadeOutDuration: Duration(milliseconds: 300),
                imageUrl: valueOrDefault<String>(
                  widget.image,
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-f5j7u5/assets/sh6xt2aktoi2/fantasy_purple.png',
                ),
                width: 300.0,
                height: 200.0,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, 0.0),
                errorWidget: (context, error, stackTrace) => Image.asset(
                  'assets/images/error_image.jpg',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget.name,
                      'Trope',
                    ).maybeHandleOverflow(
                      maxChars: 80,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 8.0,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Figtree',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ],
      ),
    );
  }
}
