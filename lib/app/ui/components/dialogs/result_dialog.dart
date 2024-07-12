import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_secundary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog(
      {Key? key,
      required this.type,
      required this.title,
      required this.subTitle,
      required this.doubleButton,
      this.aceptText,
      this.cancelText,
      this.onTapAcept,
      this.onTapCancel,
      this.isBtnSecundary = false,
      this.color,
      this.borderColor,
      this.textColor})
      : super(key: key);
  final int type;
  final String title;
  final String subTitle;
  final bool doubleButton;
  final String? aceptText;
  final String? cancelText;
  final void Function()? onTapAcept;
  final void Function()? onTapCancel;
  final bool isBtnSecundary;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    double factorWidth = doubleButton ? 0.35 : 0.22;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
              image: AssetImage(type == 0
                  ? "assets/img/error_ico.png"
                  : type == 1
                      ? "assets/img/succes_ico.png"
                      : type == 2
                          ? "assets/img/ico_deleted.png"
                          : type == 3
                              ? "assets/img/warning_ico.png"
                              : "assets/img/timer_ico.png")),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * factorWidth,
            child: Text(
              title,
              style: AppTextStyle(context)
                  .semi32(size: 19.2, color: AppColors.grayDarkPlus),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * factorWidth,
            child: Text(
              subTitle,
              style: AppTextStyle(context)
                  .regular14(color: AppColors.grayDarkPlus),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          doubleButton
              ? Responsive(
                  desktop: SizedBox(
                    width: MediaQuery.of(context).size.width * factorWidth,
                    child: Row(
                      children: [
                        Expanded(
                            child: BtnCancel(
                          text: cancelText ?? "Cancelar",
                          borderColor: borderColor ?? AppColors.primary,
                          textColor: textColor ?? AppColors.primary,
                          onTap: onTapCancel,
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: isBtnSecundary
                              ? BtnSecundary(
                                  text: aceptText ?? "Aceptar",
                                  color: color ?? AppColors.primaryGreen,
                                  onTap: onTapAcept,
                                )
                              : BtnPrimary(
                                  text: aceptText ?? "Aceptar",
                                  onTap: onTapAcept,
                                ),
                        ),
                      ],
                    ),
                  ),
                  mobile: SizedBox(
                    // width: MediaQuery.of(context).size.width * factorWidth,
                    child: Row(
                      children: [
                        Expanded(
                            child: BtnCancel(
                          text: cancelText ?? "Cancelar",
                          borderColor: borderColor ?? AppColors.primary,
                          textColor: textColor ?? AppColors.primary,
                          onTap: onTapCancel,
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: isBtnSecundary
                              ? BtnSecundary(
                                  text: aceptText ?? "Aceptar",
                                  color: color ?? AppColors.primaryGreen,
                                  onTap: onTapAcept,
                                )
                              : BtnPrimary(
                                  text: aceptText ?? "Aceptar",
                                  onTap: onTapAcept,
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              : Responsive(
                  desktop: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (factorWidth - 0.05),
                    child: isBtnSecundary
                        ? BtnSecundary(
                            text: aceptText ?? "Aceptar",
                            color: color ?? AppColors.primaryGreen,
                            onTap: onTapAcept,
                          )
                        : BtnPrimary(
                            text: aceptText ?? "Aceptar",
                            onTap: onTapAcept,
                          ),
                  ),
                  mobile: SizedBox(
                    child: isBtnSecundary
                        ? BtnSecundary(
                            text: aceptText ?? "Aceptar",
                            color: color ?? AppColors.primaryGreen,
                            onTap: onTapAcept,
                          )
                        : BtnPrimary(
                            text: aceptText ?? "Aceptar",
                            onTap: onTapAcept,
                          ),
                  ),
                ),
        ],
      ),
    );
  }
}
