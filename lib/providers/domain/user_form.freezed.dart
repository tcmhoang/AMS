// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserFormTearOff {
  const _$UserFormTearOff();

  _UserForm call(String name) {
    return _UserForm(
      name,
    );
  }
}

/// @nodoc
const $UserForm = _$UserFormTearOff();

/// @nodoc
mixin _$UserForm {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFormCopyWith<UserForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormCopyWith<$Res> {
  factory $UserFormCopyWith(UserForm value, $Res Function(UserForm) then) =
      _$UserFormCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$UserFormCopyWithImpl<$Res> implements $UserFormCopyWith<$Res> {
  _$UserFormCopyWithImpl(this._value, this._then);

  final UserForm _value;
  // ignore: unused_field
  final $Res Function(UserForm) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserFormCopyWith<$Res> implements $UserFormCopyWith<$Res> {
  factory _$UserFormCopyWith(_UserForm value, $Res Function(_UserForm) then) =
      __$UserFormCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$UserFormCopyWithImpl<$Res> extends _$UserFormCopyWithImpl<$Res>
    implements _$UserFormCopyWith<$Res> {
  __$UserFormCopyWithImpl(_UserForm _value, $Res Function(_UserForm) _then)
      : super(_value, (v) => _then(v as _UserForm));

  @override
  _UserForm get _value => super._value as _UserForm;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_UserForm(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserForm with DiagnosticableTreeMixin implements _UserForm {
  const _$_UserForm(this.name);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserForm(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserForm'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserForm &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$UserFormCopyWith<_UserForm> get copyWith =>
      __$UserFormCopyWithImpl<_UserForm>(this, _$identity);
}

abstract class _UserForm implements UserForm {
  const factory _UserForm(String name) = _$_UserForm;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserFormCopyWith<_UserForm> get copyWith =>
      throw _privateConstructorUsedError;
}
