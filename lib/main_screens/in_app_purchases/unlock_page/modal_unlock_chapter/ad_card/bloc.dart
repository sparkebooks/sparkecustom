import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sparke_kaleo/ad_mob.dart';
import 'package:sparke_kaleo/main.dart';

import 'state.dart';

int _adCredits = 0;

class Bloc extends ChangeNotifier {
  final Function() onUnlocked;

  Bloc({required this.onUnlocked});

  UiState _state = UiState(
    isLoadingOrDisplayingAd: false,
    nWatchedAds: _adCredits,
  );

  UiState get state => _state;

  _emit(UiState nw) {
    _state = nw;
    notifyListeners();
  }

  Future<void> showAd() async {
    if (adMob == null) return;
    _emit(_state.copyWith(
      isLoadingOrDisplayingAd: true,
      error: () => null,
    ));
    try {
      final res = await adMob!.showRewardedAd(Ad.unlockNextChapterReward);
      if (!hasListeners || !res) return;
      final nWatchedAds = _state.nWatchedAds + 1;
      _adCredits = nWatchedAds;
      _emit(_state.copyWith(
        isLoadingOrDisplayingAd: false,
        nWatchedAds: nWatchedAds,
      ));
      if (nWatchedAds >= 2) {
        _adCredits = 0;
        onUnlocked();
      }
    } catch (e, s) {
      if (!hasListeners) return;
      log('Error displaying ad', error: e, stackTrace: s);
      _emit(_state.copyWith(
        isLoadingOrDisplayingAd: false,
        error: () => e,
      ));
    }
  }
}
