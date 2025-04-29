import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_theme.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_util.dart';

import '../modal_unlock_chapter_widget.dart';
import 'bloc.dart';
import 'state.dart';

class WatchAdsToUnlockNextChapterCard extends StatelessWidget {
  final Function() onUnlocked;

  const WatchAdsToUnlockNextChapterCard({super.key, required this.onUnlocked});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bloc(onUnlocked: onUnlocked),
      child: _Content(),
    );
  }
}

extension on BuildContext {
  Bloc get bloc => read();
  UiState get state => watch<Bloc>().state;
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final state = context.state;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Watch 2 ads to unlock',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${state.nWatchedAds}/2',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Image.asset(
                              'assets/images/ads_icon.png',
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ].divide(SizedBox(width: 8)),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              _WatchButton(),
            ].divide(SizedBox(width: 2.0)),
          ),
        ),
      ),
    );
  }
}

class _WatchButton extends StatelessWidget {
  const _WatchButton();

  @override
  Widget build(BuildContext context) {
    final state = context.state;
    final adNumber = min(state.nWatchedAds + 1, 2);
    return UnlockButton(
      text: 'Watch ad $adNumber/2',
      onPressed: context.bloc.showAd,
    );
  }
}
