// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'delete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeleteModelTearOff {
  const _$DeleteModelTearOff();

  _DeleteModel call(String tag, DateTime deleteDate) {
    return _DeleteModel(
      tag,
      deleteDate,
    );
  }
}

/// @nodoc
const $DeleteModel = _$DeleteModelTearOff();

/// @nodoc
mixin _$DeleteModel {
  String get tag => throw _privateConstructorUsedError;
  DateTime get deleteDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteModelCopyWith<DeleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteModelCopyWith<$Res> {
  factory $DeleteModelCopyWith(
          DeleteModel value, $Res Function(DeleteModel) then) =
      _$DeleteModelCopyWithImpl<$Res>;
  $Res call({String tag, DateTime deleteDate});
}

/// @nodoc
class _$DeleteModelCopyWithImpl<$Res> implements $DeleteModelCopyWith<$Res> {
  _$DeleteModelCopyWithImpl(this._value, this._then);

  final DeleteModel _value;
  // ignore: unused_field
  final $Res Function(DeleteModel) _then;

  @override
  $Res call({
    Object? tag = freezed,
    Object? deleteDate = freezed,
  }) {
    return _then(_value.copyWith(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      deleteDate: deleteDate == freezed
          ? _value.deleteDate
          : deleteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DeleteModelCopyWith<$Res>
    implements $DeleteModelCopyWith<$Res> {
  factory _$DeleteModelCopyWith(
          _DeleteModel value, $Res Function(_DeleteModel) then) =
      __$DeleteModelCopyWithImpl<$Res>;
  @override
  $Res call({String tag, DateTime deleteDate});
}

/// @nodoc
class __$DeleteModelCopyWithImpl<$Res> extends _$DeleteModelCopyWithImpl<$Res>
    implements _$DeleteModelCopyWith<$Res> {
  __$DeleteModelCopyWithImpl(
      _DeleteModel _value, $Res Function(_DeleteModel) _then)
      : super(_value, (v) => _then(v as _DeleteModel));

  @override
  _DeleteModel get _value => super._value as _DeleteModel;

  @override
  $Res call({
    Object? tag = freezed,
    Object? deleteDate = freezed,
  }) {
    return _then(_DeleteModel(
      tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      deleteDate == freezed
          ? _value.deleteDate
          : deleteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DeleteModel implements _DeleteModel {
  const _$_DeleteModel(this.tag, this.deleteDate);

  @override
  final String tag;
  @override
  final DateTime deleteDate;

  @override
  String toString() {
    return 'DeleteModel(tag: $tag, deleteDate: $deleteDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteModel &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)) &&
            (identical(other.deleteDate, deleteDate) ||
                const DeepCollectionEquality()
                    .equals(other.deleteDate, deleteDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tag) ^
      const DeepCollectionEquality().hash(deleteDate);

  @JsonKey(ignore: true)
  @override
  _$DeleteModelCopyWith<_DeleteModel> get copyWith =>
      __$DeleteModelCopyWithImpl<_DeleteModel>(this, _$identity);
}

abstract class _DeleteModel implements DeleteModel {
  const factory _DeleteModel(String tag, DateTime deleteDate) = _$_DeleteModel;

  @override
  String get tag => throw _privateConstructorUsedError;
  @override
  DateTime get deleteDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeleteModelCopyWith<_DeleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
