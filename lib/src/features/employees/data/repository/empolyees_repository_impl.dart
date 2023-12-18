import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/data/remote/source/get_employees_remote_data_source.dart';
import 'package:client_app/src/features/employees/data/repository/empolyees_repository.dart';
import 'package:client_app/utils/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmployeesRepository)
class EmployeesRepositoryImpl extends EmployeesRepository {
  final GetEmployeesRemoteDateSource _dateSource;

  EmployeesRepositoryImpl(this._dateSource);

  @override
  Future<Either<AppException, List<Employee>>> getEmployees() async {
    try {
      return right(await _dateSource.getEmployees());
    } on AppException catch (exception) {
      return left(exception);
    } catch (e) {
      return left(ServerException("Error"));
    }
  }
}
