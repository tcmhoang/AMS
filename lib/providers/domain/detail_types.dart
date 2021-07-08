import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domains/asset_repository/src/asset_model.dart';
import '../../domains/user_repository/src/user_model.dart';

part 'detail_types.freezed.dart';

@freezed
class DetailTypes with _$DetailTypes {
  const factory DetailTypes.asset(Asset asset) = TAsset;
  const factory DetailTypes.user(User user) = TUser;
  const factory DetailTypes.creation(String title, Widget content) = TCreation;
  const factory DetailTypes.empty() = TEmpty;
}
