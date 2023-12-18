enum EmployeeCategory { it, hr }

class Employee {
  final String firstName;
  final String lastName;
  final int id;
  final EmployeeCategory category;

  const Employee({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.category,
  });
}
