// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreakState _$StreakStateFromJson(Map<String, dynamic> json) {
  return _StreakState.fromJson(json);
}

/// @nodoc
mixin _$StreakState {
  int get nDays => throw _privateConstructorUsedError;
  DateTime? get lastCheckIn => throw _privateConstructorUsedError;

  /// Serializes this StreakState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreakState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakStateCopyWith<StreakState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakStateCopyWith<$Res> {
  factory $StreakStateCopyWith(
          StreakState value, $Res Function(StreakState) then) =
      _$StreakStateCopyWithImpl<$Res, StreakState>;
  @useResult
  $Res call({int nDays, DateTime? lastCheckIn});
}

/// @nodoc
class _$StreakStateCopyWithImpl<$Res, $Val extends StreakState>
    implements $StreakStateCopyWith<$Res> {
  _$StreakStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nDays = null,
    Object? lastCheckIn = freezed,
  }) {
    return _then(_value.copyWith(
      nDays: null == nDays
          ? _value.nDays
          : nDays // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckIn: freezed == lastCheckIn
          ? _value.lastCheckIn
          : lastCheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakStateImplCopyWith<$Res>
    implements $StreakStateCopyWith<$Res> {
  factory _$$StreakStateImplCopyWith(
          _$StreakStateImpl value, $Res Function(_$StreakStateImpl) then) =
      __$$StreakStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nDays, DateTime? lastCheckIn});
}

/// @nodoc
class __$$StreakStateImplCopyWithImpl<$Res>
    extends _$StreakStateCopyWithImpl<$Res, _$StreakStateImpl>
    implements _$$StreakStateImplCopyWith<$Res> {
  __$$StreakStateImplCopyWithImpl(
      _$StreakStateImpl _value, $Res Function(_$StreakStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreakState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nDays = null,
    Object? lastCheckIn = freezed,
  }) {
    return _then(_$StreakStateImpl(
      nDays: null == nDays
          ? _value.nDays
          : nDays // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckIn: freezed == lastCheckIn
          ? _value.lastCheckIn
          : lastCheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakStateImpl implements _StreakState {
  const _$StreakStateImpl({this.nDays = 0, this.lastCheckIn});

  factory _$StreakStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakStateImplFromJson(json);

  @override
  @JsonKey()
  final int nDays;
  @override
  final DateTime? lastCheckIn;

  @override
  String toString() {
    return 'StreakState(nDays: $nDays, lastCheckIn: $lastCheckIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakStateImpl &&
            (identical(other.nDays, nDays) || other.nDays == nDays) &&
            (identical(other.lastCheckIn, lastCheckIn) ||
                other.lastCheckIn == lastCheckIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nDays, lastCheckIn);

  /// Create a copy of StreakState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakStateImplCopyWith<_$StreakStateImpl> get copyWith =>
      __$$StreakStateImplCopyWithImpl<_$StreakStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakStateImplToJson(
      this,
    );
  }
}

abstract class _StreakState implements StreakState {
  const factory _StreakState({final int nDays, final DateTime? lastCheckIn}) =
      _$StreakStateImpl;

  factory _StreakState.fromJson(Map<String, dynamic> json) =
      _$StreakStateImpl.fromJson;

  @override
  int get nDays;
  @override
  DateTime? get lastCheckIn;

  /// Create a copy of StreakState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakStateImplCopyWith<_$StreakStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
