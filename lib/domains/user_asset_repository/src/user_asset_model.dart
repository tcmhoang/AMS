import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_asset_model.freezed.dart';
part 'user_asset_model.g.dart';

@freezed
class UserAsset with _$UserAsset {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserAsset({
    required int userId,
    required String assetTag,
  }) = _UserAsset;

  factory UserAsset.fromJson(Map<String, dynamic> json) =>
      _$UserAssetFromJson(json);
}
