// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeStateCWProxy {
  EmployeeState status(EmployeeStatus status);

  EmployeeState employees(List<Employee> employees);

  EmployeeState groupEmployees(List<GroupEmployee> groupEmployees);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeState(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeState call({
    EmployeeStatus? status,
    List<Employee>? employees,
    List<GroupEmployee>? groupEmployees,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEmployeeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEmployeeState.copyWith.fieldName(...)`
class _$EmployeeStateCWProxyImpl implements _$EmployeeStateCWProxy {
  const _$EmployeeStateCWProxyImpl(this._value);

  final EmployeeState _value;

  @override
  EmployeeState status(EmployeeStatus status) => this(status: status);

  @override
  EmployeeState employees(List<Employee> employees) =>
      this(employees: employees);

  @override
  EmployeeState groupEmployees(List<GroupEmployee> groupEmployees) =>
      this(groupEmployees: groupEmployees);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeState(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? groupEmployees = const $CopyWithPlaceholder(),
  }) {
    return EmployeeState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as EmployeeStatus,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<Employee>,
      groupEmployees: groupEmployees == const $CopyWithPlaceholder() ||
              groupEmployees == null
          ? _value.groupEmployees
          // ignore: cast_nullable_to_non_nullable
          : groupEmployees as List<GroupEmployee>,
    );
  }
}

extension $EmployeeStateCopyWith on EmployeeState {
  /// Returns a callable class that can be used as follows: `instanceOfEmployeeState.copyWith(...)` or like so:`instanceOfEmployeeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeStateCWProxy get copyWith => _$EmployeeStateCWProxyImpl(this);
}
