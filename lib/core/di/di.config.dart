// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bab/core/di/modules.dart' as _i549;
import 'package:bab/data/repositories/eating_repository_impl.dart' as _i80;
import 'package:bab/data/repositories/user_info_repository_impl.dart' as _i926;
import 'package:bab/data/sources/eating_remote_data_source.dart' as _i768;
import 'package:bab/data/sources/user_info_local_data_source.dart' as _i748;
import 'package:bab/domain/repositories/eating_repository.dart' as _i67;
import 'package:bab/domain/repositories/user_info_repository.dart' as _i507;
import 'package:bab/domain/usecases/apply_eat_usecase.dart' as _i209;
import 'package:bab/domain/usecases/cancel_eat_usecase.dart' as _i316;
import 'package:bab/domain/usecases/get_daily_eating_usecase.dart' as _i777;
import 'package:bab/domain/usecases/get_user_info_usecase.dart' as _i315;
import 'package:bab/domain/usecases/monthly_all_eat_usecase.dart' as _i990;
import 'package:bab/domain/usecases/monthly_user_eat_usecase.dart' as _i221;
import 'package:bab/domain/usecases/overall_eat_usecase.dart' as _i995;
import 'package:bab/domain/usecases/register_user_usecase.dart' as _i476;
import 'package:bab/domain/usecases/set_monthly_all_eat_usecase.dart' as _i341;
import 'package:bab/domain/usecases/set_monthly_user_eat_usecase.dart'
    as _i1024;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectionModule.firestore);
    gh.lazySingleton<_i748.UserInfoLocalDataSource>(
      () => _i748.UserInfoLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i768.EatingRemoteDataSource>(
      () => _i768.EatingRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i507.UserInfoRepository>(
      () => _i926.UserInfoRepositoryImpl(gh<_i748.UserInfoLocalDataSource>()),
    );
    gh.factory<_i476.RegisterUserUsecase>(
      () => _i476.RegisterUserUsecase(gh<_i507.UserInfoRepository>()),
    );
    gh.factory<_i315.GetUserInfoUsecase>(
      () => _i315.GetUserInfoUsecase(gh<_i507.UserInfoRepository>()),
    );
    gh.lazySingleton<_i67.EatingRepository>(
      () => _i80.EatingRepositoryImpl(
        gh<_i768.EatingRemoteDataSource>(),
        gh<_i748.UserInfoLocalDataSource>(),
      ),
    );
    gh.factory<_i209.ApplyEatUsecase>(
      () => _i209.ApplyEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i995.OverallEatUsecase>(
      () => _i995.OverallEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i341.SetMonthlyAllEatUsecase>(
      () => _i341.SetMonthlyAllEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i316.CancelEatUsecase>(
      () => _i316.CancelEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i1024.SetMonthlyUserEatUsecase>(
      () => _i1024.SetMonthlyUserEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i221.MonthlyUserEatUsecase>(
      () => _i221.MonthlyUserEatUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i777.GetDailyEatingUsecase>(
      () => _i777.GetDailyEatingUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i990.MonthlyAllEatUsecase>(
      () => _i990.MonthlyAllEatUsecase(gh<_i67.EatingRepository>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i549.InjectionModule {}
