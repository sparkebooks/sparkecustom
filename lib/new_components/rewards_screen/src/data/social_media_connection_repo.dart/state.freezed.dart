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

SocialMediaConnectionState _$SocialMediaConnectionStateFromJson(
    Map<String, dynamic> json) {
  return _SocialMediaConnectionState.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaConnectionState {
  Map<SocialMedia, bool> get data => throw _privateConstructorUsedError;

  /// Serializes this SocialMediaConnectionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialMediaConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialMediaConnectionStateCopyWith<SocialMediaConnectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaConnectionStateCopyWith<$Res> {
  factory $SocialMediaConnectionStateCopyWith(SocialMediaConnectionState value,
          $Res Function(SocialMediaConnectionState) then) =
      _$SocialMediaConnectionStateCopyWithImpl<$Res,
          SocialMediaConnectionState>;
  @useResult
  $Res call({Map<SocialMedia, bool> data});
}

/// @nodoc
class _$SocialMediaConnectionStateCopyWithImpl<$Res,
        $Val extends SocialMediaConnectionState>
    implements $SocialMediaConnectionStateCopyWith<$Res> {
  _$SocialMediaConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialMediaConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<SocialMedia, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaConnectionStateImplCopyWith<$Res>
    implements $SocialMediaConnectionStateCopyWith<$Res> {
  factory _$$SocialMediaConnectionStateImplCopyWith(
          _$SocialMediaConnectionStateImpl value,
          $Res Function(_$SocialMediaConnectionStateImpl) then) =
      __$$SocialMediaConnectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<SocialMedia, bool> data});
}

/// @nodoc
class __$$SocialMediaConnectionStateImplCopyWithImpl<$Res>
    extends _$SocialMediaConnectionStateCopyWithImpl<$Res,
        _$SocialMediaConnectionStateImpl>
    implements _$$SocialMediaConnectionStateImplCopyWith<$Res> {
  __$$SocialMediaConnectionStateImplCopyWithImpl(
      _$SocialMediaConnectionStateImpl _value,
      $Res Function(_$SocialMediaConnectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialMediaConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SocialMediaConnectionStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<SocialMedia, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaConnectionStateImpl implements _SocialMediaConnectionState {
  const _$SocialMediaConnectionStateImpl(
      {final Map<SocialMedia, bool> data = const {}})
      : _data = data;

  factory _$SocialMediaConnectionStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SocialMediaConnectionStateImplFromJson(json);

  final Map<SocialMedia, bool> _data;
  @override
  @JsonKey()
  Map<SocialMedia, bool> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SocialMediaConnectionState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaConnectionStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SocialMediaConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaConnectionStateImplCopyWith<_$SocialMediaConnectionStateImpl>
      get copyWith => __$$SocialMediaConnectionStateImplCopyWithImpl<
          _$SocialMediaConnectionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaConnectionStateImplToJson(
      this,
    );
  }
}

abstract class _SocialMediaConnectionState
    implements SocialMediaConnectionState {
  const factory _SocialMediaConnectionState(
      {final Map<SocialMedia, bool> data}) = _$SocialMediaConnectionStateImpl;

  factory _SocialMediaConnectionState.fromJson(Map<String, dynamic> json) =
      _$SocialMediaConnectionStateImpl.fromJson;

  @override
  Map<SocialMedia, bool> get data;

  /// Create a copy of SocialMediaConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialMediaConnectionStateImplCopyWith<_$SocialMediaConnectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
