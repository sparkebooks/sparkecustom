// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStateImpl _$$StreakStateImplFromJson(Map<String, dynamic> json) =>
    _$StreakStateImpl(
      nDays: (json['nDays'] as num?)?.toInt() ?? 0,
      lastCheckIn: json['lastCheckIn'] == null
          ? null
          : DateTime.parse(json['lastCheckIn'] as String),
    );

Map<String, dynamic> _$$StreakStateImplToJson(_$StreakStateImpl instance) =>
    <String, dynamic>{
      'nDays': instance.nDays,
      'lastCheckIn': instance.lastCheckIn?.toIso8601String(),
    };
