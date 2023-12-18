import 'package:client_app/src/features/employees/presentation/screen/employees_screen.dart';
import 'package:client_app/utils/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, router) {
        return const EmployeesScreen();
      },
    );
  }

}

