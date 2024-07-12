import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableUsersRequest extends StatelessWidget {
  const DataTableUsersRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
      init: RequestController(),
      builder: ((controller) => Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColorModal,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: minWidthNormalTable,
                      columns: [
                        CustomColumn("#",
                            columnSize: ColumnSize.XS, isCenter: true),
                        CustomColumn("Nombres", columnSize: ColumnSize.S),
                        CustomColumn("Apellidos", columnSize: ColumnSize.S),
                        /* CustomColumn("Área", columnSize: ColumnSize.XS), */
                        CustomColumn("Nro. documento",
                            columnSize: ColumnSize.S),
                        CustomColumn("Perfil", columnSize: ColumnSize.XS),
                        CustomColumn(
                          "Estado",
                          columnSize: ColumnSize.XS,
                          isCenter: true,
                        )
                      ].where((element) => !element.isObscure!).toList(),
                      rows: List<CustomRow>.generate(
                        controller.usersList.length,
                        (index) {
                          final item = controller.usersList[index];
                          final adjustedIndex =
                              (controller.currentPage.value - 1) * kSizePage +
                                  index +
                                  1;
                          return CustomRow(
                            userIndex: controller.userIndex.value,
                            onTap: () {
                              controller.userIndex.value = index;
                              controller.userSelected.value =
                                  item.idUsuarios ?? 0;
                              controller.passInformationOfDataTable(
                                  item.idUsuarios ?? 0,
                                  item.nombres ?? '',
                                  item.apellidos ?? '',
                                  item.estado ?? '',
                                  item.dni ?? '',
                                  item.rol ?? '',
                                  item.modalidad ?? '',
                                  item.idHorarios ?? 0);
                            },
                            cells: [
                              CustomCell("",
                                  isText: false,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('${item.idUsuarios ?? 0}'))),
                              CustomCell(item.nombres ?? ""),
                              CustomCell(item.apellidos ?? ""),
                              /* CustomCell(item.estado ?? ""), */
                              CustomCell(item.dni ?? ""),
                              CustomCell(item.rol ?? ""),
                              /* CustomCell(item.estado ?? ''), */
                              CustomCell('',
                                  isText: false,
                                  child: item.idEstado == 1
                                      ? Container(
                                          width:
                                              kSizeContainersActivesInactives,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: kMarginSmallApp),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kPaddingAppLittleApp,
                                              vertical: kPaddingAppSmallApp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  kRadiusBetweenMedionAndNormal),
                                              color: AppColors.degradedActive),
                                          child: Center(
                                            child: Text(
                                              item.estado ?? '',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width:
                                              kSizeContainersActivesInactives,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: kMarginSmallApp),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kPaddingAppLittleApp,
                                              vertical: kPaddingAppSmallApp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  kRadiusBetweenMedionAndNormal),
                                              color:
                                                  AppColors.degradedInactive),
                                          child: Center(
                                            child: Text(
                                              item.estado ?? '',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundColor),
                                            ),
                                          ),
                                        )),
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
                              const SizedBox(width: kSize),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: kSize,
                                  ),
                                  Obx(
                                    () => PaginatorButton(
                                      isBack: true,
                                      isActive: controller.pageIndex > 1,
                                      onTap: () {
                                        controller.page--;
                                        controller.listUser(true);
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
                                        controller.listUser(true);
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
