import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/social_media_connection_repo.dart/state.dart';

part 'state.freezed.dart';

@freezed
class UiState with _$UiState {
  const factory UiState({
    required DataStatus dataStatus,
    Object? dataError,
    Data? data,
  }) = _UiState;
}

enum DataStatus { loading, error, loaded }

@freezed
class Data with _$Data {
  const factory Data({
    required int coinBalance,
    required bool isAnonymousUser,
    required StreakData streakData,
    required Map<SocialMedia, bool> isConnectedOnSocialMediaMap,
  }) = _Data;
}

extension DataX on Data {
  bool isConnectedOnSocialMedia(SocialMedia a) =>
      isConnectedOnSocialMediaMap[a] ?? false;
}

@freezed
class StreakData with _$StreakData {
  const factory StreakData({
    required int nDays,
    required bool didCheckInToday,
  }) = _StreakData;
}
