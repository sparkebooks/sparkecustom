import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class ReviewManagerState with _$ReviewManagerState {
  const factory ReviewManagerState({
    @Default(0) int nCoinUnlocks,
    @Default(0) int nChapterUnlocks,
  }) = _ReviewManagerState;

  factory ReviewManagerState.fromJson(Map<String, dynamic> json) =>
      _$ReviewManagerStateFromJson(json);
}
