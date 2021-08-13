// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAsset _$UserAssetFromJson(Map<String, dynamic> json) {
  return _UserAsset.fromJson(json);
}

/// @nodoc
class _$UserAssetTearOff {
  const _$UserAssetTearOff();

  _UserAsset call({required int userId, required String assetTag}) {
    return _UserAsset(
      userId: userId,
      assetTag: assetTag,
    );
  }

  UserAsset fromJson(Map<String, Object> json) {
    return UserAsset.fromJson(json);
  }
}

/// @nodoc
const $UserAsset = _$UserAssetTearOff();

/// @nodoc
mixin _$UserAsset {
  int get userId => throw _privateConstructorUsedError;
  String get assetTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAssetCopyWith<UserAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAssetCopyWith<$Res> {
  factory $UserAssetCopyWith(UserAsset value, $Res Function(UserAsset) then) =
      _$UserAssetCopyWithImpl<$Res>;
  $Res call({int userId, String assetTag});
}

/// @nodoc
class _$UserAssetCopyWithImpl<$Res> implements $UserAssetCopyWith<$Res> {
  _$UserAssetCopyWithImpl(this._value, this._then);

  final UserAsset _value;
  // ignore: unused_field
  final $Res Function(UserAsset) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? assetTag = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetTag: assetTag == freezed
          ? _value.assetTag
          : assetTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserAssetCopyWith<$Res> implements $UserAssetCopyWith<$Res> {
  factory _$UserAssetCopyWith(
          _UserAsset value, $Res Function(_UserAsset) then) =
      __$UserAssetCopyWithImpl<$Res>;
  @override
  $Res call({int userId, String assetTag});
}

/// @nodoc
class __$UserAssetCopyWithImpl<$Res> extends _$UserAssetCopyWithImpl<$Res>
    implements _$UserAssetCopyWith<$Res> {
  __$UserAssetCopyWithImpl(_UserAsset _value, $Res Function(_UserAsset) _then)
      : super(_value, (v) => _then(v as _UserAsset));

  @override
  _UserAsset get _value => super._value as _UserAsset;

  @override
  $Res call({
    Object? userId = freezed,
    Object? assetTag = freezed,
  }) {
    return _then(_UserAsset(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      assetTag: assetTag == freezed
          ? _value.assetTag
          : assetTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserAsset implements _UserAsset {
  const _$_UserAsset({required this.userId, required this.assetTag});

  factory _$_UserAsset.fromJson(Map<String, dynamic> json) =>
      _$_$_UserAssetFromJson(json);

  @override
  final int userId;
  @override
  final String assetTag;

  @override
  String toString() {
    return 'UserAsset(userId: $userId, assetTag: $assetTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserAsset &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.assetTag, assetTag) ||
                const DeepCollectionEquality()
                    .equals(other.assetTag, assetTag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(assetTag);

  @JsonKey(ignore: true)
  @override
  _$UserAssetCopyWith<_UserAsset> get copyWith =>
      __$UserAssetCopyWithImpl<_UserAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserAssetToJson(this);
  }
}

abstract class _UserAsset implements UserAsset {
  const factory _UserAsset({required int userId, required String assetTag}) =
      _$_UserAsset;

  factory _UserAsset.fromJson(Map<String, dynamic> json) =
      _$_UserAsset.fromJson;

  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get assetTag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserAssetCopyWith<_UserAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
