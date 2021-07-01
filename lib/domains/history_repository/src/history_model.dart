import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_model.freezed.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel(
    int userId,
    String tag,
    DateTime startDate,
    DateTime endDate,
  ) = _HistoryModel;
}
