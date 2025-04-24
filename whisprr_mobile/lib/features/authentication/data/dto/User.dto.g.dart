// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      conversationsListId: json['conversationsListId'] as String?,
      conversationsId: json['conversationsId'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'conversationsListId': instance.conversationsListId,
      'conversationsId': instance.conversationsId,
    };
