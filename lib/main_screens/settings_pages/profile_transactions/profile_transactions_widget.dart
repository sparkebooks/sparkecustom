import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/empty_states/empty_state_simple/empty_state_simple_widget.dart';
import '/new_components/list_transaction_coins/list_transaction_coins_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'profile_transactions_model.dart';
export 'profile_transactions_model.dart';

class ProfileTransactionsWidget extends StatefulWidget {
  const ProfileTransactionsWidget({super.key});

  static String routeName = 'profile_transactions';
  static String routePath = 'profileTransactions';

  @override
  State<ProfileTransactionsWidget> createState() =>
      _ProfileTransactionsWidgetState();
}

class _ProfileTransactionsWidgetState extends State<ProfileTransactionsWidget> {
  late ProfileTransactionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileTransactionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Order History',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'PT Serif',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<PurchasesRow>>(
            future: PurchasesTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'firebase_user_id',
                    currentUserReference?.id,
                  )
                  .order('created_at'),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<PurchasesRow> containerPurchasesRowList = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'This Month',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Figtree',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final transactionsThisMonth =
                                containerPurchasesRowList
                                    .where((e) =>
                                        dateTimeFormat("M", e.createdAt) ==
                                        dateTimeFormat(
                                            "M", getCurrentTimestamp))
                                    .toList();
                            if (transactionsThisMonth.isEmpty) {
                              return Container(
                                height: 300.0,
                                child: EmptyStateSimpleWidget(
                                  title: 'No Transactions',
                                  subTitle:
                                      'You don\'t have any transactions this month.',
                                  icon: Icon(
                                    FFIcons.kcoinsStacked03,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 72.0,
                                  ),
                                ),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: transactionsThisMonth.length,
                              itemBuilder:
                                  (context, transactionsThisMonthIndex) {
                                final transactionsThisMonthItem =
                                    transactionsThisMonth[
                                        transactionsThisMonthIndex];
                                return ListTransactionCoinsWidget(
                                  key: Key(
                                      'Keyh5f_${transactionsThisMonthIndex}_of_${transactionsThisMonth.length}'),
                                  transactionRef: transactionsThisMonthItem,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (containerPurchasesRowList
                          .where((e) =>
                              dateTimeFormat("M", e.createdAt) ==
                              dateTimeFormat("M",
                                  functions.getLastMonth(getCurrentTimestamp)))
                          .toList()
                          .isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Last Month',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final transactionsLastMonth =
                                containerPurchasesRowList
                                    .where((e) =>
                                        dateTimeFormat("M", e.createdAt) ==
                                        dateTimeFormat(
                                            "M",
                                            functions.getLastMonth(
                                                getCurrentTimestamp)))
                                    .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: transactionsLastMonth.length,
                              itemBuilder:
                                  (context, transactionsLastMonthIndex) {
                                final transactionsLastMonthItem =
                                    transactionsLastMonth[
                                        transactionsLastMonthIndex];
                                return wrapWithModel(
                                  model: _model.listTransactionCoinsModels2
                                      .getModel(
                                    transactionsLastMonthItem.id.toString(),
                                    transactionsLastMonthIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: ListTransactionCoinsWidget(
                                    key: Key(
                                      'Keyd5c_${transactionsLastMonthItem.id.toString()}',
                                    ),
                                    transactionRef: transactionsLastMonthItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
