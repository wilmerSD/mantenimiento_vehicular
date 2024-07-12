import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_view.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableHistorical extends StatelessWidget {
  const DataTableHistorical({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: ((controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: 1000.0,
                      columns: [
                        CustomColumn("#",
                            columnSize: ColumnSize.XS, isCenter: true),
                        CustomColumn("Nombres", columnSize: ColumnSize.S),
                        CustomColumn("Apellidos", columnSize: ColumnSize.S),
                        CustomColumn("Estado", columnSize: ColumnSize.XS),
                        CustomColumn("Nro. documento",
                            columnSize: ColumnSize.S),
                        CustomColumn("Perfil", columnSize: ColumnSize.XS),
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
                                      child: Text('${item.idUsuarios}'))),
                              CustomCell(item.nombres ?? ""),
                              CustomCell(item.apellidos ?? ""),
                              /* CustomCell(item.estado ?? ""), */
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
                              CustomCell(item.dni ?? ""),
                              CustomCell(item.rol ?? ""),
                              CustomCell(
                                '',
                                /* child: const Icon(Iconsax.calendar), */
                                isText: false,
                                child: IconWrapper(
                                  onTap: () {
                                    controller.idEmployee.value =
                                        item.idUsuarios ?? 0;
                                    /* controller.informationOneUser(); */
                                    controller.userIndex.value =
                                        item.idHorarios! - 1;
                                    controller.namesEmployee.value =
                                        "${item.nombres} ${item.apellidos}";
                                    /* print(controller.userIndex); */
                                    controller.typesValidationsuser2();
                                    controller.getScheduleByUser();
                                    HelpersComponents.getModal(
                                        barrierDismissible: true,
                                        context,
                                        const DetailView());
                                  },
                                  child: const Tooltip(
                                    message: 'Revisar',
                                    child: Icon(Iconsax.book,
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
                  controller.usersList.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kSizeLittle),
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
