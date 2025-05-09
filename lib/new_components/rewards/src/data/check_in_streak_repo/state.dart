import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState({
    @Default(0) int nDays,
    DateTime? lastCheckIn,
  }) = _StreakState;

  factory StreakState.fromJson(Map<String, dynamic> json) =>
      _$StreakStateFromJson(json);
}
