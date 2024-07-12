import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/widgets/select_schedule.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DataTableStaff extends StatelessWidget {
  const DataTableStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      init: StaffController(),
      builder: ((controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(kRadiusBetweenMedionAndNormal))),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: minWidthSmallTable,
                      columns: [
                        CustomColumn("#",
                            columnSize: ColumnSize.XS, isCenter: true),
                        CustomColumn("Nombres", columnSize: ColumnSize.S),
                        CustomColumn("Apellido", columnSize: ColumnSize.S),
                        CustomColumn("Estado", columnSize: ColumnSize.XS),
                        CustomColumn("DNI", columnSize: ColumnSize.XS),
                        CustomColumn("Rol", columnSize: ColumnSize.XS),
                        CustomColumn("Horario\nasignado",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Horario por\nasignar",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Fecha de asignación\nde nuevo horario",
                            columnSize: ColumnSize.S),
                        CustomColumn("Modificado por",
                            columnSize: ColumnSize.S),
                        CustomColumn(
                          "Acciones",
                          columnSize: ColumnSize.XS,
                          isCenter: true,
                        )
                      ].where((element) => !element.isObscure!).toList(),
                      rows: List<CustomRow>.generate(
                        controller.usersList.length,
                        (index) {
                          final item = controller.usersList[index];
                          return CustomRow(
                            cells: [
                              CustomCell("",
                                  isText: false,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('${item.idUsuarios ?? 0}'))),
                              CustomCell(item.nombres ?? ""),
                              CustomCell(item.apellidos ?? ""),
                              CustomCell('',
                                  isText: false,
                                  child: item.idEstado == 1
                                      ? Container(
                                          width: kSizekSizeSmallBigWeb,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kPaddingAppLargeApp,
                                              vertical: kPaddingAppSmallApp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  kRadiusBetweenMedionAndNormal),
                                              color: AppColors.degradedActive),
                                          child: Text(
                                            item.estado ?? '',
                                            style: const TextStyle(
                                                color:
                                                    AppColors.backgroundColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : Container(
                                          width: kSizekSizeSmallBigWeb,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kPaddingAppLargeApp,
                                              vertical: kPaddingAppSmallApp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  kRadiusBetweenMedionAndNormal),
                                              color:
                                                  AppColors.degradedInactive),
                                          child: Text(
                                            item.estado ?? '',
                                            style: const TextStyle(
                                                color:
                                                    AppColors.backgroundColor),
                                          ),
                                        )),
                              CustomCell(item.usuario ?? ""),
                              CustomCell(item.rol ?? ""),
                              CustomCell('H${item.idHorarios.toString()}'),
                              CustomCell(item.scheduleTobeAssigned != null
                                  ? 'H${item.scheduleTobeAssigned}'
                                  : ''),
                              CustomCell(item.fecha != null
                                  ? DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(
                                          item.fecha!.substring(0, 10)))

                                  /* Helpers.changeDateToddMMyyyy(
                                      item.fecha!.substring(0, 10)) */
                                  : ''),
                              CustomCell(
                                  '${item.nombresAsignador ?? ''} ${item.apellidosAsignador ?? ''}'),
                              CustomCell(
                                '',
                                isText: false,
                                child: IconWrapper(
                                  onTap: () {
                                    controller.idUser.value =
                                        item.idUsuarios ?? 0;
                                    controller.userIndex.value =
                                        item.idHorarios! - 1;
                                    controller.namesEmployee.value =
                                        item.nombres! + " " + item.apellidos!;
                                    /* print(controller.userIndex); */

                                    HelpersComponents.getModal(
                                        context, const SelectSchedule());
                                  },
                                  child: const Tooltip(
                                    message: 'Editar',
                                    child: Icon(Iconsax.edit,
                                        color: AppColors.blueDark,
                                        size: kSizeBigLittle),
                                  ),
                                ),
                              ),
                            ].where((element) => !element.isObscure!).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  controller.usersList.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPaddingAppLittleApp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => Text(
                                  /* "${(controller.page - 1) * kSizePage + 1} - ${(controller.page - 1) * kSizePage + controller.usersList.length} de ${controller.countPage} registro(s)", */
                                  /* "${controller.pageIndex} - ${controller.countPage} de ${controller.countItem} registro(s)", */
                                  "Registros por pág: ${controller.countItem} | ${controller.pageIndex} - ${controller.countPage} páginas",
                                  style: const TextStyle(
                                      color: AppColors.grayMiddle,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(width: kSizeNormalLittle),
                              Row(
                                children: [
                                  const SizedBox(
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
                                    width: kSizeLittle,
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
