// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'asset_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AssetTypeModelTearOff {
  const _$AssetTypeModelTearOff();

  _AssetTypeModel call(int id, String typeName, String color) {
    return _AssetTypeModel(
      id,
      typeName,
      color,
    );
  }
}

/// @nodoc
const $AssetTypeModel = _$AssetTypeModelTearOff();

/// @nodoc
mixin _$AssetTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssetTypeModelCopyWith<AssetTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetTypeModelCopyWith<$Res> {
  factory $AssetTypeModelCopyWith(
          AssetTypeModel value, $Res Function(AssetTypeModel) then) =
      _$AssetTypeModelCopyWithImpl<$Res>;
  $Res call({int id, String typeName, String color});
}

/// @nodoc
class _$AssetTypeModelCopyWithImpl<$Res>
    implements $AssetTypeModelCopyWith<$Res> {
  _$AssetTypeModelCopyWithImpl(this._value, this._then);

  final AssetTypeModel _value;
  // ignore: unused_field
  final $Res Function(AssetTypeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? typeName = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeName: typeName == freezed
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AssetTypeModelCopyWith<$Res>
    implements $AssetTypeModelCopyWith<$Res> {
  factory _$AssetTypeModelCopyWith(
          _AssetTypeModel value, $Res Function(_AssetTypeModel) then) =
      __$AssetTypeModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String typeName, String color});
}

/// @nodoc
class __$AssetTypeModelCopyWithImpl<$Res>
    extends _$AssetTypeModelCopyWithImpl<$Res>
    implements _$AssetTypeModelCopyWith<$Res> {
  __$AssetTypeModelCopyWithImpl(
      _AssetTypeModel _value, $Res Function(_AssetTypeModel) _then)
      : super(_value, (v) => _then(v as _AssetTypeModel));

  @override
  _AssetTypeModel get _value => super._value as _AssetTypeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? typeName = freezed,
    Object? color = freezed,
  }) {
    return _then(_AssetTypeModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeName == freezed
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AssetTypeModel implements _AssetTypeModel {
  const _$_AssetTypeModel(this.id, this.typeName, this.color);

  @override
  final int id;
  @override
  final String typeName;
  @override
  final String color;

  @override
  String toString() {
    return 'AssetTypeModel(id: $id, typeName: $typeName, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AssetTypeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.typeName, typeName) ||
                const DeepCollectionEquality()
                    .equals(other.typeName, typeName)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(typeName) ^
      const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  _$AssetTypeModelCopyWith<_AssetTypeModel> get copyWith =>
      __$AssetTypeModelCopyWithImpl<_AssetTypeModel>(this, _$identity);
}

abstract class _AssetTypeModel implements AssetTypeModel {
  const factory _AssetTypeModel(int id, String typeName, String color) =
      _$_AssetTypeModel;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get typeName => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AssetTypeModelCopyWith<_AssetTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
