import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisprr_mobile/core/utils/color_theme.utils.dart';
import 'package:whisprr_mobile/dic/injection.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/auth_bloc.dart';
import 'package:whisprr_mobile/features/authentication/usecases/logout_user.usecase.dart';

class AuthDetailsWidget extends StatefulWidget {
  const AuthDetailsWidget({super.key});

  @override
  State<AuthDetailsWidget> createState() => _AuthDetailsWidgetState();
}

class _AuthDetailsWidgetState extends State<AuthDetailsWidget> {
  late AuthBloc _authBloc;

  late LogoutUserUsecase _logoutUserUsecase;

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    _logoutUserUsecase = getIt<LogoutUserUsecase>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = getIt<ColorThemeUtils>().getColors(context);
    return Container(
        color: colorTheme.white_blueGrey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: colorTheme.shadow_grey_white ?? Colors.white),
                  ),
                  filled: true,
                  fillColor: colorTheme.shadow_grey_white,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 20, // Example item count
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {},
                );
              },
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BlocBuilder<AuthBloc, AuthState>(
                    bloc: _authBloc,
                    builder: (BuildContext context, AuthState state) {
                      final String? email = state.loginDatas?.name;
                      final String? emailPrefix = email?.substring(0, 1);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            child: CircleAvatar(
                              backgroundColor: colorTheme.shadow_grey_white,
                              child: Text(
                                emailPrefix?.toUpperCase() ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorTheme.black_white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            email ?? '',
                            style: TextStyle(
                              color: colorTheme.black_white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                    child: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
