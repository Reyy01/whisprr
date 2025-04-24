import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/core/router/app_router.dart';
import 'package:whisprr_mobile/dic/injection.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/theme/theme_bloc.dart';
import 'package:whisprr_mobile/firebase_options.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await configureInjection(Environment.prod);
      runApp(const MyApp());
    },
    _data,
  );
}

void _data(Object e, StackTrace s) {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeBloc _themeBloc;

  late AppRouter _appRouter;

  @override
  void initState() {
    _themeBloc = getIt<ThemeBloc>();

    _appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeBloc, ThemeState, Brightness>(
      bloc: _themeBloc,
      selector: (ThemeState state) => state.theme,
      builder: (BuildContext context, Brightness state) {
        return MaterialApp.router(
          key: const ValueKey<String>('app-key'),
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
