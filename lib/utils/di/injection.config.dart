// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/features/employees/data/remote/service/get_employees_service.dart'
    as _i4;
import '../../src/features/employees/data/remote/service/get_employees_service_impl.dart'
    as _i5;
import '../../src/features/employees/data/remote/source/get_employees_remote_data_source.dart'
    as _i6;
import '../../src/features/employees/data/remote/source/get_employees_remote_data_source_impl.dart'
    as _i7;
import '../../src/features/employees/data/repository/empolyees_repository.dart'
    as _i8;
import '../../src/features/employees/data/repository/empolyees_repository_impl.dart'
    as _i9;
import '../../src/features/employees/domain/get_employees_usecase.dart' as _i10;
import '../../src/features/employees/presentation/cubit/employees_cubit.dart'
    as _i11;
import '../cache/cache_helper.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.CacheHelper>(_i3.CacheHelper());
  gh.factory<_i4.GetEmployeesService>(() => _i5.GetEmployeeServiceImpl());
  gh.factory<_i6.GetEmployeesRemoteDateSource>(() =>
      _i7.GetEmployeesRemoteDateSourceImpl(gh<_i4.GetEmployeesService>()));
  gh.factory<_i8.EmployeesRepository>(() =>
      _i9.EmployeesRepositoryImpl(gh<_i6.GetEmployeesRemoteDateSource>()));
  gh.factory<_i10.GetEmployeesUseCase>(
      () => _i10.GetEmployeesUseCase(gh<_i8.EmployeesRepository>()));
  gh.factory<_i11.EmployeesCubit>(() => _i11.EmployeesCubit(
        gh<_i10.GetEmployeesUseCase>(),
        gh<_i3.CacheHelper>(),
      ));
  return getIt;
}
