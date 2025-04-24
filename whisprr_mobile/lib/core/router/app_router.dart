import 'package:auto_route/auto_route.dart';
import 'package:whisprr_mobile/config.dart';
import 'package:whisprr_mobile/features/authentication/presentation/pages/Home.page.dart';
import 'package:whisprr_mobile/features/authentication/presentation/pages/Initial.page.dart';
import 'package:whisprr_mobile/features/authentication/presentation/pages/Login.page.dart';
import 'package:whisprr_mobile/features/authentication/presentation/pages/Register.page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: InitialRoute.page,
          initial: true,
          path: ScreenRoute.INITIAL_ROUTE,
        ),
        CustomRoute(
          page: LoginRoute.page,
          path: ScreenRoute.LOGIN_ROUTE,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          path: ScreenRoute.REGISTER_ROUTE,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          path: ScreenRoute.HOME_ROUTE,
          transitionsBuilder: TransitionsBuilders.noTransition,
          // children: <AutoRoute>[
          //   CustomRoute(
          //     page: ChatsRoute.page,
          //     path: ScreenRoute.CHATS_ROUTE,
          //     transitionsBuilder: TransitionsBuilders.slideBottom,
          //   ),
          //   CustomRoute(
          //     page: ContactsRoute.page,
          //     path: ScreenRoute.CONTACTS_ROUTE,
          //     transitionsBuilder: TransitionsBuilders.slideBottom,
          //   ),
          // ],
        ),
      ];
}
