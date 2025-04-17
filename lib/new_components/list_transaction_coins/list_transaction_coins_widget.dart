import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_transaction_coins_model.dart';
export 'list_transaction_coins_model.dart';

class ListTransactionCoinsWidget extends StatefulWidget {
  const ListTransactionCoinsWidget({
    super.key,
    required this.transactionRef,
  });

  final PurchasesRow? transactionRef;

  @override
  State<ListTransactionCoinsWidget> createState() =>
      _ListTransactionCoinsWidgetState();
}

class _ListTransactionCoinsWidgetState
    extends State<ListTransactionCoinsWidget> {
  late ListTransactionCoinsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListTransactionCoinsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              color: FlutterFlowTheme.of(context).alternate,
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: valueOrDefault<String>(
                              formatNumber(
                                widget.transactionRef?.coinAmount,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              ),
                              '0',
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: ' coins, ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.transactionRef?.description,
                              '--',
                            ),
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Figtree',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: dateTimeFormat(
                                  "yMMMd", widget.transactionRef!.createdAt!),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: ', ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: dateTimeFormat(
                                  "jm", widget.transactionRef!.createdAt!),
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.transactionRef?.currency == TransactionType.USD.name)
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      widget.transactionRef?.amount,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                      currency: '\$',
                    ),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Figtree',
                        color: widget.transactionRef!.amount! > 1.0
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                      ),
                ),
              if (widget.transactionRef?.currency == TransactionType.COIN.name)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.transactionRef?.amount?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Figtree',
                            color: widget.transactionRef!.coinAmount! > 1
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                          ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Coin_(256_x_256_px)_(2).png',
                        width: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
