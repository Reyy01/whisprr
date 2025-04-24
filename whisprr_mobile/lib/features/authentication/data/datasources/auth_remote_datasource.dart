import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/config.dart';
import 'package:whisprr_mobile/core/logic/server_exception.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/RegisterUser.dto.dart';
import 'package:whisprr_mobile/features/authentication/data/dto/User.dto.dart';
import 'package:whisprr_mobile/features/authentication/domain/vo/User.vo.dart';

abstract class AuthRemoteDatasource {
  Future<UserDto> loginUser(LoginUserDto loginUserDto);
  Future<UserDto> googleLogin();
  Future<Unit> registerUser(RegisterUserDto registerUserDto);
  Future<Unit> logoutUser();
  Future<UserDto> getCurrentUser();
  Stream<List<UserDto>> test();
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.googleSignIn,
    required this.dio,
    required this.config,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final GoogleSignIn googleSignIn;
  final Dio dio;
  final Config config;

  @override
  Future<UserDto> loginUser(LoginUserDto loginUserDto) async {
    late User? credential;
    late UserDto result;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: loginUserDto.email,
        password: loginUserDto.password,
      );

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> value) {
        result = UserDto.fromJson(value.data()!);
      });

      credential = firebaseAuth.currentUser;
    } catch (e, s) {
      if (e is FirebaseAuthException) {
        throw ServerException(e.message!);
      } else if (e is FirebaseException) {
        throw ServerException(e.message!);
      } else {
        throw ServerException(s.toString());
      }
    }

    if (credential != null) {
      return result;
    } else {
      throw ServerException('User not found');
    }
  }

  @override
  Future<UserDto> googleLogin() async {
    late User? firebasecredential;
    late UserDto result;
    try {
      final GoogleSignInAuthentication googleAuth = await GoogleSignIn()
          .signIn()
          .then((GoogleSignInAccount? account) => account!.authentication);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> value) {
        result = UserDto.fromJson(value.data()!);
      });

      firebasecredential = firebaseAuth.currentUser;
    } catch (e, s) {
      if (e is FirebaseAuthException) {
        throw ServerException(e.message!);
      } else if (e is FirebaseException) {
        throw ServerException(e.message!);
      } else {
        throw ServerException(s.toString());
      }
    }

    if (firebasecredential != null) {
      return result;
    } else {
      throw ServerException('User not found');
    }
  }

  @override
  Future<Unit> registerUser(RegisterUserDto registerUserDto) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: registerUserDto.email,
        password: registerUserDto.password,
      );

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .set(
            UserDto.fromDomain(UserVo(
              uid: firebaseAuth.currentUser!.uid,
              name: registerUserDto.name,
              email: registerUserDto.email,
            )).toPersistence(),
          );

      return unit;
    } catch (e, s) {
      if (e is FirebaseAuthException) {
        throw ServerException(e.message!);
      } else if (e is FirebaseException) {
        throw ServerException(e.message!);
      } else {
        throw ServerException(s.toString());
      }
    }
  }

  @override
  Future<Unit> logoutUser() async {
    try {
      await firebaseAuth.signOut();
      return unit;
    } catch (e, s) {
      if (e is FirebaseAuthException) {
        throw ServerException(e.message!);
      } else {
        throw ServerException(s.toString());
      }
    }
  }

  @override
  Stream<List<UserDto>> test() {
    return firebaseFirestore.collection('users').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        for (DocumentChange<Map<String, dynamic>> change
            in snapshot.docChanges) {
          switch (change.type) {
            case DocumentChangeType.added:
              print('🔹 User Added: ${change.doc.data()}');
              break;
            case DocumentChangeType.modified:
              print('🟡 User Updated: ${change.doc.data()}');
              break;
            case DocumentChangeType.removed:
              print('❌ User Deleted: ${change.doc.id}');
              break;
          }
        }

        // Return all users as a list of `UserDto`
        return snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                UserDto.fromJson(doc.data()))
            .toList();
      },
    );
  }

  @override
  Future<UserDto> getCurrentUser() async {
    late UserDto result;
    try {
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> value) {
        result = UserDto.fromJson(value.data()!);
      });

      return result;
    } catch (e, s) {
      if (e is FirebaseException) {
        throw ServerException(e.message!);
      } else {
        throw ServerException(s.toString());
      }
    }
  }
}
