// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewManagerStateImpl _$$ReviewManagerStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewManagerStateImpl(
      nCoinUnlocks: (json['nCoinUnlocks'] as num?)?.toInt() ?? 0,
      nChapterUnlocks: (json['nChapterUnlocks'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReviewManagerStateImplToJson(
        _$ReviewManagerStateImpl instance) =>
    <String, dynamic>{
      'nCoinUnlocks': instance.nCoinUnlocks,
      'nChapterUnlocks': instance.nChapterUnlocks,
    };
