import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/utils/app_exception.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeesRepository {
  Future<Either<AppException, List<Employee>>> getEmployees();
}
