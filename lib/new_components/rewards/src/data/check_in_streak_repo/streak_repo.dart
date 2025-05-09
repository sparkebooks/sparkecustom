import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class CheckInStreakRepo {
  final SharedPreferences sharedPreferences;
  StreakState _state;

  CheckInStreakRepo({required this.sharedPreferences})
      : _state = sharedPreferences.getState() ?? StreakState();

  StreakState get state => _state;

  @visibleForTesting
  set state(StreakState e) {
    _state = e;
    sharedPreferences.setState(e);
  }

  void reset() {
    state = state.copyWith(nDays: 0);
  }

  void reportCheckIn() {
    state = state.copyWith(
      lastCheckIn: DateTime.now(),
      nDays: state.nDays + 1,
    );
  }
}

extension on SharedPreferences {
  StreakState? getState() {
    final res = getString('$StreakState');
    return res == null ? null : StreakState.fromJson(jsonDecode(res));
  }

  void setState(StreakState e) {
    setString('$StreakState', jsonEncode(e.toJson()));
  }
}
