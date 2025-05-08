import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sparke_kaleo/applovin_ads.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/config.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/data/check_in_streak_repo/state_x.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/data/check_in_streak_repo/streak_repo.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/data/social_media_connection_repo.dart/social_media_connection_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../backend/schema/users_record.dart';
import 'convert.dart';
import 'data/db_utils.dart';
import 'data/social_media_connection_repo.dart/state.dart';
import 'state.dart';

class Bloc extends ChangeNotifier {
  UiState _state;
  late final List<StreamSubscription> _subs;
  late final AppLifecycleListener _appLifecycleListener;
  late final _appResumeStreamController = StreamController.broadcast();

  final UsersRecord? Function() currentUser;
  final Stream<UsersRecord?> userStream;
  final AppLovinAds appLovinAds;
  final CheckInStreakRepo checkInStreakRepo;
  final SocialMediaConnectionRepo socialMediaConnectionRepo;

  Bloc({
    required this.currentUser,
    required this.userStream,
    required this.appLovinAds,
    required this.checkInStreakRepo,
    required this.socialMediaConnectionRepo,
  }) : _state = UiState(dataStatus: DataStatus.loading) {
    _appLifecycleListener = AppLifecycleListener(
      onResume: () => _appResumeStreamController.add(null),
    );
    _subs = [
      _anonymousUserListener,
    ];
    if (checkInStreakRepo.state.isCurrentlyLost) {
      checkInStreakRepo.reset();
    }
    _initialize();
  }

  @override
  void dispose() {
    _subs.forEach((e) => e.cancel());
    _appLifecycleListener.dispose();
    _appResumeStreamController.close();
    super.dispose();
  }

  UiState get state => _state;

  @visibleForTesting
  set state(UiState nw) {
    _state = nw;
    notifyListeners();
  }

  void _initialize() async {
    final userId = currentUser()?.uid;
    if (userId == null) return;
    try {
      final res = await DbUtils.getOrCreateCoinsEntry(userId: userId);
      state = state.copyWith(
        dataStatus: DataStatus.loaded,
        data: Data(
          coinBalance: res.balance ?? 0,
          isAnonymousUser: currentUser()?.anonymousUser ?? true,
          streakData: checkInStreakRepo.state.convert(),
          isConnectedOnSocialMediaMap: socialMediaConnectionRepo.state.data,
        ),
      );
    } catch (e, s) {
      log('Initialization error', error: e, stackTrace: s);
      state = state.copyWith(
        dataStatus: DataStatus.error,
        dataError: e,
      );
    }
  }

  late final _anonymousUserListener = userStream.listen((user) {
    final cp = state.copyWith.data;
    if (cp == null) return;
    state = cp(isAnonymousUser: user?.anonymousUser ?? true);
  });

  /// returns reward
  Future<int> reportStreakCheckIn() async {
    final userId = currentUser()?.uid;
    if (userId == null) return 0;
    try {
      final reward =
          checkInStreakReward(streakDays: checkInStreakRepo.state.nDays);
      checkInStreakRepo.reportCheckIn();
      await DbUtils.incrementCoinBalance(userId: userId, nCoins: reward);
      final data = state.data;
      if (data == null || !hasListeners) return 0;
      state = state.copyWith.data!(
        coinBalance: data.coinBalance + reward,
        streakData: checkInStreakRepo.state.convert(),
      );
      return reward;
    } catch (e, s) {
      log('Report streak check-in error', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<bool> watchAd() async {
    try {
      final res = await appLovinAds.showRewardedAd();
      final userId = currentUser()?.uid;
      if (!res || !hasListeners || userId == null) return false;
      await DbUtils.incrementCoinBalance(userId: userId, nCoins: watchAdReward);
      final data = state.data;
      if (data == null || !hasListeners) return false;
      state =
          state.copyWith.data!(coinBalance: data.coinBalance + watchAdReward);
      return true;
    } catch (e, s) {
      log('Watch ad reward error', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> connectOnSocialMedia(SocialMedia socialMedia) async {
    try {
      await socialMedia.launch();
      await _appResumeStreamController.stream.first;
      final userId = currentUser()?.uid;
      if (!hasListeners || userId == null) return;
      await DbUtils.incrementCoinBalance(
          userId: userId, nCoins: connectOnSocialMediaReward);
      socialMediaConnectionRepo.setConnected(
          socialMedia: socialMedia, isConnected: true);
      final data = state.data;
      if (data == null || !hasListeners) return;
      state = state.copyWith.data!(
        isConnectedOnSocialMediaMap: socialMediaConnectionRepo.state.data,
        coinBalance: data.coinBalance + connectOnSocialMediaReward,
      );
    } catch (e, s) {
      log('Connect on social media error, ${socialMedia.name}',
          error: e, stackTrace: s);
      rethrow;
    }
  }
}

extension on SocialMedia {
  Future<void> launch() async {
    const url = 'https://www.facebook.com/people/Sparke/61573975714275';
    try {
      bool res = await launchUrl(
        Uri.parse('fb://facewebmodal/f?href=$url'),
        mode: LaunchMode.externalApplication,
      );
      if (!res) throw res;
    } catch (e) {
      try {
        bool res = await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
        if (!res) throw res;
      } catch (e, s) {
        log('Failed to launch $url', error: e, stackTrace: s);
      }
    }
  }
}
