import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:toastification/toastification.dart';

enum AppToastType {
  success,
  error,
  warning,
  info,
}

class AppToast {
  static ToastificationItem? _currentToast;

  static Future<void> _showToast({
    required String title,
    required String message,
    required ToastificationType type,
    Color? backgroundColor,
    required bool isDismissible,
  }) async {
    if (_currentToast != null) {
      toastification.dismiss(_currentToast!);
    }

    _currentToast = toastification.show(
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: isDismissible
          ? const Duration(days: 365)
          : const Duration(seconds: 2),
      dragToClose: true,
      backgroundColor: backgroundColor,
      showProgressBar: false,
      dismissDirection: isDismissible ? DismissDirection.none : null,
      closeButtonShowType: CloseButtonShowType.none,
    );
  }

  static void toastSuccess(
    String message, {
    bool isDismissible = false,
  }) {
    _showToast(
      title: "Thành công",
      message: message,
      type: ToastificationType.success,
      isDismissible: isDismissible,
    );
  }

  static void toastError(
    String message, {
    bool isDismissible = false,
  }) {
    _showToast(
      title: "Lỗi",
      message: message,
      type: ToastificationType.error,
      isDismissible: isDismissible,
    );
  }

  static void toastWarning(
    String message, {
    bool isDismissible = false,
  }) {
    _showToast(
      title: "Cảnh báo",
      message: message,
      type: ToastificationType.warning,
      isDismissible: isDismissible,
    );
  }

  static void toastInfo(
    String message, {
    bool isDismissible = false,
  }) {
    _showToast(
      title: "Thông báo",
      message: message,
      type: ToastificationType.info,
      isDismissible: isDismissible,
    );
  }

  static void toastDismiss() {
    if (_currentToast != null) {
      toastification.dismiss(_currentToast!);
    }
  }
}
