import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Spinner {
  static void show() {
    Get.dialog(
      AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(100.0),
        content: Container(
          width: 80.0,
          height: 80.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: LoadingAnimationWidget.flickr(
            leftDotColor: AppColors.primary,
            rightDotColor:AppColors.primaryGreen,
            size: 30.0,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    Get.back();
  }
}
