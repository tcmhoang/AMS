// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'asset_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssetTypeModel _$AssetTypeModelFromJson(Map<String, dynamic> json) {
  return AssetType.fromJson(json);
}

/// @nodoc
class _$AssetTypeModelTearOff {
  const _$AssetTypeModelTearOff();

  AssetType call(String typeName, String color) {
    return AssetType(
      typeName,
      color,
    );
  }

  AssetTypeModel fromJson(Map<String, Object> json) {
    return AssetTypeModel.fromJson(json);
  }
}

/// @nodoc
const $AssetTypeModel = _$AssetTypeModelTearOff();

/// @nodoc
mixin _$AssetTypeModel {
  String get typeName => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetTypeModelCopyWith<AssetTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetTypeModelCopyWith<$Res> {
  factory $AssetTypeModelCopyWith(
          AssetTypeModel value, $Res Function(AssetTypeModel) then) =
      _$AssetTypeModelCopyWithImpl<$Res>;
  $Res call({String typeName, String color});
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
    Object? typeName = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class $AssetTypeCopyWith<$Res>
    implements $AssetTypeModelCopyWith<$Res> {
  factory $AssetTypeCopyWith(AssetType value, $Res Function(AssetType) then) =
      _$AssetTypeCopyWithImpl<$Res>;
  @override
  $Res call({String typeName, String color});
}

/// @nodoc
class _$AssetTypeCopyWithImpl<$Res> extends _$AssetTypeModelCopyWithImpl<$Res>
    implements $AssetTypeCopyWith<$Res> {
  _$AssetTypeCopyWithImpl(AssetType _value, $Res Function(AssetType) _then)
      : super(_value, (v) => _then(v as AssetType));

  @override
  AssetType get _value => super._value as AssetType;

  @override
  $Res call({
    Object? typeName = freezed,
    Object? color = freezed,
  }) {
    return _then(AssetType(
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
@JsonSerializable()
class _$AssetType with DiagnosticableTreeMixin implements AssetType {
  const _$AssetType(this.typeName, this.color);

  factory _$AssetType.fromJson(Map<String, dynamic> json) =>
      _$_$AssetTypeFromJson(json);

  @override
  final String typeName;
  @override
  final String color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AssetTypeModel(typeName: $typeName, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AssetTypeModel'))
      ..add(DiagnosticsProperty('typeName', typeName))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssetType &&
            (identical(other.typeName, typeName) ||
                const DeepCollectionEquality()
                    .equals(other.typeName, typeName)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(typeName) ^
      const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  $AssetTypeCopyWith<AssetType> get copyWith =>
      _$AssetTypeCopyWithImpl<AssetType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$AssetTypeToJson(this);
  }
}

abstract class AssetType implements AssetTypeModel {
  const factory AssetType(String typeName, String color) = _$AssetType;

  factory AssetType.fromJson(Map<String, dynamic> json) = _$AssetType.fromJson;

  @override
  String get typeName => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $AssetTypeCopyWith<AssetType> get copyWith =>
      throw _privateConstructorUsedError;
}
