// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$User _$_$UserFromJson(Map<String, dynamic> json) {
  return _$User(
    json['id'] as int,
    json['fullName'] as String,
    json['dob'] as int,
    json['gender'] as int,
    json['address'] as String,
    json['urlImage'] as String,
  );
}

Map<String, dynamic> _$_$UserToJson(_$User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'urlImage': instance.urlImage,
    };
