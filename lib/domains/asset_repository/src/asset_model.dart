import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel(
      String tag, String name, String type, String make, String serial,
      {DateTime? created,
      DateTime? lastupdated,
      String? condition,
      String? manageBy,
      int? timesUsed,
      bool? isAssigned}) = _AssetModel;
}
