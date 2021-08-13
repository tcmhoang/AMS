// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return _Record.fromJson(json);
}

/// @nodoc
class _$RecordTearOff {
  const _$RecordTearOff();

  _Record call(
      {required int id,
      required int userId,
      required String assetTag,
      required int strPeriod,
      required int endPeriod}) {
    return _Record(
      id: id,
      userId: userId,
      assetTag: assetTag,
      strPeriod: strPeriod,
      endPeriod: endPeriod,
    );
  }

  Record fromJson(Map<String, Object> json) {
    return Record.fromJson(json);
  }
}

/// @nodoc
const $Record = _$RecordTearOff();

/// @nodoc
mixin _$Record {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get assetTag => throw _privateConstructorUsedError;
  int get strPeriod => throw _privateConstructorUsedError;
  int get endPeriod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordCopyWith<Record> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res>;
  $Res call(
      {int id, int userId, String assetTag, int strPeriod, int endPeriod});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res> implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  final Record _value;
  // ignore: unused_field
  final $Res Function(Record) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? assetTag = freezed,
    Object? strPeriod = freezed,
    Object? endPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetTag: assetTag == freezed
          ? _value.assetTag
          : assetTag // ignore: cast_nullable_to_non_nullable
              as String,
      strPeriod: strPeriod == freezed
          ? _value.strPeriod
          : strPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      endPeriod: endPeriod == freezed
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$RecordCopyWith(_Record value, $Res Function(_Record) then) =
      __$RecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, int userId, String assetTag, int strPeriod, int endPeriod});
}

/// @nodoc
class __$RecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$RecordCopyWith<$Res> {
  __$RecordCopyWithImpl(_Record _value, $Res Function(_Record) _then)
      : super(_value, (v) => _then(v as _Record));

  @override
  _Record get _value => super._value as _Record;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? assetTag = freezed,
    Object? strPeriod = freezed,
    Object? endPeriod = freezed,
  }) {
    return _then(_Record(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetTag: assetTag == freezed
          ? _value.assetTag
          : assetTag // ignore: cast_nullable_to_non_nullable
              as String,
      strPeriod: strPeriod == freezed
          ? _value.strPeriod
          : strPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      endPeriod: endPeriod == freezed
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Record implements _Record {
  const _$_Record(
      {required this.id,
      required this.userId,
      required this.assetTag,
      required this.strPeriod,
      required this.endPeriod});

  factory _$_Record.fromJson(Map<String, dynamic> json) =>
      _$_$_RecordFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String assetTag;
  @override
  final int strPeriod;
  @override
  final int endPeriod;

  @override
  String toString() {
    return 'Record(id: $id, userId: $userId, assetTag: $assetTag, strPeriod: $strPeriod, endPeriod: $endPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Record &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.assetTag, assetTag) ||
                const DeepCollectionEquality()
                    .equals(other.assetTag, assetTag)) &&
            (identical(other.strPeriod, strPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.strPeriod, strPeriod)) &&
            (identical(other.endPeriod, endPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.endPeriod, endPeriod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(assetTag) ^
      const DeepCollectionEquality().hash(strPeriod) ^
      const DeepCollectionEquality().hash(endPeriod);

  @JsonKey(ignore: true)
  @override
  _$RecordCopyWith<_Record> get copyWith =>
      __$RecordCopyWithImpl<_Record>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecordToJson(this);
  }
}

abstract class _Record implements Record {
  const factory _Record(
      {required int id,
      required int userId,
      required String assetTag,
      required int strPeriod,
      required int endPeriod}) = _$_Record;

  factory _Record.fromJson(Map<String, dynamic> json) = _$_Record.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get assetTag => throw _privateConstructorUsedError;
  @override
  int get strPeriod => throw _privateConstructorUsedError;
  @override
  int get endPeriod => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecordCopyWith<_Record> get copyWith => throw _privateConstructorUsedError;
}
