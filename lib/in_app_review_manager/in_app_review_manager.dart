import 'dart:convert';
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class InAppReviewManager {
  final SharedPreferences sharedPreferences;
  ReviewManagerState _state;

  InAppReviewManager({required this.sharedPreferences})
      : _state = sharedPreferences.getState() ?? ReviewManagerState();

  ReviewManagerState get state => _state;

  @visibleForTesting
  set state(ReviewManagerState e) {
    _eval(_state, e);
    _state = e;
    sharedPreferences.setState(e);
  }

  void _eval(ReviewManagerState a, ReviewManagerState b) async {
    if ((a.nChapterUnlocks < 1 && b.nChapterUnlocks >= 1) ||
        (a.nCoinUnlocks < 3 && b.nCoinUnlocks >= 3)) {
      try {
        await InAppReview.instance.requestReview();
      } catch (e, s) {
        log('Error requesting a review', error: e, stackTrace: s);
      }
    }
  }

  void reportCoinUnlockOnRewardsScreen() {
    state = state.copyWith(nCoinUnlocks: state.nCoinUnlocks + 1);
  }

  void reportChapterUnlockedOnPaywall() {
    state = state.copyWith(nChapterUnlocks: state.nChapterUnlocks + 1);
  }
}

extension on SharedPreferences {
  ReviewManagerState? getState() {
    final res = getString('$ReviewManagerState');
    return res == null ? null : ReviewManagerState.fromJson(jsonDecode(res));
  }

  void setState(ReviewManagerState e) {
    setString('$ReviewManagerState', jsonEncode(e.toJson()));
  }
}
