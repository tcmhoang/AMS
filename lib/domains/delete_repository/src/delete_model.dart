import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_model.freezed.dart';

@freezed
class DeleteModel with _$DeleteModel {
  const factory DeleteModel(
    String tag,
    DateTime deleteDate,
  ) = _DeleteModel;
}
