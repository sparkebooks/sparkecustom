import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class SocialMediaConnectionState with _$SocialMediaConnectionState {
  const factory SocialMediaConnectionState({
    @Default({}) Map<SocialMedia, bool> data,
  }) = _SocialMediaConnectionState;

  factory SocialMediaConnectionState.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaConnectionStateFromJson(json);
}

enum SocialMedia { facebook, instagram, tikTok, youTube }
