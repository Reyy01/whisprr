import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whisprr_mobile/features/chat/data/dto/Candidate.dto.dart';
import 'package:whisprr_mobile/features/chat/domain/vo/AiResponse.vo.dart';

part 'AiResponse.dto.freezed.dart';
part 'AiResponse.dto.g.dart';

@freezed
class ContentDto with _$ContentDto {
  const factory ContentDto({
    CandidateDto content,
  }) = _ContentDto;

  const ContentDto._();

  factory ContentDto.fromJson(Map<String, dynamic> json) =>
      _$ContentDtoFromJson(json);

  factory ContentDto.fromDomain(ContentVo vo) {
    return ContentDto(
      content: vo.content,
    );
  }
  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'content': content,
    };
  }
}
