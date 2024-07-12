import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddSchedule extends StatelessWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulesController>(
        init: SchedulesController(),
        builder: (controller) {
          final keyForm = GlobalKey<FormState>();

          //Elements
          /* 📌 Para ingresar hora de entrada */
          Widget entryTime = InputPrimary(
            readOnly: true,
            hintText: "00:00",
            label: "Hora de entrada",
            maxLength: 10,
            textEditingController: controller.entryTime,
            onChanged: (value) {
              controller.entryTime.value;
            },
            validator: (date) {
              if (Helpers.compareTimes(controller.entryTime.text,
                      controller.departureTime.text) >
                  0) {
                return "La hora de entrada no puede ser mayor a la hora de salida";
              }
              return null;
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    String formattedTime = pickedTime.format(context);

                    controller.entryTime.text = formattedTime;
                  }
                },
                child: const Icon(
                  Iconsax.clock,
                  color: AppColors.blueDark,
                )),
          );

          /* 📌 Para ingresar hora de salida */
          Widget departureTime = InputPrimary(
            readOnly: true,
            hintText: "00:00",
            label: "Hora de salida",
            maxLength: 10,
            textEditingController: controller.departureTime,
            onChanged: (value) {
              controller.departureTime.value;
            },
            validator: (date) {
              if (Helpers.compareTimes(controller.entryTime.text,
                      controller.departureTime.text) >
                  0) {
                return "La hora de entrada no puede ser mayor a la hora de salida";
              }
              return null;
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    String formattedTime = pickedTime.format(context);

                    controller.departureTime.text = formattedTime;
                  }
                },
                child: const Icon(
                  Iconsax.clock,
                  color: AppColors.blueDark,
                )),
          );

          /* 📌 Para ingresar día de descanso*/
          Widget breakTime = Obx(
            () => Select(
              label: "Descanso",
              value: controller.listBreak.firstWhere(
                  (element) => element.value == controller.currentBreaks.value),
              items: controller.listBreak.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentBreaks.value =
                    (newValue as DatumSelect2Combo).value!;
              },
            ),
          );

          /* 📌 Para seleccionar estado */
          Widget status = Obx(
            () => Select(
              label: "Estado",
              value: controller.listStatus.firstWhere((element) =>
                  element.idEstado == controller.currentStatus.value),
              items: controller.listStatus.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.descripcion),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentStatus.value =
                    (newValue as DatumAllStateGeneral).idEstado!;
              },
            ),
          );

          /* 📌 Para ingresar el día con horario diferente */
          Widget dayException = Obx(
            () => Select(
              label: "Día excepción",
              value: controller.listBreak.firstWhere((element) =>
                  element.value == controller.currentException.value),
              items: controller.listBreak
                  .where(
                      (element) => element.value! >= -1 && element.value! <= 7)
                  .map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentException.value =
                    (newValue as DatumSelect2Combo).value!;
              },
            ),
          );

          /* 📌 Para ingresar hora de ingreso del día con horario diferente */
          Widget entryTimeException = InputPrimary(
            readOnly: true,
            hintText: "00:00",
            label: "Hora de entrada excepción",
            maxLength: 10,
            textEditingController: controller.entryTimeException,
            onChanged: (value) {
              controller.entryTimeException.value;
            },
            validator: (date) {
              if (Helpers.compareTimes(controller.entryTimeException.text,
                      controller.departureTimeException.text) >
                  0) {
                return "La hora de entrada no puede ser mayor a la hora de salida";
              }
              return null;
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    String formattedTime = pickedTime.format(context);

                    controller.entryTimeException.text = formattedTime;
                  }
                },
                child: const Icon(
                  Iconsax.clock,
                  color: AppColors.blueDark,
                )),
          );

          /* 📌 Para ingresar hora de salida del día con horario diferente */
          Widget departureTimeException = InputPrimary(
            readOnly: true,
            hintText: "00:00",
            label: "Hora de salida excepción",
            maxLength: 10,
            textEditingController: controller.departureTimeException,
            onChanged: (value) {
              controller.departureTimeException.value;
            },
            validator: (date) {
              if (Helpers.compareTimes(controller.entryTimeException.text,
                      controller.departureTimeException.text) >
                  0) {
                return "La hora de entrada no puede ser mayor a la hora de salida";
              }
              return null;
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    String formattedTime = pickedTime.format(context);

                    controller.departureTimeException.text = formattedTime;
                  }
                },
                child: const Icon(
                  Iconsax.clock,
                  color: AppColors.blueDark,
                )),
          );

          Widget addTimeBreak = Row(children: [
            Obx(
              () => Checkbox(
                value: controller.statusAddBreak.value,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    controller.toggleCheckRefreshment();
                  }
                },
              ),
            ),
            const Text(
              'Agregar tiempo de refrigerio',
              style: TextStyle(
                  fontSize: 14.0,
                  // fontWeight: FontWeight.w400,
                  color: AppColors.grayMiddle),
            )
          ]);

          /* 📌 Para ingresar minutos de tiempo de break */
          Widget refreshmentTime = InputPrimary(
            hintText: "60",
            label: "Tiempo de break en minutos",
            maxLength: 2,
            textEditingController: controller.timeInMinutesBreak,
            inputFormats: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onChanged: (value) {
              if (controller.timeInMinutesBreak.text == '') {
                controller.timeInMinutesBreakInt = 0;
              }
              controller.timeInMinutesBreakInt =
                  int.parse(controller.timeInMinutesBreak.text);
            },
            validator: (value) {
              if (controller.timeInMinutesBreak.text == '') {
                controller.timeInMinutesBreak.text = '0';
              }
              if (int.parse(controller.timeInMinutesBreak.text) < 30) {
                return "El tiempo de break no puede ser menor a 30 minutos";
              }
              if (int.parse(controller.timeInMinutesBreak.text) > 90) {
                return "El tiempo de break no puede ser mayor a 90 minutos";
              }
              return null;
            },
          );

          /* 📌 Para cerrar*/
          Widget btnclose = BtnCancel(
            text: "Cerrar",
            onTap: () {
              Get.back();
              controller.cleanVariableAddSchedule();
            },
          );

          /* 📌 Para agregar el nuevo horario */
          Widget btnAdd = Expanded(
            child: BtnPrimary(
              text: "Agregar",
              onTap: () async {
                await controller.validateAddSchedule(context);
              },
            ),
          );

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Añadir horario",
                        style: AppTextStyle(context)
                            .bold26(color: AppColors.grayDarkPlus),
                      ),
                      const SizedBox(
                        height: kSizeNormalMediun,
                      ),
                      Form(
                        key: keyForm,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 3, child: entryTime),
                                const SizedBox(width: kSize),
                                Expanded(flex: 3, child: departureTime),
                              ],
                            ),
                            const SizedBox(height: kSize),
                            Row(
                              children: [
                                Expanded(flex: 3, child: breakTime),
                                const SizedBox(width: kSize),
                                Expanded(flex: 3, child: status),
                              ],
                            ),
                            const SizedBox(height: kSize),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Checkbox(
                                            value: controller
                                                .statusException.value,
                                            onChanged: (bool? newValue) {
                                              if (newValue != null) {
                                                controller.toggleCheck();
                                              }
                                            },
                                          ),
                                        ),
                                        const Text(
                                          'Agregar día de excepción',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              // fontWeight: FontWeight.w400,
                                              color: AppColors.grayMiddle),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(height: kSize),
                            Obx(() {
                              controller.cleanVariableException();
                              return controller.statusException.value
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3, child: dayException),
                                            const SizedBox(width: kSize),
                                            Expanded(
                                                flex: 3,
                                                child: entryTimeException),
                                          ],
                                        ),
                                        const SizedBox(height: kSize),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: departureTimeException),
                                            const SizedBox(width: kSize),
                                            const Expanded(
                                                flex: 3, child: SizedBox()),
                                          ],
                                        ),
                                        const SizedBox(height: kSize),
                                      ],
                                    )
                                  : const SizedBox();
                            }),
                            addTimeBreak,
                            const SizedBox(height: kSize),
                            Obx(() => controller.statusAddBreak.value
                                ? refreshmentTime
                                : const SizedBox())
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: kSizeBig,
                      ),
                      Row(
                        children: [
                          const Expanded(flex: 6, child: SizedBox()),
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(child: btnclose),
                                const SizedBox(
                                  width: kSizeBigLittle,
                                ),
                                btnAdd
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Añadir horario",
                            style: AppTextStyle(context)
                                .bold26(color: AppColors.grayDarkPlus),
                          ),
                          const SizedBox(
                            height: kSizeNormalMediun,
                          ),
                          Form(
                            key: keyForm,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 3, child: entryTime),
                                    const SizedBox(width: kSize),
                                    Expanded(flex: 3, child: departureTime),
                                  ],
                                ),
                                const SizedBox(height: kSize),
                                Row(
                                  children: [
                                    Expanded(flex: 3, child: breakTime),
                                    const SizedBox(width: kSize),
                                    Expanded(flex: 3, child: status),
                                  ],
                                ),
                                const SizedBox(height: kSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Obx(
                                              () => Checkbox(
                                                value: controller
                                                    .statusException.value,
                                                onChanged: (bool? newValue) {
                                                  if (newValue != null) {
                                                    controller.toggleCheck();
                                                  }
                                                },
                                              ),
                                            ),
                                            const Text(
                                              'Agregar día de excepción',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  // fontWeight: FontWeight.w400,
                                                  color: AppColors.grayMiddle),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(height: kSize),
                                Obx(() {
                                  controller.cleanVariableException();
                                  return controller.statusException.value
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: dayException),
                                                const SizedBox(width: kSize),
                                                Expanded(
                                                    flex: 3,
                                                    child: entryTimeException),
                                              ],
                                            ),
                                            const SizedBox(height: kSize),
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child:
                                                        departureTimeException),
                                                const SizedBox(width: kSize),
                                                const Expanded(
                                                    flex: 3, child: SizedBox()),
                                              ],
                                            ),
                                            const SizedBox(height: kSize),
                                          ],
                                        )
                                      : const SizedBox();
                                }),
                                addTimeBreak,
                                const SizedBox(height: kSize),
                                Obx(() => controller.statusAddBreak.value
                                    ? refreshmentTime
                                    : const SizedBox())
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: kSizeBig,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 8,
                                child: Row(
                                  children: [
                                    Expanded(child: btnclose),
                                    const SizedBox(
                                      width: kSizeBigLittle,
                                    ),
                                    btnAdd
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        });
  }
}
