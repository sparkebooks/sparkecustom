import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMob {
  var _unlockNextChapterRewardAd = Completer<RewardedAd>();
  var _coinRewardAd = Completer<RewardedAd>();

  Future<void> initialize() async {
    try {
      await _requestConsent();
      final res = await MobileAds.instance.initialize();
      res.adapterStatuses.entries.forEach(
          (e) => log('ad adapter status ${e.key}: ${e.value.description}'));
      _unlockNextChapterRewardAd = _loadRewardedAd(Ad.unlockNextChapterReward);
      _coinRewardAd = _loadRewardedAd(Ad.coinReward);
    } catch (e, s) {
      log('Error initializing adMob', error: e, stackTrace: s);
      _unlockNextChapterRewardAd.completeError(e, s);
      _coinRewardAd.completeError(e, s);
    }
  }

  Future<void> _requestConsent() async {
    final completer = Completer();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(tagForUnderAgeOfConsent: false),
      () async {
        ConsentForm.loadAndShowConsentFormIfRequired(
          (error) => error != null
              ? completer.completeError(error)
              : completer.complete(),
        );
      },
      (FormError error) => completer.completeError(error),
    );
    await completer.future;
  }

  Completer<RewardedAd> _loadRewardedAd(Ad ad) {
    try {
      final loadCompleter = Completer<RewardedAd>();
      RewardedAd.load(
          adUnitId: ad.unitId,
          request: const AdRequest(),
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) => loadCompleter.complete(ad),
            onAdFailedToLoad: (LoadAdError error) =>
                loadCompleter.completeError(error),
          ));
      return loadCompleter;
    } catch (e, s) {
      log('Error showing adMob rewarded ad', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<bool> showRewardedAd(Ad adType) async {
    final Completer<RewardedAd> loadCompleter;
    switch (adType) {
      case Ad.unlockNextChapterReward:
        loadCompleter = _unlockNextChapterRewardAd;
        _unlockNextChapterRewardAd =
            _loadRewardedAd(Ad.unlockNextChapterReward);
      case Ad.coinReward:
        loadCompleter = _coinRewardAd;
        _coinRewardAd = _loadRewardedAd(Ad.coinReward);
    }
    final adCompleter = Completer();
    try {
      final ad = await loadCompleter.future;
      bool isRewardEarned = false;
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdFailedToShowFullScreenContent: (ad, err) {
          ad.dispose();
          if (!adCompleter.isCompleted) adCompleter.completeError(err);
        },
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          if (!adCompleter.isCompleted) adCompleter.complete();
        },
      );
      ad.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
        isRewardEarned = true;
      });
      await adCompleter.future;
      return isRewardEarned;
    } catch (e, s) {
      log('Error showing adMob rewarded ad', error: e, stackTrace: s);
      rethrow;
    }
  }
}

enum Ad {
  unlockNextChapterReward,
  coinReward;
}

bool _useTestAds = false; //kDebugMode;

extension on Ad {
  String get unitId => switch (this) {
        Ad.unlockNextChapterReward => Platform.isAndroid
            ? _useTestAds
                ? 'ca-app-pub-3940256099942544/5224354917'
                : 'ca-app-pub-9014681896021862/5756961773'
            : _useTestAds
                ? 'ca-app-pub-3940256099942544/1712485313'
                : 'ca-app-pub-9014681896021862/4847188875',
        Ad.coinReward => Platform.isAndroid
            ? _useTestAds
                ? 'ca-app-pub-3940256099942544/5224354917'
                : 'ca-app-pub-9014681896021862/2611907779'
            : _useTestAds
                ? 'ca-app-pub-3940256099942544/1712485313'
                : 'ca-app-pub-9014681896021862/6227719153',
      };
}
