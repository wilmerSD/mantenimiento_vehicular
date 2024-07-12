import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/widgets/edit_markingtype.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableMarkingType extends StatelessWidget {
  const DataTableMarkingType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(
      init: MarkingTypeController(),
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
                      controller.listTypesMarking.length,
                      (index) {
                        final item = controller.listTypesMarking[index];
                        return CustomRow(
                          cells: [
                            CustomCell(
                              item.descripcion ?? '',
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
                                    item.idTMarcaciones ?? 0,
                                      item.descripcion ?? '',
                                      item.descripcion ?? '',
                                      item.idEstado ?? 0);
                                  HelpersComponents.getModal(
                                      barrierDismissible: true,
                                      context,
                                      const EditMarkingType());
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
