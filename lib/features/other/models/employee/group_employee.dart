import 'package:telsa_mobile/features/other/models/employee/employee.dart';

class GroupEmployee {
  final String role;
  final List<Employee> employees;

  GroupEmployee({
    required this.role,
    required this.employees,
  });
}
