import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_type_model.freezed.dart';

@freezed
class AssetTypeModel with _$AssetTypeModel {
  const factory AssetTypeModel(
    int id,
    String typeName,
    String color,
  ) = _AssetTypeModel;
}
