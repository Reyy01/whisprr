import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whisprr_mobile/features/chat/domain/vo/Candidate.vo.dart';

part 'Candidate.dto.freezed.dart';
part 'Candidate.dto.g.dart';

@freezed
class CandidateDto with _$CandidateDto {
  const factory CandidateDto({
    ContentDto? content,
    String? finishReason,
  }) = _CandidateDto;

  const CandidateDto._();

  factory CandidateDto.fromJson(Map<String, dynamic> json) =>
      _$CandidateDtoFromJson(json);

  factory CandidateDto.fromDomain(CandidateVo vo) {
    return CandidateDto(
      content: vo.content,
      finishReason: vo.finishReason,
    );
  }
  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'content': content,
      'finishReason': finishReason,
    };
  }
}
