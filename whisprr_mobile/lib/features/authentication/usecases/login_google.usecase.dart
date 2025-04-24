import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/auth_bloc.dart';

@injectable
class LoginGoogleUsecase {
  LoginGoogleUsecase({required this.authBloc});

  final AuthBloc authBloc;

  void execute() {
    authBloc.add(const AuthEvent.googleLogin());
  }
}
