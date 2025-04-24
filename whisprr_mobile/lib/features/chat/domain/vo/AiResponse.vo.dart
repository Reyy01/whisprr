import 'package:equatable/equatable.dart';
import 'package:whisprr_mobile/core/logic/guard.dart';
import 'package:whisprr_mobile/core/logic/result.dart';
import 'package:whisprr_mobile/features/chat/data/dto/AiResponse.dto.dart';
import 'package:whisprr_mobile/features/chat/data/dto/Candidate.dto.dart';
import 'package:whisprr_mobile/features/chat/domain/vo/Candidate.vo.dart';

class AiResponseVo extends Equatable {
  const AiResponseVo({
    this.candidates,
  });

  final List<CandidateVo>? candidates;

  @override
  List<Object?> get props => <dynamic>[
        candidates,
      ];

  static Result<AiResponseVo> create(AiResponseDto dto) {
    final List<CandidateVo> candidates = <CandidateVo>[];

    if (dto.candidates != null) {
      for (final CandidateDto messagesValueDto in dto.candidates!) {
        final Result<CandidateVo> voOrError =
            CandidateVo.create(messagesValueDto);

        if (voOrError.isFailure) {
          return Result<AiResponseVo>.fail(error: voOrError.getError);
        }

        candidates.add(voOrError.getValue);
      }
    }

    final GuardResult guardResult = Guard.combine(<GuardResult>[
      Guard.againstNullOrUndefined(dto.candidates, 'Candidates'),
    ]);

    if (!guardResult.succeeded) {
      return Result<AiResponseVo>.fail(error: guardResult.message);
    } else {
      return Result<AiResponseVo>.ok(
          data: AiResponseVo(
        candidates: candidates,
      ));
    }
  }
}
