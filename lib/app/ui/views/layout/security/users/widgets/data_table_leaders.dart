import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableLeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      init: UsersController(),
      builder: ((controller) => Container(
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius:
                    BorderRadius.circular(kRadiusBetweenMedionAndNormal)),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: minWidthLittleTable,
                      columns: [
                        CustomColumn("#",
                            columnSize: ColumnSize.XS, isCenter: true),
                        CustomColumn("Nombres", columnSize: ColumnSize.S),
                        CustomColumn("Apellidos", columnSize: ColumnSize.S),
                        CustomColumn("Estado", columnSize: ColumnSize.XS),
                        CustomColumn("Nro. documento",
                            columnSize: ColumnSize.S),
                        CustomColumn("Perfil", columnSize: ColumnSize.XS),
                      ].where((element) => !element.isObscure!).toList(),
                      rows: List<CustomRow>.generate(
                        controller.leadersList.length,
                        (index) {
                          final item = controller.leadersList[index];
                          return CustomRow(
                            userIndex: controller.userIndex.value,
                            onTap: () {
                              controller.userIndex.value = index;
                              controller.leaderToAsigned.value =
                                  item.idUsuarios ?? 0;
                            },
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
                              CustomCell(item.dni ?? ""),
                              CustomCell(item.rol ?? ""),
                            ].where((element) => !element.isObscure!).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  controller.leadersList.isEmpty
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
                                  /* "${controller.pageIndex2} - ${controller.countPage2} de ${controller.countItem2} registro(s)", */
                                  "Registros por pág: ${controller.countItem2} | ${controller.pageIndex2} - ${controller.countPage2} páginas",
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
                                      isActive: controller.pageIndex2 > 1,
                                      onTap: () {
                                        controller.page2--;
                                        controller.getAllLeaders(true);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: kSizeLittle,
                                  ),
                                  Obx(
                                    () => PaginatorButton(
                                      isBack: false,
                                      isActive: controller.pageIndex2 <
                                          controller.countPage2.value,
                                      onTap: () {
                                        controller.page2++;
                                        controller.getAllLeaders(true);
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
