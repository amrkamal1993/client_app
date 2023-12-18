import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/data/remote/service/get_employees_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetEmployeesService)
class GetEmployeeServiceImpl implements GetEmployeesService {
  @override
  Future<List<Employee>> getEmployees() async {

    // Simulating a service call
    await Future.delayed(const Duration(seconds: 2));

    List<Employee> employees = [
      const Employee(id: 1, firstName: 'John', lastName: 'Doe', category: EmployeeCategory.it),
      const Employee(id: 2, firstName: 'Jane', lastName: 'Smith', category: EmployeeCategory.hr),
      const Employee(id: 3, firstName: 'Amr', lastName: 'Kamal', category: EmployeeCategory.it),
      const Employee(id: 4, firstName: 'Nil', lastName: 'Smith', category: EmployeeCategory.hr),

    ];

    return employees;
  }
}
