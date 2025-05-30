import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sparke_kaleo/ad_mob.dart';
import 'package:sparke_kaleo/in_app_review_manager/in_app_review_manager.dart';
import 'package:sparke_kaleo/new_components/rewards/src/config.dart';
import 'package:sparke_kaleo/new_components/rewards/src/data/check_in_streak_repo/state_x.dart';
import 'package:sparke_kaleo/new_components/rewards/src/data/check_in_streak_repo/streak_repo.dart';
import 'package:sparke_kaleo/new_components/rewards/src/data/social_media_connection_repo.dart/social_media_connection_repo.dart';
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
  final AdMob adMob;
  final CheckInStreakRepo checkInStreakRepo;
  final SocialMediaConnectionRepo socialMediaConnectionRepo;
  final InAppReviewManager inAppReviewManager;

  Bloc({
    required this.currentUser,
    required this.userStream,
    required this.adMob,
    required this.checkInStreakRepo,
    required this.socialMediaConnectionRepo,
    required this.inAppReviewManager,
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
    try {
      if (userId == null) throw 'No user';
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
      inAppReviewManager.reportCoinUnlockOnRewardsScreen();
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
      final res = await adMob.showRewardedAd(Ad.coinReward);
      final userId = currentUser()?.uid;
      if (!res || !hasListeners || userId == null) return false;
      await DbUtils.incrementCoinBalance(userId: userId, nCoins: watchAdReward);
      final data = state.data;
      if (data == null || !hasListeners) return false;
      inAppReviewManager.reportCoinUnlockOnRewardsScreen();
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
      inAppReviewManager.reportCoinUnlockOnRewardsScreen();
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
    const fbPeopleId = '61573975714275';
    const fbUrl = 'fb://profile/$fbPeopleId';
    const fallbackUrl = 'https://www.facebook.com/people/Sparke/$fbPeopleId';
    try {
      await launchUrl(Uri.parse(fbUrl));
    } catch (e) {
      await launchUrl(Uri.parse(fallbackUrl),
          mode: LaunchMode.externalApplication);
    }
  }
}
