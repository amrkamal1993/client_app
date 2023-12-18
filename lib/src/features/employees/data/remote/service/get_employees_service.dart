import 'package:client_app/src/features/employees/data/model/employee_model.dart';

abstract class GetEmployeesService {
  Future<List<Employee>> getEmployees();
}
