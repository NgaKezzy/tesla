import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class DialogLoading {
  static final DialogLoading _singleton = DialogLoading._internal();

  factory DialogLoading() {
    return _singleton;
  }

  DialogLoading._internal();

  static OverlaySupportEntry? _overlaySupportEntry;

  static void hideLoading() {
    _overlaySupportEntry?.dismiss();
    _overlaySupportEntry = null;
  }

  static void showLoading({double opacityColor = 0.4}) {
    _overlaySupportEntry ??= showOverlay(
      (context, opacity) {
        return Opacity(
          opacity: opacity,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFA6AEBF)),
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        );
      },
      duration: const Duration(minutes: 20),
    );
  }
}
