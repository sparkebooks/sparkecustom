import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_util.dart';

import 'state.dart';

class SocialMediaConnectionRepo {
  final SharedPreferences sharedPreferences;
  SocialMediaConnectionState _state;

  SocialMediaConnectionRepo({required this.sharedPreferences})
      : _state = sharedPreferences.getState() ?? SocialMediaConnectionState();

  SocialMediaConnectionState get state => _state;

  @visibleForTesting
  set state(SocialMediaConnectionState e) {
    _state = e;
    sharedPreferences.setState(e);
  }

  void setConnected(
      {required SocialMedia socialMedia, required bool isConnected}) {
    state = state.copyWith(
      data: {
        ...state.data,
        socialMedia: isConnected,
      },
    );
  }
}

extension on SharedPreferences {
  SocialMediaConnectionState? getState() {
    final res = getString('$SocialMediaConnectionState');
    return res == null
        ? null
        : SocialMediaConnectionState.fromJson(jsonDecode(res));
  }

  void setState(SocialMediaConnectionState e) {
    setString('$SocialMediaConnectionState', jsonEncode(e.toJson()));
  }
}
