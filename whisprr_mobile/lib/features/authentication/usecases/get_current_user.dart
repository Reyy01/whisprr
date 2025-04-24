import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/auth_bloc.dart';

@injectable
class GetCurrentUserUsecase {
  GetCurrentUserUsecase({required this.authBloc});

  final AuthBloc authBloc;

  void execute() {
    authBloc.add(const AuthEvent.getCurrentUser());
  }
}
