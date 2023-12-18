import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/utils/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employees_state.freezed.dart';

@freezed
abstract class EmployeesState with _$EmployeesState {
  const factory EmployeesState.initial() = _Initial;

  const factory EmployeesState.error(AppException error) = _Error;

  const factory EmployeesState.loading() = _Loading;

  const factory EmployeesState.onEmployeesLoaded(List<Employee> employees) = _onEmployeesLoaded;

}
