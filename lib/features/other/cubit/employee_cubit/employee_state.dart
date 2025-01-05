import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/models/employee/group_employee.dart';

part 'employee_state.g.dart';

enum EmployeeStatus { init, start, loading, error, success }

@CopyWith()
class EmployeeState extends Equatable {
  const EmployeeState(
      {this.status = EmployeeStatus.init,
      this.employees = const [],
      this.groupEmployees = const []});

  final EmployeeStatus status;
  final List<Employee> employees;
  final List<GroupEmployee> groupEmployees;

  @override
  List<Object?> get props => [status, employees, groupEmployees];
}
