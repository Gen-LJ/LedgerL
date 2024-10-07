// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ledger_l/core/dependency_injection/modules/firebase.dart'
    as _i750;
import 'package:ledger_l/core/dependency_injection/modules/google_sign_in.dart'
    as _i399;
import 'package:ledger_l/core/dependency_injection/modules/shared_preferences_provider.dart'
    as _i952;
import 'package:ledger_l/data/data.dart' as _i760;
import 'package:ledger_l/data/data_source/local/user_data_source.dart' as _i925;
import 'package:ledger_l/data/data_source/remote/balance_data_source.dart'
    as _i278;
import 'package:ledger_l/data/data_source/remote/user_data_source.dart'
    as _i125;
import 'package:ledger_l/data/repository/balance_repository.dart' as _i25;
import 'package:ledger_l/data/repository/theme_repository.dart' as _i402;
import 'package:ledger_l/data/repository/user_repository.dart' as _i757;
import 'package:ledger_l/domain/domain.dart' as _i560;
import 'package:ledger_l/presentation/blocs/app_setting/app_setting_cubit.dart'
    as _i538;
import 'package:ledger_l/presentation/blocs/authentication/authentication_cubit.dart'
    as _i959;
import 'package:ledger_l/presentation/blocs/authentication/authentication_cubit_provider.dart'
    as _i1015;
import 'package:ledger_l/presentation/navigation/router.dart' as _i426;
import 'package:ledger_l/presentation/presentation.dart' as _i890;
import 'package:ledger_l/presentation/screens/home/cubit/ledger/ledger_cubit.dart'
    as _i133;
import 'package:ledger_l/presentation/screens/home/cubit/transfer/transfer_cubit.dart'
    as _i938;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    final firebaseModule = _$FirebaseModule();
    final googleSignInModule = _$GoogleSignInModule();
    final sharedPreferencesProvider = _$SharedPreferencesProvider();
    final authenticationCubitProvider = _$AuthenticationCubitProvider();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseModule.firebaseFireStore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => googleSignInModule.googleSignIn);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesProvider.provide(),
      preResolve: true,
    );
    gh.lazySingleton<_i426.NavigationRouter>(() => _i426.NavigationRouter());
    gh.lazySingleton<_i278.BalanceRemoteDataSource>(
        () => _i278.BalanceRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i925.UserLocalDataSource>(
        () => _i925.UserLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i125.UserRemoteDataSource>(
        () => _i125.UserRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i560.ThemeRepository>(
        () => _i402.ThemeRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i560.BalanceRepository>(
        () => _i25.BalanceRepositoryImpl(gh<_i278.BalanceRemoteDataSource>()));
    gh.lazySingleton<_i560.UserRepository>(() => _i757.UserRepositoryImpl(
          gh<_i760.UserLocalDataSource>(),
          gh<_i760.UserRemoteDataSource>(),
        ));
    gh.singleton<_i538.AppSettingCubit>(
        () => _i538.AppSettingCubit(gh<_i560.ThemeRepository>()));
    await gh.singletonAsync<_i959.AuthenticationCubit>(
      () => authenticationCubitProvider.provide(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
        gh<_i560.UserRepository>(),
      ),
      preResolve: true,
    );
    gh.factory<_i133.LedgerCubit>(() => _i133.LedgerCubit(
          gh<_i560.BalanceRepository>(),
          gh<_i890.AuthenticationCubit>(),
        ));
    gh.factory<_i938.TransferCubit>(
        () => _i938.TransferCubit(gh<_i560.UserRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i750.FirebaseModule {}

class _$GoogleSignInModule extends _i399.GoogleSignInModule {}

class _$SharedPreferencesProvider extends _i952.SharedPreferencesProvider {}

class _$AuthenticationCubitProvider
    extends _i1015.AuthenticationCubitProvider {}
