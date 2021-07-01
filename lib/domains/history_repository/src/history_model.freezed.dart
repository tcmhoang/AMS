// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HistoryModelTearOff {
  const _$HistoryModelTearOff();

  _HistoryModel call(
      int userId, String tag, DateTime startDate, DateTime endDate) {
    return _HistoryModel(
      userId,
      tag,
      startDate,
      endDate,
    );
  }
}

/// @nodoc
const $HistoryModel = _$HistoryModelTearOff();

/// @nodoc
mixin _$HistoryModel {
  int get userId => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call({int userId, String tag, DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? tag = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$HistoryModelCopyWith(
          _HistoryModel value, $Res Function(_HistoryModel) then) =
      __$HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({int userId, String tag, DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$HistoryModelCopyWithImpl<$Res> extends _$HistoryModelCopyWithImpl<$Res>
    implements _$HistoryModelCopyWith<$Res> {
  __$HistoryModelCopyWithImpl(
      _HistoryModel _value, $Res Function(_HistoryModel) _then)
      : super(_value, (v) => _then(v as _HistoryModel));

  @override
  _HistoryModel get _value => super._value as _HistoryModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? tag = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_HistoryModel(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_HistoryModel implements _HistoryModel {
  const _$_HistoryModel(this.userId, this.tag, this.startDate, this.endDate);

  @override
  final int userId;
  @override
  final String tag;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'HistoryModel(userId: $userId, tag: $tag, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HistoryModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(tag) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate);

  @JsonKey(ignore: true)
  @override
  _$HistoryModelCopyWith<_HistoryModel> get copyWith =>
      __$HistoryModelCopyWithImpl<_HistoryModel>(this, _$identity);
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
          int userId, String tag, DateTime startDate, DateTime endDate) =
      _$_HistoryModel;

  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get tag => throw _privateConstructorUsedError;
  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HistoryModelCopyWith<_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
