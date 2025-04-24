import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whisprr_mobile/features/chat/data/dto/Candidate.dto.dart';
import 'package:whisprr_mobile/features/chat/domain/vo/AiResponse.vo.dart';

part 'AiResponse.dto.freezed.dart';
part 'AiResponse.dto.g.dart';

@freezed
class AiResponseDto with _$AiResponseDto {
  const factory AiResponseDto({
    List<CandidateDto>? candidates,
  }) = _AiResponseDto;

  const AiResponseDto._();

  factory AiResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AiResponseDtoFromJson(json);

  factory AiResponseDto.fromDomain(AiResponseVo vo) {
    return AiResponseDto(
      candidates:
          vo.candidates?.map((x) => CandidateDto.fromDomain(x)).toList(),
    );
  }
  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'candidates': candidates,
    };
  }
}
