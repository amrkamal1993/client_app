import 'package:client_app/src/features/employees/data/model/employee_model.dart';
import 'package:client_app/src/features/employees/presentation/cubit/employees_cubit.dart';
import 'package:client_app/src/features/employees/presentation/cubit/employees_state.dart';
import 'package:client_app/utils/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<EmployeesCubit>()..getEmployees(),
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'HR'),
                Tab(text: 'IT'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // HR Tab
              _buildEmployeeList(context, EmployeeCategory.hr),

              // IT Tab
              _buildEmployeeList(context, EmployeeCategory.it),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmployeeList(BuildContext context, EmployeeCategory category) {
    return BlocConsumer<EmployeesCubit, EmployeesState>(
      builder: (context, state) {
        final cubit = context.read<EmployeesCubit>();
        return RefreshIndicator(
          onRefresh: () => cubit.getEmployees(),
          child: Scaffold(
            body: state.maybeWhen(
              orElse: () => ListView.builder(
                itemCount: cubit.getFilteredEmployees(category).length,
                itemBuilder: (context, index) {
                  final employee = cubit.getFilteredEmployees(category)[index];
                  return ListTile(
                    title: Text('${employee.firstName} ${employee.lastName}'),
                    subtitle: Text('ID: ${employee.id}, Category: ${employee.category.name}'),
                  );
                },
              ),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        );
      },
      listener: (BuildContext context, EmployeesState state) {},
    );
  }
}
