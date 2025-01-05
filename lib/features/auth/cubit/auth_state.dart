import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.g.dart';

enum AuthStatus { init, start, loading, success, error }

@CopyWith()
class AuthState extends Equatable {
  const AuthState(
      {this.emailResendTime = 30,
      this.status = AuthStatus.init,
      this.isEmailResendEnable = true,
      this.isSignInSuccess});

  final int emailResendTime;
  final bool? isSignInSuccess;
  final bool isEmailResendEnable;
  final AuthStatus status;

  @override
  List<Object?> get props =>
      [emailResendTime, isSignInSuccess, status, isEmailResendEnable];
}
