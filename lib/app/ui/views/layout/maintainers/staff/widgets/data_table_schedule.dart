import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableSchedule extends StatelessWidget {
  const DataTableSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      init: StaffController(),
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
                        minWidth: minWidthNormalTable,
                        columns: [
                          CustomColumn("Horario", columnSize: ColumnSize.XS),
                          CustomColumn("Hora Entrada",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Hora Salida",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Descanso", columnSize: ColumnSize.S),
                          CustomColumn("Día con horario\ndiferente",
                              columnSize: ColumnSize.S),
                          CustomColumn("Hora Entrada",
                              columnSize: ColumnSize.XS),
                          CustomColumn("Hora Salida",
                              columnSize: ColumnSize.XS),
                        ].where((element) => !element.isObscure!).toList(),
                        rows: List<CustomRow>.generate(
                          controller.scheduleList.length,
                          (index) {
                            final item = controller.scheduleList[index];
                            return CustomRow(
                              userIndex: controller.userIndex.value,
                              onTap: () {
                                controller.userIndex.value = index;
                                controller.idSchedule.value = item.idHorarios;
                              },
                              cells: [
                                CustomCell('H${item.idHorarios}'),
                                CustomCell(item.horaInicio),
                                CustomCell(item.horaFin),
                                CustomCell(item.descanso),
                                CustomCell(item.DiaExcepcion ?? "-"),
                                CustomCell(item.HoraInicio_Excepcion ?? "-"),
                                CustomCell(item.HoraFin_Excepcion ?? "-"),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPaddingAppLittleApp),
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
                              SizedBox(width: kSizeNormalLittle),
                              Row(
                                children: [
                                  SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  /* Obx(
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
                                  ), */
                                ],
                              )
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
