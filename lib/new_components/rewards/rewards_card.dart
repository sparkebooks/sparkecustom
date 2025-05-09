import 'package:flutter/material.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_theme.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_util.dart';
import 'package:sparke_kaleo/new_components/rewards/rewards_screen.dart';
import 'package:sparke_kaleo/new_components/rewards/src/utils/coin_icon.dart';

class RewardsCard extends StatelessWidget {
  const RewardsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushRewardsScreen(),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earn FREE Coins',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'Complete tasks to earn free coins!',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Figtree',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ),
            SizedBox.square(dimension: 32, child: CoinIcon()),
            SizedBox(width: 12.0),
          ],
        ),
      ),
    );
  }
}
