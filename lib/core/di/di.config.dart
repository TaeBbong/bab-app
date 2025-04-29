// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bab/core/di/modules.dart' as _i549;
import 'package:bab/core/services/notification_service.dart' as _i342;
import 'package:bab/data/repositories/eating_repository_impl.dart' as _i80;
import 'package:bab/data/repositories/pickup_repository_impl.dart' as _i586;
import 'package:bab/data/repositories/user_info_repository_impl.dart' as _i926;
import 'package:bab/data/sources/eating_remote_data_source.dart' as _i768;
import 'package:bab/data/sources/pickup_remote_data_source.dart' as _i1013;
import 'package:bab/data/sources/user_info_local_data_source.dart' as _i748;
import 'package:bab/domain/repositories/eating_repository.dart' as _i67;
import 'package:bab/domain/repositories/pickup_repository.dart' as _i415;
import 'package:bab/domain/repositories/user_info_repository.dart' as _i507;
import 'package:bab/domain/usecases/add_pickup_usecase.dart' as _i660;
import 'package:bab/domain/usecases/apply_eat_usecase.dart' as _i209;
import 'package:bab/domain/usecases/cancel_eat_usecase.dart' as _i316;
import 'package:bab/domain/usecases/get_user_info_usecase.dart' as _i315;
import 'package:bab/domain/usecases/register_user_usecase.dart' as _i476;
import 'package:bab/domain/usecases/watch_all_eating_usecase.dart' as _i505;
import 'package:bab/domain/usecases/watch_daily_eating_usecase.dart' as _i989;
import 'package:bab/domain/usecases/watch_pickup_usecase.dart' as _i181;
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
    gh.lazySingleton<_i342.NotificationService>(
      () => _i342.NotificationServiceImpl(),
    );
    gh.lazySingleton<_i748.UserInfoLocalDataSource>(
      () => _i748.UserInfoLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1013.PickupRemoteDataSource>(
      () => _i1013.PickupRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i768.EatingRemoteDataSource>(
      () => _i768.EatingRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i415.PickupRepository>(
      () => _i586.PickupRepositoryImpl(gh<_i1013.PickupRemoteDataSource>()),
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
    gh.factory<_i181.WatchPickupUsecase>(
      () => _i181.WatchPickupUsecase(gh<_i415.PickupRepository>()),
    );
    gh.factory<_i660.AddPickupUsecase>(
      () => _i660.AddPickupUsecase(gh<_i415.PickupRepository>()),
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
    gh.factory<_i989.WatchDailyEatingUsecase>(
      () => _i989.WatchDailyEatingUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i505.WatchAllEatingUsecase>(
      () => _i505.WatchAllEatingUsecase(gh<_i67.EatingRepository>()),
    );
    gh.factory<_i316.CancelEatUsecase>(
      () => _i316.CancelEatUsecase(gh<_i67.EatingRepository>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i549.InjectionModule {}
