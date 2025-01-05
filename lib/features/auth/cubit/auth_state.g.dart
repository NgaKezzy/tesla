// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState emailResendTime(int emailResendTime);

  AuthState status(AuthStatus status);

  AuthState isEmailResendEnable(bool isEmailResendEnable);

  AuthState isSignInSuccess(bool? isSignInSuccess);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    int? emailResendTime,
    AuthStatus? status,
    bool? isEmailResendEnable,
    bool? isSignInSuccess,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthState.copyWith.fieldName(...)`
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState emailResendTime(int emailResendTime) =>
      this(emailResendTime: emailResendTime);

  @override
  AuthState status(AuthStatus status) => this(status: status);

  @override
  AuthState isEmailResendEnable(bool isEmailResendEnable) =>
      this(isEmailResendEnable: isEmailResendEnable);

  @override
  AuthState isSignInSuccess(bool? isSignInSuccess) =>
      this(isSignInSuccess: isSignInSuccess);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    Object? emailResendTime = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? isEmailResendEnable = const $CopyWithPlaceholder(),
    Object? isSignInSuccess = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      emailResendTime: emailResendTime == const $CopyWithPlaceholder() ||
              emailResendTime == null
          ? _value.emailResendTime
          // ignore: cast_nullable_to_non_nullable
          : emailResendTime as int,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AuthStatus,
      isEmailResendEnable:
          isEmailResendEnable == const $CopyWithPlaceholder() ||
                  isEmailResendEnable == null
              ? _value.isEmailResendEnable
              // ignore: cast_nullable_to_non_nullable
              : isEmailResendEnable as bool,
      isSignInSuccess: isSignInSuccess == const $CopyWithPlaceholder()
          ? _value.isSignInSuccess
          // ignore: cast_nullable_to_non_nullable
          : isSignInSuccess as bool?,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthState.copyWith(...)` or like so:`instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
