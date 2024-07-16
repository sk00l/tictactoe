// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      photoUrl: json['photoUrl'] as String?,
      winScore: (json['winScore'] as num?)?.toInt(),
      loseScore: (json['loseScore'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'winScore': instance.winScore,
      'loseScore': instance.loseScore,
    };
