// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiResponse.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiResponseDtoImpl _$$AiResponseDtoImplFromJson(Map<String, dynamic> json) =>
    _$AiResponseDtoImpl(
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AiResponseDtoImplToJson(_$AiResponseDtoImpl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
