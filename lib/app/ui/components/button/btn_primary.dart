import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    required this.text,
    this.loading = false,
    this.isMaxHeight = false,
    this.isGreen = false,
    this.onTap,
    this.child,
  }) : super(key: key);
  final String text;
  final bool loading;
  final void Function()? onTap;
  final bool? isMaxHeight;
  final bool? isGreen;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      /* padding: const EdgeInsets.symmetric(horizontal: kPaddingAppNormalApp), */
      padding: const EdgeInsets.symmetric(
          horizontal: kPaddingAppNormalApp, vertical: kPaddingAppLittleApp),
      /* padding: const EdgeInsets.all(kPaddingAppLittleApp), */
      height: isMaxHeight! ? 50.0 : 40.0,
      decoration: BoxDecoration(
        gradient: isGreen!
            ? const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : const LinearGradient(
                colors: [
                  AppColors.primary, // Color de inicio del degradado
                  AppColors.primary, // Color de final del degradado
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        /* color: isGreen! ? AppColors.green : AppColors.blueDark, */
        borderRadius: BorderRadius.circular(isMaxHeight! ? 14.0 : 10.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(0, 0, 0, 0.08),
          borderRadius: BorderRadius.circular(isMaxHeight! ? 14.0 : 10.5),
          onTap: onTap,
          child: Center(
            child: Text(text,
                /* textScaleFactor: 1, */
                textAlign: TextAlign.center,
                style: AppTextStyle(context)
                    .semi16(color: AppColors.backgroundColor)),
          ),
          /* Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: AppTextStyle(context)
                          .bold18(color: AppColors.backgroundColor)),
                  Center(child: child)
                ]),
              ),
            ]),
          ), */
        ),
      ),
    );
  }
}
