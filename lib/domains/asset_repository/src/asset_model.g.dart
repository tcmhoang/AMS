// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Asset _$_$AssetFromJson(Map<String, dynamic> json) {
  return _$Asset(
    json['tag'] as String,
    json['name'] as String,
    json['make'] as String,
    json['created'] as int,
    json['lastUpdated'] as int,
    json['condition'] as String,
    json['urlImage'] as String,
    (json['originalPrice'] as num).toDouble(),
    json['isAssigned'] as int,
    json['typeName'] as String,
    json['userId'] as int,
  );
}

Map<String, dynamic> _$_$AssetToJson(_$Asset instance) => <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'make': instance.make,
      'created': instance.created,
      'lastUpdated': instance.lastUpdated,
      'condition': instance.condition,
      'urlImage': instance.urlImage,
      'originalPrice': instance.originalPrice,
      'isAssigned': instance.isAssigned,
      'typeName': instance.typeName,
      'userId': instance.userId,
    };
