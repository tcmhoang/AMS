import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';
part 'record_model.g.dart';

@freezed
class Record with _$Record {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Record({
    required int id,
    required int userId,
    required String assetTag,
    required int strPeriod,
    required int endPeriod,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
