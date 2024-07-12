import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryModal extends StatelessWidget {
  const PrimaryModal({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(15.0),
      contentPadding: const EdgeInsets.all(25.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: child,
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
