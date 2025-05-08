import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMob {
  final _initCompleter = Completer();

  Future<void> initialize() async {
    try {
      await MobileAds.instance.initialize();
      _initCompleter.complete();
    } catch (e, s) {
      log('Error initializing adMob', error: e, stackTrace: s);
      _initCompleter.completeError(e, s);
    }
  }

  Future<bool> showRewardedAd(Ad adType) async {
    try {
      await _initCompleter.future;
      final loadCompleter = Completer<RewardedAd>();
      final adCompleter = Completer();
      RewardedAd.load(
          adUnitId: adType.unitId,
          request: const AdRequest(),
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) => loadCompleter.complete(ad),
            onAdFailedToLoad: (LoadAdError error) =>
                loadCompleter.completeError(error),
          ));
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
