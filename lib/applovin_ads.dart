import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/foundation.dart';

final AppLovinAds? appLovinAds = kIsWeb ? null : AppLovinAds();

final _rewardedAdUnitId =
    Platform.isAndroid ? "«Android-ad-unit-ID»" : "«iOS-ad-unit-ID»";

class AppLovinAds {
  final _initCompleter = Completer();

  // Also shows consent form
  Future<void> initialize() async {
    try {
      AppLovinMAX.setHasUserConsent(false); // TODO
      AppLovinMAX.setTermsAndPrivacyPolicyFlowEnabled(true);
      AppLovinMAX.setPrivacyPolicyUrl('https://www.sparkebooks.com/privacy');
      final res = await AppLovinMAX.initialize('«sdk-key»');
      if (res == null) throw 'res is null';
      if (kDebugMode) AppLovinMAX.setVerboseLogging(true);
      _initCompleter.complete();
      AppLovinMAX.showMediationDebugger();
    } catch (e, s) {
      log('Error initializing AppLovinMAX', error: e, stackTrace: s);
      _initCompleter.completeError(e);
    }
  }

  Future<bool> showRewardedAd() async {
    await _initCompleter.future;
    final completer = Completer<bool>();
    AppLovinMAX.setRewardedAdListener(RewardedAdListener(
      onAdLoadedCallback: (ad) => AppLovinMAX.showRewardedAd(_rewardedAdUnitId),
      onAdLoadFailedCallback: (adUnitId, error) =>
          completer.completeError(error),
      onAdDisplayedCallback: (ad) {},
      onAdDisplayFailedCallback: (ad, error) => completer.completeError(error),
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) => completer.complete(false),
      onAdReceivedRewardCallback: (ad, reward) => completer.complete(true),
    ));
    AppLovinMAX.loadRewardedAd(_rewardedAdUnitId);
    return await completer.future;
  }
}
