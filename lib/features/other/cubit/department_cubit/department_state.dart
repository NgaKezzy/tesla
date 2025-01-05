import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';
part 'department_state.g.dart';

enum DepartmentStatus { init, start, loading, error, success }

@CopyWith()
class DepartmentState extends Equatable {
  const DepartmentState({
    this.status = DepartmentStatus.init,
    this.departments = const [],
  });

  final DepartmentStatus status;
  final List<Department> departments;

  @override
  List<Object> get props => [status, departments];
}
