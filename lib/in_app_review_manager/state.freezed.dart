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

ReviewManagerState _$ReviewManagerStateFromJson(Map<String, dynamic> json) {
  return _ReviewManagerState.fromJson(json);
}

/// @nodoc
mixin _$ReviewManagerState {
  int get nCoinUnlocks => throw _privateConstructorUsedError;
  int get nChapterUnlocks => throw _privateConstructorUsedError;

  /// Serializes this ReviewManagerState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewManagerStateCopyWith<ReviewManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewManagerStateCopyWith<$Res> {
  factory $ReviewManagerStateCopyWith(
          ReviewManagerState value, $Res Function(ReviewManagerState) then) =
      _$ReviewManagerStateCopyWithImpl<$Res, ReviewManagerState>;
  @useResult
  $Res call({int nCoinUnlocks, int nChapterUnlocks});
}

/// @nodoc
class _$ReviewManagerStateCopyWithImpl<$Res, $Val extends ReviewManagerState>
    implements $ReviewManagerStateCopyWith<$Res> {
  _$ReviewManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nCoinUnlocks = null,
    Object? nChapterUnlocks = null,
  }) {
    return _then(_value.copyWith(
      nCoinUnlocks: null == nCoinUnlocks
          ? _value.nCoinUnlocks
          : nCoinUnlocks // ignore: cast_nullable_to_non_nullable
              as int,
      nChapterUnlocks: null == nChapterUnlocks
          ? _value.nChapterUnlocks
          : nChapterUnlocks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewManagerStateImplCopyWith<$Res>
    implements $ReviewManagerStateCopyWith<$Res> {
  factory _$$ReviewManagerStateImplCopyWith(_$ReviewManagerStateImpl value,
          $Res Function(_$ReviewManagerStateImpl) then) =
      __$$ReviewManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nCoinUnlocks, int nChapterUnlocks});
}

/// @nodoc
class __$$ReviewManagerStateImplCopyWithImpl<$Res>
    extends _$ReviewManagerStateCopyWithImpl<$Res, _$ReviewManagerStateImpl>
    implements _$$ReviewManagerStateImplCopyWith<$Res> {
  __$$ReviewManagerStateImplCopyWithImpl(_$ReviewManagerStateImpl _value,
      $Res Function(_$ReviewManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nCoinUnlocks = null,
    Object? nChapterUnlocks = null,
  }) {
    return _then(_$ReviewManagerStateImpl(
      nCoinUnlocks: null == nCoinUnlocks
          ? _value.nCoinUnlocks
          : nCoinUnlocks // ignore: cast_nullable_to_non_nullable
              as int,
      nChapterUnlocks: null == nChapterUnlocks
          ? _value.nChapterUnlocks
          : nChapterUnlocks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewManagerStateImpl implements _ReviewManagerState {
  const _$ReviewManagerStateImpl(
      {this.nCoinUnlocks = 0, this.nChapterUnlocks = 0});

  factory _$ReviewManagerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewManagerStateImplFromJson(json);

  @override
  @JsonKey()
  final int nCoinUnlocks;
  @override
  @JsonKey()
  final int nChapterUnlocks;

  @override
  String toString() {
    return 'ReviewManagerState(nCoinUnlocks: $nCoinUnlocks, nChapterUnlocks: $nChapterUnlocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewManagerStateImpl &&
            (identical(other.nCoinUnlocks, nCoinUnlocks) ||
                other.nCoinUnlocks == nCoinUnlocks) &&
            (identical(other.nChapterUnlocks, nChapterUnlocks) ||
                other.nChapterUnlocks == nChapterUnlocks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nCoinUnlocks, nChapterUnlocks);

  /// Create a copy of ReviewManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewManagerStateImplCopyWith<_$ReviewManagerStateImpl> get copyWith =>
      __$$ReviewManagerStateImplCopyWithImpl<_$ReviewManagerStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewManagerStateImplToJson(
      this,
    );
  }
}

abstract class _ReviewManagerState implements ReviewManagerState {
  const factory _ReviewManagerState(
      {final int nCoinUnlocks,
      final int nChapterUnlocks}) = _$ReviewManagerStateImpl;

  factory _ReviewManagerState.fromJson(Map<String, dynamic> json) =
      _$ReviewManagerStateImpl.fromJson;

  @override
  int get nCoinUnlocks;
  @override
  int get nChapterUnlocks;

  /// Create a copy of ReviewManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewManagerStateImplCopyWith<_$ReviewManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
