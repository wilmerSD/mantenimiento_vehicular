import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_controller.dart';
import 'package:get/get.dart';

class DetailsScheduleUser extends StatelessWidget {
  const DetailsScheduleUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            /* margin: EdgeInsets.symmetric(horizontal: kMarginLargeApp), */

            height: 210.h,
            /* width: 350, */
            decoration: const BoxDecoration(
                color: AppColors.blueDark,
                borderRadius: BorderRadius.all(
                  Radius.circular(kRadiusSmall),
                )),
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              padding: const EdgeInsets.all(
                kPaddingAppNormalApp,
              ),
              color: AppColors.backgroundColor,
              child: Row(
                /* mainAxisAlignment: MainAxisAlignment.spaceAround, */
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Horario:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Entrada:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Rango inicio de refrigerio:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Tiempo de refrigerio:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Salida:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Descanso:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Día con horario diferente:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.orange,
                        ),
                      ),
                      SizedBox(
                        width: kSizeSmallLittle.w,
                      ),
                      Text(
                        'Horario diferente:',
                        style: AppTextStyle(context).bold14(
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                            'H${controller.scheduleByUser.value.idHorarios ?? ' - Rotativo'}',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                      Obx(
                        () => Text(
                            controller.scheduleByUser.value.horaInicio ??
                                'Rotativo',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                      Obx(() =>
                          controller.scheduleByUser.value.horaInicio != null
                              ? Row(
                                  children: [
                                    Text(
                                        '${controller.scheduleByUser.value.horaInicioRefrigerio  ?? ""} -',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                    Text(
                                        ' ${controller.scheduleByUser.value.horaFinRefrigerio ?? ""}',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                        '${controller.scheduleByUser.value.horaInicioRefrigerio ?? "Rotativo"}',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                    Text(
                                        '${controller.scheduleByUser.value.horaFinRefrigerio ?? ""}',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                  ],
                                )),
                      Obx(
                        () => controller.scheduleByUser.value.horaInicio != null
                            ? Text(
                                '${controller.scheduleByUser.value.tiempoRefrigerio != null ? controller.scheduleByUser.value.tiempoRefrigerio.toString() + " minutos" : " -"}',
                                style: AppTextStyle(context).medium14(
                                  color: AppColors.grayBlue,
                                ))
                            : Text('60 minutos',
                                style: AppTextStyle(context).medium14(
                                  color: AppColors.grayBlue,
                                )),
                      ),
                      Obx(
                        () => Text(
                            controller.scheduleByUser.value.horaFin ?? 'Rotativo',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                      Obx(
                        () => Text(
                            controller.scheduleByUser.value.descanso ?? 'Rotativo',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                      Obx(
                        () => Text(
                            controller.scheduleByUser.value.diaExcepcion ??
                                ' -',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                      Obx(
                        () => Text(
                            '${controller.scheduleByUser.value.hraInicioExcepcion ?? ""} - ${controller.scheduleByUser.value.horaFinExcepcion ?? ""}',
                            style: AppTextStyle(context).medium14(
                              color: AppColors.grayBlue,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
