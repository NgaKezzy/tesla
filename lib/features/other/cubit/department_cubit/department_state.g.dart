// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DepartmentStateCWProxy {
  DepartmentState status(DepartmentStatus status);

  DepartmentState departments(List<Department> departments);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DepartmentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DepartmentState(...).copyWith(id: 12, name: "My name")
  /// ````
  DepartmentState call({
    DepartmentStatus? status,
    List<Department>? departments,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDepartmentState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDepartmentState.copyWith.fieldName(...)`
class _$DepartmentStateCWProxyImpl implements _$DepartmentStateCWProxy {
  const _$DepartmentStateCWProxyImpl(this._value);

  final DepartmentState _value;

  @override
  DepartmentState status(DepartmentStatus status) => this(status: status);

  @override
  DepartmentState departments(List<Department> departments) =>
      this(departments: departments);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DepartmentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DepartmentState(...).copyWith(id: 12, name: "My name")
  /// ````
  DepartmentState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
  }) {
    return DepartmentState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DepartmentStatus,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<Department>,
    );
  }
}

extension $DepartmentStateCopyWith on DepartmentState {
  /// Returns a callable class that can be used as follows: `instanceOfDepartmentState.copyWith(...)` or like so:`instanceOfDepartmentState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DepartmentStateCWProxy get copyWith => _$DepartmentStateCWProxyImpl(this);
}
