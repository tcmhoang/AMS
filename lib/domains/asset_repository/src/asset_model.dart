import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel(
    String tag,
    String name,
    String make,
    int created,
    int lastUpdated,
    String condition,
    String urlImage,
    double originalPrice,
    int isAssigned,
    String typeName,
    int userId,
  ) = Asset;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}
