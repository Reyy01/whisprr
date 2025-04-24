import 'package:dartz/dartz.dart';
import 'package:whisprr_mobile/core/logic/result.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/RegisterUser.dto.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/User.dto.dart';
import 'package:whisprr_mobile/features/authentication/domain/vo/User.vo.dart';

abstract class AuthRepository {
  Future<Result<UserVo>> loginUser(LoginUserDto loginUserDto);
  Future<Result<UserVo>> googleLogin();
  Future<Result<Unit>> registerUser(RegisterUserDto registerUserDto);
  Future<Result<Unit>> logoutUser();
  Future<Result<UserVo>> getCurrentUser();
  Stream<Result<List<UserDto>>> test();
}
