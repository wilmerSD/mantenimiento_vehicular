import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/myrequest_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTablePermissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestController>(
      init: MyRequestController(),
      builder: ((controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: 300.0,
                      columns: [
                        CustomColumn("#",
                            columnSize: ColumnSize.XS, isCenter: true),
                        CustomColumn("Fecha de registro",
                            columnSize: ColumnSize.S),
                        CustomColumn("Fecha de solicitud\nde permiso",
                            columnSize: ColumnSize.S),
                        CustomColumn("Motivo", columnSize: ColumnSize.L),
                        CustomColumn("Estado", columnSize: ColumnSize.S),
                      ].where((element) => !element.isObscure!).toList(),
                      rows: List<CustomRow>.generate(
                        controller.getAllMyRequestResponse.length,
                        (index) {
                          final item =
                              controller.getAllMyRequestResponse[index];

                          return CustomRow(
                            cells: [
                              CustomCell("",
                                  isText: false,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('${item.id ?? 0}'))),
                              CustomCell(item.fecha != null
                                  ? DateTime.parse(
                                          item.fecha!.toIso8601String())
                                      .toString()
                                      .split(" ")[0]
                                  : ''),
                              CustomCell(item.fechaPermiso != null
                                  ? item.fechaPermiso!.substring(0, 10)
                                  : ''),
                              CustomCell(item.motivo ?? ''),
                              CustomCell(item.descripcionEstadoSolicitud ?? ""),
                            ].where((element) => !element.isObscure!).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  controller.getAllMyRequestResponse.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                                        controller.getAllMyRequest(true);
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
                                        controller.getAllMyRequest(true);
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
