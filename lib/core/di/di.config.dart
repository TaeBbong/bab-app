// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bab/core/di/modules.dart' as _i549;
import 'package:bab/data/repositories/user_info_repository_impl.dart' as _i926;
import 'package:bab/data/sources/user_info_local_data_source.dart' as _i748;
import 'package:bab/domain/repositories/user_info_repository.dart' as _i507;
import 'package:bab/domain/usecases/register_user_usecase.dart' as _i476;
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
    gh.lazySingleton<_i748.UserInfoLocalDataSource>(
      () => _i748.UserInfoLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i507.UserInfoRepository>(
      () => _i926.UserInfoRepositoryImpl(gh<_i748.UserInfoLocalDataSource>()),
    );
    gh.factory<_i476.RegisterUserUsecase>(
      () => _i476.RegisterUserUsecase(gh<_i507.UserInfoRepository>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i549.InjectionModule {}
