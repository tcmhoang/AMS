// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return User.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  User call(int userId, String fullName, int dob, int gender, String address,
      String urlImage) {
    return User(
      userId,
      fullName,
      dob,
      gender,
      address,
      urlImage,
    );
  }

  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  int get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  int get dob => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get urlImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {int userId,
      String fullName,
      int dob,
      int gender,
      String address,
      String urlImage});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? fullName = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? urlImage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage: urlImage == freezed
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $UserCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int userId,
      String fullName,
      int dob,
      int gender,
      String address,
      String urlImage});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(User _value, $Res Function(User) _then)
      : super(_value, (v) => _then(v as User));

  @override
  User get _value => super._value as User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? fullName = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? urlImage = freezed,
  }) {
    return _then(User(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int,
      gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      urlImage == freezed
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User with DiagnosticableTreeMixin implements User {
  const _$User(this.userId, this.fullName, this.dob, this.gender, this.address,
      this.urlImage);

  factory _$User.fromJson(Map<String, dynamic> json) => _$_$UserFromJson(json);

  @override
  final int userId;
  @override
  final String fullName;
  @override
  final int dob;
  @override
  final int gender;
  @override
  final String address;
  @override
  final String urlImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(userId: $userId, fullName: $fullName, dob: $dob, gender: $gender, address: $address, urlImage: $urlImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('dob', dob))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('urlImage', urlImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.dob, dob) ||
                const DeepCollectionEquality().equals(other.dob, dob)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.urlImage, urlImage) ||
                const DeepCollectionEquality()
                    .equals(other.urlImage, urlImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(dob) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(urlImage);

  @JsonKey(ignore: true)
  @override
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$UserToJson(this);
  }
}

abstract class User implements UserModel {
  const factory User(int userId, String fullName, int dob, int gender,
      String address, String urlImage) = _$User;

  factory User.fromJson(Map<String, dynamic> json) = _$User.fromJson;

  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  int get dob => throw _privateConstructorUsedError;
  @override
  int get gender => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get urlImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}
