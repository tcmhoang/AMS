// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'detail_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DetailTypesTearOff {
  const _$DetailTypesTearOff();

  TAsset asset(Asset asset) {
    return TAsset(
      asset,
    );
  }

  TUser user(User user) {
    return TUser(
      user,
    );
  }

  TCreation creation(String title) {
    return TCreation(
      title,
    );
  }

  TEmpty empty() {
    return const TEmpty();
  }
}

/// @nodoc
const $DetailTypes = _$DetailTypesTearOff();

/// @nodoc
mixin _$DetailTypes {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Asset asset) asset,
    required TResult Function(User user) user,
    required TResult Function(String title) creation,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Asset asset)? asset,
    TResult Function(User user)? user,
    TResult Function(String title)? creation,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TAsset value) asset,
    required TResult Function(TUser value) user,
    required TResult Function(TCreation value) creation,
    required TResult Function(TEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TAsset value)? asset,
    TResult Function(TUser value)? user,
    TResult Function(TCreation value)? creation,
    TResult Function(TEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTypesCopyWith<$Res> {
  factory $DetailTypesCopyWith(
          DetailTypes value, $Res Function(DetailTypes) then) =
      _$DetailTypesCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailTypesCopyWithImpl<$Res> implements $DetailTypesCopyWith<$Res> {
  _$DetailTypesCopyWithImpl(this._value, this._then);

  final DetailTypes _value;
  // ignore: unused_field
  final $Res Function(DetailTypes) _then;
}

/// @nodoc
abstract class $TAssetCopyWith<$Res> {
  factory $TAssetCopyWith(TAsset value, $Res Function(TAsset) then) =
      _$TAssetCopyWithImpl<$Res>;
  $Res call({Asset asset});
}

/// @nodoc
class _$TAssetCopyWithImpl<$Res> extends _$DetailTypesCopyWithImpl<$Res>
    implements $TAssetCopyWith<$Res> {
  _$TAssetCopyWithImpl(TAsset _value, $Res Function(TAsset) _then)
      : super(_value, (v) => _then(v as TAsset));

  @override
  TAsset get _value => super._value as TAsset;

  @override
  $Res call({
    Object? asset = freezed,
  }) {
    return _then(TAsset(
      asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset,
    ));
  }
}

/// @nodoc

class _$TAsset implements TAsset {
  const _$TAsset(this.asset);

  @override
  final Asset asset;

  @override
  String toString() {
    return 'DetailTypes.asset(asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TAsset &&
            (identical(other.asset, asset) ||
                const DeepCollectionEquality().equals(other.asset, asset)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(asset);

  @JsonKey(ignore: true)
  @override
  $TAssetCopyWith<TAsset> get copyWith =>
      _$TAssetCopyWithImpl<TAsset>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Asset asset) asset,
    required TResult Function(User user) user,
    required TResult Function(String title) creation,
    required TResult Function() empty,
  }) {
    return asset(this.asset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Asset asset)? asset,
    TResult Function(User user)? user,
    TResult Function(String title)? creation,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this.asset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TAsset value) asset,
    required TResult Function(TUser value) user,
    required TResult Function(TCreation value) creation,
    required TResult Function(TEmpty value) empty,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TAsset value)? asset,
    TResult Function(TUser value)? user,
    TResult Function(TCreation value)? creation,
    TResult Function(TEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }
}

abstract class TAsset implements DetailTypes {
  const factory TAsset(Asset asset) = _$TAsset;

