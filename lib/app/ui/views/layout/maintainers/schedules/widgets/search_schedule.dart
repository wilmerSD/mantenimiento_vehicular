import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSchedule extends StatelessWidget {
  const SearchSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulesController>(
        init: SchedulesController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

          /* 📌 Input de horario a buscar */
          Widget inputSchedule = InputPrimary(
              initialValue: "H00",
              /* hintText: "H00", */
              label: "Horario",
              textEditingController: controller.scheduleFilter,
              validator: (value) {
                return Helpers.simplerequiredRegex(
                    value, RegExp(r'^H\d{1,}$'), "Formato inválido");
              });

          /* 📌 Input de horario a buscar */
          Widget status = Obx(
            () => Select(
              label: "Estado",
              value: controller.listStatus.firstWhere((element) =>
                  element.idEstado == controller.currentStatusFilter.value),
              items: controller.listStatus.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.descripcion),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentStatusFilter.value =
                    (newValue as DatumAllStateGeneral).idEstado!;
              },
            ),
          );

          Widget btnClean = BtnCancel(
            text: "Limpiar",
            onTap: () async {
              controller.cleanVariableFilter();
              await controller.allSchedule();
            },
          );

          Widget btnSearch = BtnPrimary(
              text: "Buscar",
              onTap: () async {
                await controller.validateFilterSchedule();
              });

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: inputSchedule),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 2, child: status),
                                const Expanded(flex: 2, child: SizedBox()),
                                Expanded(flex: 1, child: btnSearch),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 1, child: btnClean),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: inputSchedule),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 2, child: status),
                              ],
                            ),
                            const SizedBox(
                              height: kSizeBigLittle,
                            ),
                            Row(
                              children: [
                                Expanded(flex: 2, child: btnSearch),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 2, child: btnClean),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        });
  }
}
