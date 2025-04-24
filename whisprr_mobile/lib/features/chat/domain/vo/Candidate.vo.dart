import 'package:equatable/equatable.dart';
import 'package:whisprr_mobile/core/logic/guard.dart';
import 'package:whisprr_mobile/core/logic/result.dart';
import 'package:whisprr_mobile/features/chat/data/dto/Candidate.dto.dart';

class CandidateVo extends Equatable {
  const CandidateVo({
    this.finishReason,
  });

  final String? finishReason;

  @override
  List<Object?> get props => <dynamic>[
        finishReason,
      ];

  static Result<CandidateVo> create(CandidateDto dto) {
    final GuardResult guardResult = Guard.combine(<GuardResult>[
      Guard.againstNullOrUndefined(dto.finishReason, ''),
    ]);

    if (!guardResult.succeeded) {
      return Result<CandidateVo>.fail(error: guardResult.message);
    } else {
      return Result<CandidateVo>.ok(
          data: CandidateVo(
        finishReason: dto.finishReason,
      ));
    }
  }
}
