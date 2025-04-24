// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../config.dart' as _i804;
import '../core/auth/auth_interceptor.dart' as _i118;
import '../core/network/network_info.dart' as _i6;
import '../core/router/segment.dart' as _i139;
import '../core/utils/color_theme.utils.dart' as _i557;
import '../core/utils/date_utils.dart' as _i235;
import '../features/authentication/data/bloc/auth_bloc.dart' as _i868;
import '../features/authentication/data/bloc/segment/segment_bloc.dart'
    as _i228;
import '../features/authentication/data/bloc/theme/theme_bloc.dart' as _i1056;
import '../features/authentication/data/datasources/auth_local_datasource.dart'
    as _i888;
import '../features/authentication/data/datasources/auth_remote_datasource.dart'
    as _i87;
import '../features/authentication/data/repositories/auth_repository_impl.dart'
    as _i781;
import '../features/authentication/domain/repositories/auth_repository.dart'
    as _i716;
import '../features/authentication/usecases/get_current_user.dart' as _i188;
import '../features/authentication/usecases/login_google.usecase.dart' as _i332;
import '../features/authentication/usecases/login_user.usecase.dart' as _i64;
import '../features/authentication/usecases/logout_user.usecase.dart' as _i624;
import '../features/authentication/usecases/register_user.usecase.dart' as _i1;
import '../features/authentication/usecases/segment/dispose_segment_listener.dart'
    as _i547;
import '../features/authentication/usecases/segment/listen_segment_stream.dart'
    as _i814;
import '../features/authentication/usecases/theme/change_theme.usecase.dart'
    as _i838;
import 'di_container.dart' as _i198;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIContainer = _$DIContainer();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => dIContainer.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => dIContainer.flutterSecureStorage);
    gh.lazySingleton<_i361.Dio>(() => dIContainer.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => dIContainer.internetConnectionChecker);
    gh.lazySingleton<_i59.FirebaseAuth>(() => dIContainer.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => dIContainer.firebaseFirestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => dIContainer.googleSignIn);
    gh.lazySingleton<_i1056.ThemeBloc>(() => _i1056.ThemeBloc());
    gh.lazySingleton<_i557.ColorThemeUtils>(() => _i557.ColorThemeUtils());
    gh.lazySingleton<_i139.Segment>(() => _i139.SegmentImpl());
    gh.lazySingleton<_i228.SegmentBloc>(
        () => _i228.SegmentBloc(gh<_i139.Segment>()));
    gh.lazySingleton<_i235.CMDateUtils>(() => _i235.CMDateUtilsImpl());
    gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
        connectionChecker: gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i804.Config>(
        () => _i804.ConfigImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i838.ChangeThemeUsecase>(
        () => _i838.ChangeThemeUsecase(themeBloc: gh<_i1056.ThemeBloc>()));
    gh.factory<_i547.DisposeSegmentListenerUsecase>(() =>
        _i547.DisposeSegmentListenerUsecase(
            segmentBloc: gh<_i228.SegmentBloc>()));
    gh.factory<_i814.ListenSegmentStreamUsecase>(() =>
        _i814.ListenSegmentStreamUsecase(segmentBloc: gh<_i228.SegmentBloc>()));
    gh.lazySingleton<_i888.AuthLocalDatasource>(
        () => _i888.AuthLocalDatasourceImpl(
              flutterSecureStorage: gh<_i558.FlutterSecureStorage>(),
              sharedPreferences: gh<_i460.SharedPreferences>(),
            ));
    gh.lazySingleton<_i118.AuthenticationInterceptor>(() =>
        _i118.AuthenticationInterceptor(prefs: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i87.AuthRemoteDatasource>(
        () => _i87.AuthRemoteDatasourceImpl(
              firebaseAuth: gh<_i59.FirebaseAuth>(),
              firebaseFirestore: gh<_i974.FirebaseFirestore>(),
              googleSignIn: gh<_i116.GoogleSignIn>(),
              dio: gh<_i361.Dio>(),
              config: gh<_i804.Config>(),
            ));
    gh.lazySingleton<_i716.AuthRepository>(
      () => _i781.AuthRepositoryImpl(
        networkInfo: gh<_i6.NetworkInfo>(),
        authRemoteDatasource: gh<_i87.AuthRemoteDatasource>(),
        authLocalDatasource: gh<_i888.AuthLocalDatasource>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i868.AuthBloc>(
        () => _i868.AuthBloc(authRepository: gh<_i716.AuthRepository>()));
    gh.factory<_i188.GetCurrentUserUsecase>(
        () => _i188.GetCurrentUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i624.LogoutUserUsecase>(
        () => _i624.LogoutUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i64.LoginUserUsecase>(
        () => _i64.LoginUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i1.RegisterUserUsecase>(
        () => _i1.RegisterUserUsecase(authBloc: gh<_i868.AuthBloc>()));
    gh.factory<_i332.LoginGoogleUsecase>(
        () => _i332.LoginGoogleUsecase(authBloc: gh<_i868.AuthBloc>()));
    return this;
  }
}

class _$DIContainer extends _i198.DIContainer {}
