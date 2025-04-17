import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_single/loading_single_widget.dart';
import 'package:flutter/material.dart';
import 'ui_coin_balance_model.dart';
export 'ui_coin_balance_model.dart';

class UiCoinBalanceWidget extends StatefulWidget {
  const UiCoinBalanceWidget({super.key});

  @override
  State<UiCoinBalanceWidget> createState() => _UiCoinBalanceWidgetState();
}

class _UiCoinBalanceWidgetState extends State<UiCoinBalanceWidget> {
  late UiCoinBalanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UiCoinBalanceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoinsRow>>(
      stream: _model.containerSupabaseStream ??= SupaFlow.client
          .from("coins")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'firebase_user_id',
            currentUserReference?.id,
          )
          .map((list) => list.map((item) => CoinsRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: LoadingSingleWidget(),
          );
        }
        List<CoinsRow> containerCoinsRowList = snapshot.data!;

        final containerCoinsRow = containerCoinsRowList.isNotEmpty
            ? containerCoinsRowList.first
            : null;

        return Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Current Balance',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          containerCoinsRow?.balance,
                          formatType: FormatType.compact,
                        ),
                        '0',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'PT Serif',
                                letterSpacing: 0.0,
                              ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Coin_(256_x_256_px)_(2).png',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
