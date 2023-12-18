import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/data/repository/empolyees_repository.dart';
import 'package:client_app/utils/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEmployeesUseCase{
  final EmployeesRepository _repository;

  GetEmployeesUseCase(this._repository);

  Future<Either<AppException, List<Employee>>> getEmployees() async {
    return _repository.getEmployees();
  }
}
