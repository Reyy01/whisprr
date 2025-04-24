import 'package:equatable/equatable.dart';
import 'package:whisprr_mobile/core/logic/guard.dart';
import 'package:whisprr_mobile/core/logic/result.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/User.dto.dart';

class UserVo extends Equatable {
  const UserVo({
    this.uid,
    this.name,
    this.email,
    this.conversationsListId,
    this.conversationsId,
  });

  final String? uid;
  final String? name;
  final String? email;
  final String? conversationsListId;
  final String? conversationsId;

  @override
  List<Object?> get props => <dynamic>[uid, name];

  static Result<UserVo> create(UserDto dto) {
    final GuardResult guardResult = Guard.combine(<GuardResult>[
      Guard.againstNullOrUndefined(dto.uid, 'User Uid'),
      Guard.againstNullOrUndefined(dto.name, 'User Name'),
    ]);

    if (!guardResult.succeeded) {
      return Result<UserVo>.fail(error: guardResult.message);
    } else {
      return Result<UserVo>.ok(
          data: UserVo(
        uid: dto.uid,
        name: dto.name,
        email: dto.email,
        conversationsListId: dto.conversationsListId,
        conversationsId: dto.conversationsId,
      ));
    }
  }
}
