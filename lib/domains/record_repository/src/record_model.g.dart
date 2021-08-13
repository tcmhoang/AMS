// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$_$_RecordFromJson(Map<String, dynamic> json) {
  return _$_Record(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    assetTag: json['asset_tag'] as String,
    strPeriod: json['str_period'] as int,
    endPeriod: json['end_period'] as int,
  );
}

Map<String, dynamic> _$_$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'asset_tag': instance.assetTag,
      'str_period': instance.strPeriod,
      'end_period': instance.endPeriod,
    };
