import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/local/local_storage.dart';
import 'package:telsa_mobile/common/models/request/sign_in_request.dart';
import 'package:telsa_mobile/common/services/auth_service.dart';
import 'package:telsa_mobile/common/widgets/loading/dialog_loading.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authService,
  }) : super(const AuthState());

  final AuthService authService;
  final Logger logger = di.get();
  final SharedPrefs sharedPrefs = SharedPrefs();

  Future<void> emailResendTime() async {
    int seconds = 30;
    emit(
      state.copyWith(
        isEmailResendEnable: false,
      ),
    );
    Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        seconds--;
        emit(
          state.copyWith(
            emailResendTime: seconds,
          ),
        );
        if (seconds == 0) {
          timer.cancel();
          emit(
            state.copyWith(
              isEmailResendEnable: true,
            ),
          );
        }
      },
    );
  }

  void sendOtp() {
    emit(
      state.copyWith(
        emailResendTime: 30,
        status: AuthStatus.start,
      ),
    );
    emailResendTime();
    emit(
      state.copyWith(
        status: AuthStatus.success,
      ),
    );
  }

  Future<void> signIn(
      {required String username,
      required String password,
      required bool isRememberLogin}) async {
    DialogLoading.showLoading();
    try {
      final response = await authService
          .signIn(SignInRequest(username: username, password: password));

      if (response.message == 'Login success') {
        if (isRememberLogin) {
          sharedPrefs.setRememberLogin(true);
        }
        emit(state.copyWith(isSignInSuccess: true));
      }
    } on DioException catch (e) {
      print(e.response?.data['message']);
    } catch (e) {
      logger.e(e);
    } finally {
      DialogLoading.hideLoading();
    }
    emit(state.copyWith(isSignInSuccess: null, status: AuthStatus.success));
  }

  Future<void> logout() async {
    await sharedPrefs.setRememberLogin(false);

    try {
      await authService.logout();
    } catch (e) {
      logger.e(e);
    }
  }
}
