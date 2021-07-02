import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_type_model.freezed.dart';
part 'asset_type_model.g.dart';

@freezed
class AssetTypeModel with _$AssetTypeModel {
  const factory AssetTypeModel(
    int typeId,
    String typeName,
    String color,
  ) = AssetType;

  factory AssetTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AssetTypeModelFromJson(json);
}
