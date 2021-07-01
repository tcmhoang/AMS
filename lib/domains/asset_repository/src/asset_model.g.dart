// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Asset _$_$AssetFromJson(Map<String, dynamic> json) {
  return _$Asset(
    json['tag'] as String,
    json['name'] as String,
    json['type'] as String,
    json['make'] as String,
    json['serial'] as String,
    json['created'] as int,
    json['lastUpdated'] as int,
    json['condition'] as String,
    json['manageBy'] as String,
    json['urlImage'] as String,
    json['timesUsed'] as int,
    (json['originalPrice'] as num).toDouble(),
    json['isAssigned'] as int,
  );
}

Map<String, dynamic> _$_$AssetToJson(_$Asset instance) => <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'type': instance.type,
      'make': instance.make,
      'serial': instance.serial,
      'created': instance.created,
      'lastUpdated': instance.lastUpdated,
      'condition': instance.condition,
      'manageBy': instance.manageBy,
      'urlImage': instance.urlImage,
      'timesUsed': instance.timesUsed,
      'originalPrice': instance.originalPrice,
      'isAssigned': instance.isAssigned,
    };