  Asset get asset => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TAssetCopyWith<TAsset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TUserCopyWith<$Res> {
  factory $TUserCopyWith(TUser value, $Res Function(TUser) then) =
      _$TUserCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$TUserCopyWithImpl<$Res> extends _$DetailTypesCopyWithImpl<$Res>
    implements $TUserCopyWith<$Res> {
  _$TUserCopyWithImpl(TUser _value, $Res Function(TUser) _then)
      : super(_value, (v) => _then(v as TUser));

  @override
  TUser get _value => super._value as TUser;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(TUser(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$TUser implements TUser {
  const _$TUser(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'DetailTypes.user(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TUser &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $TUserCopyWith<TUser> get copyWith =>
      _$TUserCopyWithImpl<TUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Asset asset) asset,
    required TResult Function(User user) user,
    required TResult Function(String title) creation,
    required TResult Function() empty,
  }) {
    return user(this.user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Asset asset)? asset,
    TResult Function(User user)? user,
    TResult Function(String title)? creation,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this.user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TAsset value) asset,
    required TResult Function(TUser value) user,
    required TResult Function(TCreation value) creation,
    required TResult Function(TEmpty value) empty,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TAsset value)? asset,
    TResult Function(TUser value)? user,
    TResult Function(TCreation value)? creation,
    TResult Function(TEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class TUser implements DetailTypes {
  const factory TUser(User user) = _$TUser;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TUserCopyWith<TUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TCreationCopyWith<$Res> {
  factory $TCreationCopyWith(TCreation value, $Res Function(TCreation) then) =
      _$TCreationCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$TCreationCopyWithImpl<$Res> extends _$DetailTypesCopyWithImpl<$Res>
    implements $TCreationCopyWith<$Res> {
  _$TCreationCopyWithImpl(TCreation _value, $Res Function(TCreation) _then)
      : super(_value, (v) => _then(v as TCreation));

  @override
  TCreation get _value => super._value as TCreation;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(TCreation(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TCreation implements TCreation {
  const _$TCreation(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'DetailTypes.creation(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TCreation &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  $TCreationCopyWith<TCreation> get copyWith =>
      _$TCreationCopyWithImpl<TCreation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Asset asset) asset,
    required TResult Function(User user) user,
    required TResult Function(String title) creation,
    required TResult Function() empty,
  }) {
    return creation(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Asset asset)? asset,
    TResult Function(User user)? user,
    TResult Function(String title)? creation,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (creation != null) {
      return creation(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TAsset value) asset,
    required TResult Function(TUser value) user,
    required TResult Function(TCreation value) creation,
    required TResult Function(TEmpty value) empty,
  }) {
    return creation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TAsset value)? asset,
    TResult Function(TUser value)? user,
    TResult Function(TCreation value)? creation,
    TResult Function(TEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (creation != null) {
      return creation(this);
    }
    return orElse();
  }
}

abstract class TCreation implements DetailTypes {
  const factory TCreation(String title) = _$TCreation;

  String get title => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TCreationCopyWith<TCreation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TEmptyCopyWith<$Res> {
  factory $TEmptyCopyWith(TEmpty value, $Res Function(TEmpty) then) =
      _$TEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$TEmptyCopyWithImpl<$Res> extends _$DetailTypesCopyWithImpl<$Res>
    implements $TEmptyCopyWith<$Res> {
  _$TEmptyCopyWithImpl(TEmpty _value, $Res Function(TEmpty) _then)
      : super(_value, (v) => _then(v as TEmpty));

  @override
  TEmpty get _value => super._value as TEmpty;
}

/// @nodoc

class _$TEmpty implements TEmpty {
  const _$TEmpty();

  @override
  String toString() {
    return 'DetailTypes.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Asset asset) asset,
    required TResult Function(User user) user,
    required TResult Function(String title) creation,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Asset asset)? asset,
    TResult Function(User user)? user,
    TResult Function(String title)? creation,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TAsset value) asset,
    required TResult Function(TUser value) user,
    required TResult Function(TCreation value) creation,
    required TResult Function(TEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TAsset value)? asset,
    TResult Function(TUser value)? user,
    TResult Function(TCreation value)? creation,
    TResult Function(TEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class TEmpty implements DetailTypes {
  const factory TEmpty() = _$TEmpty;
}
