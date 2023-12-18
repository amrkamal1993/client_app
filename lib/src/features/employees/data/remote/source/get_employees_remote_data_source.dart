import 'package:client_app/src/features/employees/data/model/employee_model.dart';

abstract class GetEmployeesRemoteDateSource {
  Future<List<Employee>> getEmployees();
}