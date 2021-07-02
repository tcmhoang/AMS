import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel(
    String tag,
    String name,
    String type,
    String make,
    String serial,
    int created,
    int lastUpdated,
    String condition,
    String manageBy,
    String urlImage,
    int timesUsed,
    double originalPrice,
    int isAssigned,
  ) = Asset;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}
