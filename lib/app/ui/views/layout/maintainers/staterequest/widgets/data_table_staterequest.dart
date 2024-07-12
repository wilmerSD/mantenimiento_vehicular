import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/staterequest_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/widgets/edit_staterequest.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableStateRequest extends StatelessWidget {
  const DataTableStateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StateRequestController>(
      init: StateRequestController(),
      builder: ((controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(kRadiusBetweenMedionAndNormal))),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Column(
              children: [
                Expanded(
                  child: TablePrimary(
                    minWidth: minWidthNormalTable,
                    columns: [
                      CustomColumn("Cliente",
                          columnSize: ColumnSize.S, isCenter: true),
                      CustomColumn("Vehículo",
                          columnSize: ColumnSize.S, isCenter: true),
                      CustomColumn("Estado",
                          columnSize: ColumnSize.S, isCenter: true),
                      CustomColumn(
                        "Actualizar estado mantenimiento",
                        columnSize: ColumnSize.S,
                        isCenter: true,
                      )
                    ].where((element) => !element.isObscure!).toList(),
                    rows: List<CustomRow>.generate(
                      3,
                      (index) {
                        final item = controller.listStateRequest[index];
                        return CustomRow(
                          cells: [
                            CustomCell(
                              item.descripcion ?? '',
                            ),
                            CustomCell(
                              item.vehiculo ?? '',
                            ),
                            CustomCell('',
                                isText: false,
                                child: item.idEstado == 1
                                    ? Container(
                                        width: kSizekSizeSmallBigWeb,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: kPaddingAppSmallApp),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                kRadiusBetweenMedionAndNormal),
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
                                            horizontal: 10,
                                            vertical: kPaddingAppSmallApp),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                kRadiusBetweenMedionAndNormal),
                                            color: AppColors.blueRecoverPass),
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
                                      item.idEstadoSolicitud ?? 0,
                                      item.descripcion ?? '',
                                      item.descripcion ?? '',
                                      item.idEstado ?? 0);
                                  HelpersComponents.getModal(
                                      barrierDismissible: true,
                                      context,
                                      const EditStateRequest());
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
                /* controller.listTypesMarking.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => Text(
                                  /* "${(controller.page - 1) * kSizePage + 1} - ${(controller.page - 1) * kSizePage + controller.usersList.length} de ${controller.countPage} registro(s)", */
                                  "${controller.pageIndex} - ${controller.countPage} de ${controller.countItem} registro(s)",
                                  style: const TextStyle(
                                      color: AppColors.grayMiddle,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
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
                                    width: 5.0,
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
                        ), */
              ],
            ),
          )),
    );
  }
}
