import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/domain/get_employees_usecase.dart';
import 'package:client_app/src/features/employees/presentation/cubit/employees_state.dart';
import 'package:client_app/utils/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit(this._getEmployeesUseCase, this._cacheHelper)
      : super(const EmployeesState.initial());

  final GetEmployeesUseCase _getEmployeesUseCase;
  final CacheHelper _cacheHelper;

  List<Employee> employees = [];

  Future<void> getEmployees() async {
    emit(const EmployeesState.loading());
    final result = await _getEmployeesUseCase.getEmployees();
    emit(result.fold((left) => EmployeesState.error(left), (right) {
      employees = right;
      _cacheHelper.cacheObject("employees_list", right);
      return EmployeesState.onEmployeesLoaded(right);
    }));
  }

  List<Employee> getFilteredEmployees(EmployeeCategory category){
    return employees.where((element) => element.category == category).toList();
  }
}
