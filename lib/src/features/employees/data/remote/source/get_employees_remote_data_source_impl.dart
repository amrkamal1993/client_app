import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/data/remote/service/get_employees_service.dart';
import 'package:client_app/src/features/employees/data/remote/source/get_employees_remote_data_source.dart';
import 'package:client_app/utils/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetEmployeesRemoteDateSource)
class GetEmployeesRemoteDateSourceImpl
    extends GetEmployeesRemoteDateSource {
  final GetEmployeesService _getEmployeesService;


  GetEmployeesRemoteDateSourceImpl(
      this._getEmployeesService);

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      return await _getEmployeesService.getEmployees();
    } on DioException catch (error) {
      throw NetworkException(error.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
