import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class DetailsSchedule extends StatelessWidget {
  const DetailsSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) => Container(
            /* margin: EdgeInsets.symmetric(horizontal: kMarginLargeApp), */
            padding: const EdgeInsets.symmetric(
                horizontal: kPaddingAppNormalApp,
                vertical: kPaddingAppNormalApp),
            /* height: 160.h, */
            /* width: 350, */
            decoration: const BoxDecoration(
                color: Color.fromRGBO(247, 248, 253, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(kRadiusSmall),
                )),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                /* mainAxisAlignment: MainAxisAlignment.start, */
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Horario:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Text(
                    'Entrada:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Text(
                    'Inicio de refrigerio:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Text(
                    'Tiempo de refrigerio:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Text(
                    'Salida:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Descanso:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Día con horario\ndiferente:',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                width: kSizeSmallLittle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Text(
                      'H${controller.scheduleByUser.value.idHorarios ?? ' - Rotativo'}',
                      style: AppTextStyle(context).medium14(
                        color: AppColors.grayBlue,
                      ))),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Obx(
                    () => Text(
                        controller.scheduleByUser.value.horaInicio ??
                            'Rotativo',
                        style: AppTextStyle(context).medium14(
                          color: AppColors.grayBlue,
                        )),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Obx(() => controller.scheduleByUser.value.horaInicio != null
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
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
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
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Obx(
                    () => Text(controller.scheduleByUser.value.horaFin ?? 'Rotativo',
                        style: AppTextStyle(context).medium14(
                          color: AppColors.grayBlue,
                        )),
                  ),
                  const SizedBox(
                    height: kSizeSmallLittle,
                  ),
                  Obx(
                    () => Text(controller.scheduleByUser.value.descanso ?? 'Rotativo',
                        style: AppTextStyle(context).medium14(
                          color: AppColors.grayBlue,
                        )),
                  ),
                  const SizedBox(
                    height: kSizeNormalLittle,
                  ),
                  Obx(
                    () => Text(
                        controller.scheduleByUser.value.diaExcepcion ?? ' -',
                        style: AppTextStyle(context).medium14(
                          color: AppColors.grayBlue,
                        )),
                  ),
                  const SizedBox(
                    height: kSizeBigLittle,
                  ),
                  Obx(
                    () => Text(
                        '${controller.scheduleByUser.value.hraInicioExcepcion ?? ""} - ${controller.scheduleByUser.value.horaFinExcepcion ?? ""}',
                        style: AppTextStyle(context).medium14(
                          color: AppColors.grayBlue,
                        )),
                  ),
                ],
              )
            ])

            /* Column(
              mainAxisSize: MainAxisSize.max,
              /* mainAxisAlignment: MainAxisAlignment.spaceAround, */
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horario:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  'H${controller.scheduleByUser.value.idHorarios ?? '-'}',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Entrada:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  controller.scheduleByUser.value.horaInicio ??
                                      '-',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inicio de refrigerio:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  '${controller.scheduleByUser.value.horaInicioRefrigerio ?? ""} - ${controller.scheduleByUser.value.horaFinRefrigerio ?? ""}',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tiempo de refrigerio:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  '${controller.scheduleByUser.value.tiempoRefrigerio != null ? controller.scheduleByUser.value.tiempoRefrigerio.toString() + " minutos" : "-"}',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salida:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  controller.scheduleByUser.value.horaFin ??
                                      '-',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Descanso:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                  controller.scheduleByUser.value.descanso ??
                                      '-',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Día con horario diferente:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                  controller
                                          .scheduleByUser.value.diaExcepcion ??
                                      '-',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horario diferente:',
                              style: AppTextStyle(context).bold14(
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                  '${controller.scheduleByUser.value.hraInicioExcepcion ?? ""} - ${controller.scheduleByUser.value.horaFinExcepcion ?? ""}',
                                  style: AppTextStyle(context).medium14(
                                    color: AppColors.grayBlue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ) */
            ));
  }
}
