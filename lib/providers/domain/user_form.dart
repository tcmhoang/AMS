import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_form.freezed.dart';

@freezed
class UserForm with _$UserForm {
  const factory UserForm(String name) = _UserForm;
}
