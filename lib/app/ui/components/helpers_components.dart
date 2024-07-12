import 'package:app_valtx_asistencia/app/ui/components/primary_modal.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

abstract class HelpersComponents {
  static Future<void> getModal(BuildContext context, Widget child,
      {bool? barrierDismissible}) async {
    showDialog(
      barrierDismissible: barrierDismissible ?? false,
      context: context,
      builder: ((context) => PrimaryModal(child: child)),
    );
  }

  static Widget getLoadingAnimation({double heighMinimal = 160.0}) {
    return Column(
      children: [
        SizedBox(
          height: heighMinimal,
        ),
        LoadingAnimationWidget.flickr(
          leftDotColor: AppColors.primary,
          rightDotColor: AppColors.primaryGreen,
          size: 40.0,
        ),
      ],
    );
  }

  static Widget getLoadingAnimationExport({double heighMinimal = 160.0}) {
    return Column(
      children: [
        SizedBox(
          height: heighMinimal,
        ),
        /* LoadingAnimationWidget.bouncingBall(
          color: const Color.fromARGB(255, 0, 113, 206),

          //  leftDotColor: const Color.fromARGB(255, 0, 113, 206),
          //  rightDotColor: const Color.fromARGB(249, 139, 198, 63),
          size: 40.0,
        ), */
      ],
    );
  }

  static Widget pathAssetIcons(String fileName, Color color,
      {double? width, double? height}) {
    return Image(
      image: AssetImage("assets/icons/$fileName"),
      width: width ?? 17.0,
      height: height ?? 17.0,
      color: color,
    );
  }
}
