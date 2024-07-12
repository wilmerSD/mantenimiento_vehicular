import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BtnCancel extends StatelessWidget {
  const BtnCancel(
      {Key? key,
      required this.text,
      this.onTap,
      this.borderColor,
      this.textColor})
      : super(key: key);
  final String text;
  final void Function()? onTap;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.5),
          border: Border.all(color: borderColor ?? AppColors.primary)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(0, 0, 0, 0.08),
          borderRadius: BorderRadius.circular(10.5),
          onTap: onTap,
          child: Center(
            child: Text(text,
                style: AppTextStyle(context).semi16(color: AppColors.primary)),
          ),
        ),
      ),
    );
  }
}
