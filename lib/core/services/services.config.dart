// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:v/core/firebase/collections.dart' as _i3;
import 'package:v/src/data/repository/firebase_daily_repository_impl.dart'
    as _i5;
import 'package:v/src/domain/repository/daily_repository.dart' as _i4;
import 'package:v/src/domain/use_case/get_daily_info_usecase.dart' as _i6;
import 'package:v/src/presentation/controller/message_controller.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FirebaseReferences>(() => _i3.FirebaseReferences());
    gh.factory<_i4.DailyRepository>(() => _i5.FirebaseDailyRepositoryImpl(
        firebaseReferences: gh<_i3.FirebaseReferences>()));
    gh.factory<_i6.GetDailyInfoUseCase>(
        () => _i6.GetDailyInfoUseCase(repository: gh<_i4.DailyRepository>()));
    gh.factory<_i7.MessageController>(() => _i7.MessageController(
        getDailyInfoUseCase: gh<_i6.GetDailyInfoUseCase>()));
    return this;
  }
}
