// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialMediaConnectionStateImpl _$$SocialMediaConnectionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialMediaConnectionStateImpl(
      data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$SocialMediaEnumMap, k), e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$$SocialMediaConnectionStateImplToJson(
        _$SocialMediaConnectionStateImpl instance) =>
    <String, dynamic>{
      'data':
          instance.data.map((k, e) => MapEntry(_$SocialMediaEnumMap[k]!, e)),
    };

const _$SocialMediaEnumMap = {
  SocialMedia.facebook: 'facebook',
  SocialMedia.instagram: 'instagram',
  SocialMedia.tikTok: 'tikTok',
  SocialMedia.youTube: 'youTube',
};
