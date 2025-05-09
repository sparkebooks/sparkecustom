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

/// @nodoc
mixin _$UiState {
  DataStatus get dataStatus => throw _privateConstructorUsedError;
  Object? get dataError => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiStateCopyWith<UiState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiStateCopyWith<$Res> {
  factory $UiStateCopyWith(UiState value, $Res Function(UiState) then) =
      _$UiStateCopyWithImpl<$Res, UiState>;
  @useResult
  $Res call({DataStatus dataStatus, Object? dataError, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UiStateCopyWithImpl<$Res, $Val extends UiState>
    implements $UiStateCopyWith<$Res> {
  _$UiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStatus = null,
    Object? dataError = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      dataError: freezed == dataError ? _value.dataError : dataError,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UiStateImplCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$UiStateImplCopyWith(
          _$UiStateImpl value, $Res Function(_$UiStateImpl) then) =
      __$$UiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStatus dataStatus, Object? dataError, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UiStateImplCopyWithImpl<$Res>
    extends _$UiStateCopyWithImpl<$Res, _$UiStateImpl>
    implements _$$UiStateImplCopyWith<$Res> {
  __$$UiStateImplCopyWithImpl(
      _$UiStateImpl _value, $Res Function(_$UiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStatus = null,
    Object? dataError = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UiStateImpl(
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      dataError: freezed == dataError ? _value.dataError : dataError,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc

class _$UiStateImpl implements _UiState {
  const _$UiStateImpl({required this.dataStatus, this.dataError, this.data});

  @override
  final DataStatus dataStatus;
  @override
  final Object? dataError;
  @override
  final Data? data;

  @override
  String toString() {
    return 'UiState(dataStatus: $dataStatus, dataError: $dataError, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiStateImpl &&
            (identical(other.dataStatus, dataStatus) ||
                other.dataStatus == dataStatus) &&
            const DeepCollectionEquality().equals(other.dataError, dataError) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataStatus,
      const DeepCollectionEquality().hash(dataError), data);

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiStateImplCopyWith<_$UiStateImpl> get copyWith =>
      __$$UiStateImplCopyWithImpl<_$UiStateImpl>(this, _$identity);
}

abstract class _UiState implements UiState {
  const factory _UiState(
      {required final DataStatus dataStatus,
      final Object? dataError,
      final Data? data}) = _$UiStateImpl;

  @override
  DataStatus get dataStatus;
  @override
  Object? get dataError;
  @override
  Data? get data;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiStateImplCopyWith<_$UiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Data {
  int get coinBalance => throw _privateConstructorUsedError;
  bool get isAnonymousUser => throw _privateConstructorUsedError;
  StreakData get streakData => throw _privateConstructorUsedError;
  Map<SocialMedia, bool> get isConnectedOnSocialMediaMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {int coinBalance,
      bool isAnonymousUser,
      StreakData streakData,
      Map<SocialMedia, bool> isConnectedOnSocialMediaMap});

  $StreakDataCopyWith<$Res> get streakData;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinBalance = null,
    Object? isAnonymousUser = null,
    Object? streakData = null,
    Object? isConnectedOnSocialMediaMap = null,
  }) {
    return _then(_value.copyWith(
      coinBalance: null == coinBalance
          ? _value.coinBalance
          : coinBalance // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymousUser: null == isAnonymousUser
          ? _value.isAnonymousUser
          : isAnonymousUser // ignore: cast_nullable_to_non_nullable
              as bool,
      streakData: null == streakData
          ? _value.streakData
          : streakData // ignore: cast_nullable_to_non_nullable
              as StreakData,
      isConnectedOnSocialMediaMap: null == isConnectedOnSocialMediaMap
          ? _value.isConnectedOnSocialMediaMap
          : isConnectedOnSocialMediaMap // ignore: cast_nullable_to_non_nullable
              as Map<SocialMedia, bool>,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreakDataCopyWith<$Res> get streakData {
    return $StreakDataCopyWith<$Res>(_value.streakData, (value) {
      return _then(_value.copyWith(streakData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int coinBalance,
      bool isAnonymousUser,
      StreakData streakData,
      Map<SocialMedia, bool> isConnectedOnSocialMediaMap});

  @override
  $StreakDataCopyWith<$Res> get streakData;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinBalance = null,
    Object? isAnonymousUser = null,
    Object? streakData = null,
    Object? isConnectedOnSocialMediaMap = null,
  }) {
    return _then(_$DataImpl(
      coinBalance: null == coinBalance
          ? _value.coinBalance
          : coinBalance // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymousUser: null == isAnonymousUser
          ? _value.isAnonymousUser
          : isAnonymousUser // ignore: cast_nullable_to_non_nullable
              as bool,
      streakData: null == streakData
          ? _value.streakData
          : streakData // ignore: cast_nullable_to_non_nullable
              as StreakData,
      isConnectedOnSocialMediaMap: null == isConnectedOnSocialMediaMap
          ? _value._isConnectedOnSocialMediaMap
          : isConnectedOnSocialMediaMap // ignore: cast_nullable_to_non_nullable
              as Map<SocialMedia, bool>,
    ));
  }
}

/// @nodoc

class _$DataImpl implements _Data {
  const _$DataImpl(
      {required this.coinBalance,
      required this.isAnonymousUser,
      required this.streakData,
      required final Map<SocialMedia, bool> isConnectedOnSocialMediaMap})
      : _isConnectedOnSocialMediaMap = isConnectedOnSocialMediaMap;

  @override
  final int coinBalance;
  @override
  final bool isAnonymousUser;
  @override
  final StreakData streakData;
  final Map<SocialMedia, bool> _isConnectedOnSocialMediaMap;
  @override
  Map<SocialMedia, bool> get isConnectedOnSocialMediaMap {
    if (_isConnectedOnSocialMediaMap is EqualUnmodifiableMapView)
      return _isConnectedOnSocialMediaMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isConnectedOnSocialMediaMap);
  }

  @override
  String toString() {
    return 'Data(coinBalance: $coinBalance, isAnonymousUser: $isAnonymousUser, streakData: $streakData, isConnectedOnSocialMediaMap: $isConnectedOnSocialMediaMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.coinBalance, coinBalance) ||
                other.coinBalance == coinBalance) &&
            (identical(other.isAnonymousUser, isAnonymousUser) ||
                other.isAnonymousUser == isAnonymousUser) &&
            (identical(other.streakData, streakData) ||
                other.streakData == streakData) &&
            const DeepCollectionEquality().equals(
                other._isConnectedOnSocialMediaMap,
                _isConnectedOnSocialMediaMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      coinBalance,
      isAnonymousUser,
      streakData,
      const DeepCollectionEquality().hash(_isConnectedOnSocialMediaMap));

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);
}

abstract class _Data implements Data {
  const factory _Data(
          {required final int coinBalance,
          required final bool isAnonymousUser,
          required final StreakData streakData,
          required final Map<SocialMedia, bool> isConnectedOnSocialMediaMap}) =
      _$DataImpl;

  @override
  int get coinBalance;
  @override
  bool get isAnonymousUser;
  @override
  StreakData get streakData;
  @override
  Map<SocialMedia, bool> get isConnectedOnSocialMediaMap;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StreakData {
  int get nDays => throw _privateConstructorUsedError;
  bool get didCheckInToday => throw _privateConstructorUsedError;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakDataCopyWith<StreakData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakDataCopyWith<$Res> {
  factory $StreakDataCopyWith(
          StreakData value, $Res Function(StreakData) then) =
      _$StreakDataCopyWithImpl<$Res, StreakData>;
  @useResult
  $Res call({int nDays, bool didCheckInToday});
}

/// @nodoc
class _$StreakDataCopyWithImpl<$Res, $Val extends StreakData>
    implements $StreakDataCopyWith<$Res> {
  _$StreakDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nDays = null,
    Object? didCheckInToday = null,
  }) {
    return _then(_value.copyWith(
      nDays: null == nDays
          ? _value.nDays
          : nDays // ignore: cast_nullable_to_non_nullable
              as int,
      didCheckInToday: null == didCheckInToday
          ? _value.didCheckInToday
          : didCheckInToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakDataImplCopyWith<$Res>
    implements $StreakDataCopyWith<$Res> {
  factory _$$StreakDataImplCopyWith(
          _$StreakDataImpl value, $Res Function(_$StreakDataImpl) then) =
      __$$StreakDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nDays, bool didCheckInToday});
}

/// @nodoc
class __$$StreakDataImplCopyWithImpl<$Res>
    extends _$StreakDataCopyWithImpl<$Res, _$StreakDataImpl>
    implements _$$StreakDataImplCopyWith<$Res> {
  __$$StreakDataImplCopyWithImpl(
      _$StreakDataImpl _value, $Res Function(_$StreakDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nDays = null,
    Object? didCheckInToday = null,
  }) {
    return _then(_$StreakDataImpl(
      nDays: null == nDays
          ? _value.nDays
          : nDays // ignore: cast_nullable_to_non_nullable
              as int,
      didCheckInToday: null == didCheckInToday
          ? _value.didCheckInToday
          : didCheckInToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StreakDataImpl implements _StreakData {
  const _$StreakDataImpl({required this.nDays, required this.didCheckInToday});

  @override
  final int nDays;
  @override
  final bool didCheckInToday;

  @override
  String toString() {
    return 'StreakData(nDays: $nDays, didCheckInToday: $didCheckInToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakDataImpl &&
            (identical(other.nDays, nDays) || other.nDays == nDays) &&
            (identical(other.didCheckInToday, didCheckInToday) ||
                other.didCheckInToday == didCheckInToday));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nDays, didCheckInToday);

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      __$$StreakDataImplCopyWithImpl<_$StreakDataImpl>(this, _$identity);
}

abstract class _StreakData implements StreakData {
  const factory _StreakData(
      {required final int nDays,
      required final bool didCheckInToday}) = _$StreakDataImpl;

  @override
  int get nDays;
  @override
  bool get didCheckInToday;

  /// Create a copy of StreakData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
