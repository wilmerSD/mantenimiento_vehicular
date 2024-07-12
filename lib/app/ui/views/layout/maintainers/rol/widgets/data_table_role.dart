import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/rol/role_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/rol/widgets/edit_role.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableRole extends StatelessWidget {
  const DataTableRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoleController>(
      init: RoleController(),
      builder: ((controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusBetweenMedionAndNormal))),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Column(
              children: [
                Expanded(
                  child: TablePrimary(
                    minWidth: minWidthNormalTable,
                    columns: [
                      CustomColumn("Nombre",
                          columnSize: ColumnSize.S, isCenter: true),
                      CustomColumn("Estado",
                          columnSize: ColumnSize.S, isCenter: true),
                      CustomColumn(
                        "Acciones",
                        columnSize: ColumnSize.S,
                        isCenter: true,
                      )
                    ].where((element) => !element.isObscure!).toList(),
                    rows: List<CustomRow>.generate(
                      controller.listRoles.length,
                      (index) {
                        final item = controller.listRoles[index];
                        return CustomRow(
                          cells: [
                            CustomCell(
                              item.nombre ?? '',
                            ),
                            CustomCell('',
                                isText: false,
                                child: item.idEstado == 1
                                    ? Container(
                                        width: kSizekSizeSmallBigWeb,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kPaddingAppLargeApp,
                                            vertical: kPaddingAppSmallApp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(kRadiusBetweenMedionAndNormal),
                                            color: AppColors.degradedActive),
                                        child: Text(
                                          item.descriptionState ?? '',
                                          style: const TextStyle(
                                              color: AppColors.backgroundColor),
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
                                                BorderRadius.circular(kRadiusBetweenMedionAndNormal),
                                            color: AppColors.degradedInactive),
                                        child: Text(
                                          item.descriptionState ?? '',
                                          style: const TextStyle(
                                              color: AppColors.backgroundColor),
                                        ),
                                      )),
                            CustomCell(
                              '',
                              isText: false,
                              child: IconWrapper(
                                onTap: () {
                                  controller.passInformation(
                                      item.idRol ?? 0,
                                      item.nombre ?? '',
                                      item.descriptionState ?? '',
                                      item.idEstado ?? 0);
                                  HelpersComponents.getModal(
                                      barrierDismissible: true,
                                      context,
                                      const EditRole());
                                },
                                child: const Tooltip(
                                  message: 'Editar',
                                  child: Icon(Iconsax.edit,
                                      color: AppColors.blueDark),
                                ),
                              ),
                            ),
                          ].where((element) => !element.isObscure!).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
