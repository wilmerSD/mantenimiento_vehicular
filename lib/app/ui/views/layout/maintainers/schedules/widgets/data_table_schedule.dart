import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableSchedule extends StatelessWidget {
  const DataTableSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulesController>(
      init: SchedulesController(),
      builder: ((controller) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                kRadiusBetweenMedionAndNormal,
              ),
            ),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => TablePrimary(
                        minWidth: minWidthSmallLittleTables,
                        columns: [
                          CustomColumn("Horario", columnSize: ColumnSize.XS),
                          CustomColumn("Hora Entrada",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Rango para\nRefrigerio",
                              columnSize: ColumnSize.S),
                          CustomColumn("Hora Salida",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Descanso", columnSize: ColumnSize.S),
                          CustomColumn("Día excepción",
                              columnSize: ColumnSize.S),
                          CustomColumn("Hora Entrada\nExcepción",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Hora Salida\nExcepción",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Estado", columnSize: ColumnSize.XS),
                          CustomColumn(
                            "Activar/Desactivar",
                            columnSize: ColumnSize.S,
                            isCenter: true,
                          )
                        ].where((element) => !element.isObscure!).toList(),
                        rows: List<CustomRow>.generate(
                          controller.scheduleList.length,
                          (index) {
                            final item = controller.scheduleList[index];
                            /* final adjustedIndex =
                                (controller.currentPage.value - 1) * kSizePage +
                                    index +
                                    1; */
                            return CustomRow(
                              cells: [
                                CustomCell('H${item.idHorarios}'),
                                CustomCell(item.horaInicio),
                                CustomCell('${item.horaInicioRefrigerio ?? "-"}'
                                    ' - '
                                    '${item.horaFinRefrigerio ?? "-"}'),
                                CustomCell(item.horaFin),
                                CustomCell(item.descanso),
                                CustomCell(item.DiaExcepcion ?? "-"),
                                CustomCell(item.HoraInicio_Excepcion ?? "-"),
                                CustomCell(item.HoraFin_Excepcion ?? "-"),
                                CustomCell('',
                                    isText: false,
                                    child: item.IdEstado == 1
                                        ? Container(
                                            width: kSizekSizeSmallBigWeb,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: kPaddingAppLargeApp,
                                                vertical: kPaddingAppSmallApp),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color:
                                                    AppColors.degradedActive),
                                            child: Text(
                                              item.Descripcion,
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : Container(
                                            width: kSizekSizeSmallBigWeb,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: kPaddingAppLargeApp,
                                                vertical: kPaddingAppSmallApp),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color:
                                                    AppColors.degradedInactive),
                                            child: Text(
                                              item.Descripcion,
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundColor),
                                            ),
                                          )),
                                CustomCell('',
                                    isText: false,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        item.IdEstado == 1
                                            ? const IconWrapper(
                                                child: Tooltip(
                                                  message: 'Activar',
                                                  child: Icon(
                                                    Icons.check_circle_outline,
                                                    color: AppColors
                                                        .validationTimely,
                                                  ),
                                                ),
                                              )
                                            : IconWrapper(
                                                onTap: () {
                                                  controller.idSchedulesActivate
                                                      .value = item.idHorarios;
                                                  controller
                                                      .statusSchedulesActivate
                                                      .value = 1;
                                                  Get.dialog(
                                                      AlertDialogComponent(
                                                          headerTitle:
                                                              "¿Está seguro de activar este horario?",
                                                          title:
                                                              "Dale a continuar para activar el horario",
                                                          onTapButton:
                                                              () async {
                                                            await controller
                                                                .activateSchedule();
                                                            controller
                                                                    .isLoadingActivateSchedule
                                                                    .value
                                                                ? const Center(
                                                                    child:
                                                                        CircularProgressIndicator())
                                                                : controller
                                                                        .statusActivateSchedule
                                                                        .value
                                                                    ? {
                                                                        Get.back(),
                                                                        controller.showToastNow(
                                                                            0,
                                                                            "success",
                                                                            controller.statusMessageActivateSchedule.value),
                                                                        controller
                                                                            .cleanVariableAddSchedule(),
                                                                        controller
                                                                            .cleanVariableFilter(),
                                                                        await controller
                                                                            .allSchedule(),
                                                                      }
                                                                    : {
                                                                        Get.back(),
                                                                        controller.showToastNow(
                                                                            2,
                                                                            "warning",
                                                                            controller.statusMessageActivateSchedule.value)
                                                                      };
                                                          },
                                                          textPrimaryButton:
                                                              "Continuar",
                                                          textSecondaryButton:
                                                              "Cancelar",
                                                          onTapButtonSecondary:
                                                              () {
                                                            Get.back();
                                                          }));
                                                },
                                                child: const Tooltip(
                                                  message: 'Activar',
                                                  child: Icon(
                                                    Icons.check_circle_outline,
                                                    color: AppColors
                                                        .validationTimely,
                                                  ),
                                                ),
                                              ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        item.IdEstado == 1
                                            ? IconWrapper(
                                                onTap: () {
                                                  controller.idSchedulesActivate
                                                      .value = item.idHorarios;
                                                  controller
                                                      .statusSchedulesActivate
                                                      .value = 0;
                                                  Get.dialog(
                                                      AlertDialogComponent(
                                                          headerTitle:
                                                              "¿Está seguro de desactivar este horario?",
                                                          title:
                                                              "Recuerda que para desactivar un horario no\ndebe haber usuarios asisgnados a dicho horario",
                                                          onTapButton:
                                                              () async {
                                                            await controller
                                                                .activateSchedule();
                                                            controller
                                                                    .isLoadingActivateSchedule
                                                                    .value
                                                                ? const Center(
                                                                    child:
                                                                        CircularProgressIndicator())
                                                                : controller
                                                                        .statusActivateSchedule
                                                                        .value
                                                                    ? {
                                                                        Get.back(),
                                                                        controller.showToastNow(
                                                                            0,
                                                                            "success",
                                                                            controller.statusMessageActivateSchedule.value),
                                                                        controller
                                                                            .cleanVariableAddSchedule(),
                                                                        controller
                                                                            .cleanVariableFilter(),
                                                                        await controller
                                                                            .allSchedule(),
                                                                      }
                                                                    : {
                                                                        Get.back(),
                                                                        controller.showToastNow(
                                                                            2,
                                                                            "warning",
                                                                            controller.statusMessageActivateSchedule.value)
                                                                      };
                                                          },
                                                          textPrimaryButton:
                                                              "Continuar",
                                                          textSecondaryButton:
                                                              "Cancelar",
                                                          onTapButtonSecondary:
                                                              () {
                                                            Get.back();
                                                          }));
                                                },
                                                child: const Tooltip(
                                                  message: 'Desactivar',
                                                  child: Icon(
                                                      Iconsax.close_circle,
                                                      color: AppColors
                                                          .validationMissing),
                                                ),
                                              )
                                            : const IconWrapper(
                                                child: Tooltip(
                                                  message: 'Desactivar',
                                                  child: Icon(
                                                      Iconsax.close_circle,
                                                      color: AppColors
                                                          .validationMissing),
                                                ),
                                              )
                                      ],
                                    ))
                              ]
                                  .where((element) => !element.isObscure!)
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  controller.usersList.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: kPaddingAppLittleApp),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /* Obx(
                                () => Text(
                                  /* "${(controller.page - 1) * kSizePage + 1} - ${(controller.page - 1) * kSizePage + controller.usersList.length} de ${controller.countPage} registro(s)", */
                                  "${controller.pageIndex} - ${controller.countPage} de ${controller.countItem} registro(s)",
                                  style: const TextStyle(
                                      color: AppColors.grayMiddle,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ), */
                              /* SizedBox(width: kSizeNormalLittle), */
                              /* Row(
                                children: [
                                  SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                   Obx(
                                    () => PaginatorButton(
                                      isBack: true,
                                      isActive: controller.pageIndex > 1,
                                      onTap: () {
                                        controller.page--;
                                        controller.listUserFilter(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Obx(
                                    () => PaginatorButton(
                                      isBack: false,
                                      isActive: controller.pageIndex <
                                          controller.countPage.value,
                                      onTap: () {
                                        controller.page++;
                                        controller.listUserFilter(true);
                                      },
                                    ),
                                  ),
                                ],
                              ) */
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )),
    );
  }
}
