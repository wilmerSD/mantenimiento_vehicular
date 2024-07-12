import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/new_checkbox.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DataTableJustificationsManagement extends StatelessWidget {
  const DataTableJustificationsManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(
      init: RequestManagementController(),
      builder: ((controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(kRadiusBetweenMedionAndNormal)),
            padding: const EdgeInsets.all(kPaddingAppMediunApp),
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: TablePrimary(
                      minWidth: minWidthNormalLittleTable,
                      columns: [
                        CustomColumn("",
                            isText: false,
                            /* isObscure: Helpers.getObscureProperty(
                                SesionDataTemporary.data["PRFLES-CHANGE_STATE"],
                              ), */
                            fixedWidth: 20.0,
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: NewCheckbox(
                                bordecolor: Colors.white,
                                value: controller.isCheckHeader.value,
                                onChanged: (value) {
                                  controller.checkAllRow(
                                    !controller.isCheckHeader.value,
                                  );
                                },
                              ),
                            ),
                            columnSize: ColumnSize.XXS),
                        CustomColumn("#",
                            isCenter: true, columnSize: ColumnSize.XXS),
                        CustomColumn("Nombres y apellidos",
                            columnSize: ColumnSize.S),
                        CustomColumn("Nro documento", columnSize: ColumnSize.S),
                        CustomColumn("Fecha", columnSize: ColumnSize.XS),
                        CustomColumn("Hora", columnSize: ColumnSize.XS),
                        CustomColumn("Tipo Marcación",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Hora Entrada", columnSize: ColumnSize.XS),
                        CustomColumn("Hora Salida", columnSize: ColumnSize.XS),
                        CustomColumn("Día Irregular",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Hora Entrada\nDía irregular",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Hora Salida\nDía irregular",
                            columnSize: ColumnSize.XS),
                        CustomColumn("Estado", columnSize: ColumnSize.XS),
                        CustomColumn("Aprodado/rechazado\npor el lider",
                            columnSize: ColumnSize.S),
                        CustomColumn("Aprodado/rechazado\npor RRHH o Gerencia",
                            columnSize: ColumnSize.S),
                        CustomColumn(
                            isCenter: true,
                            "Motivo",
                            columnSize: ColumnSize.XS),
                        CustomColumn(
                          "Acciones",
                          columnSize: ColumnSize.XS,
                          isCenter: true,
                        )
                      ].where((element) => !element.isObscure!).toList(),
                      rows: List<CustomRow>.generate(
                        controller.listRequest.length,
                        (index) {
                          final item = controller.listRequest[index];
                          return CustomRow(
                            cells: [
                              CustomCell(
                                "",
                                isText: false,
                                child: NewCheckbox(
                                  value: item.isCheck!,
                                  onChanged: (value) {
                                    controller.checkItemRow(index);
                                  },
                                ), /* const Checkbox(value: false, onChanged: null)*/
                              ),
                              CustomCell('${item.id ?? ''}'),
                              CustomCell(
                                  "${item.nombreTrabajador ?? ''} ${item.apellidosTrabajador ?? ''} "),
                              CustomCell(item.dni ?? ''),
                              CustomCell(item.fecha != null
                                  ? DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(
                                          item.fecha!.toIso8601String()))
                                  : ''),
                              CustomCell(item.hora ?? ''),
                              CustomCell(item.descripcionTipoMarcacion ?? ''),
                              CustomCell(item.horaInicio ?? ''),
                              CustomCell(item.horaFin ?? ''),
                              CustomCell(item.dia ?? '-'),
                              CustomCell(item.horaInicioExcepcion ?? '-'),
                              CustomCell(item.horaFinExcepcion ?? '-'),
                              CustomCell('',
                                  isText: false,
                                  child: item.estadoSolicitudF == 1
                                      ? Container(
                                          width:
                                              kSizeContainersActivesInactives,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: kMarginSmallApp),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: kPaddingAppLittleApp,
                                              vertical: kPaddingAppLittleApp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  kRadiusBetweenMedionAndNormal),
                                              color: AppColors.stateInProcess),
                                          child: Center(
                                            child: Text(
                                              item.descripcionEstadoSolicitud ??
                                                  '',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : item.estadoSolicitudF == 2
                                          ? Container(
                                              width:
                                                  kSizeContainersActivesInactives,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical:
                                                          kMarginSmallApp),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical:
                                                          kPaddingAppSmallApp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      AppColors.degradedActive),
                                              child: Center(
                                                child: Text(
                                                  item.descripcionEstadoSolicitud ??
                                                      '',
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical:
                                                          kMarginSmallApp),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical:
                                                          kPaddingAppSmallApp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors
                                                      .degradedInactive),
                                              child: Center(
                                                child: Text(
                                                  item.descripcionEstadoSolicitud ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .backgroundColor),
                                                ),
                                              ),
                                            )),
                              CustomCell(
                                  "${item.nombreActualizadoPorF ?? ''} ${item.apellidosActualizadoPorF ?? ''}"),
                              CustomCell(
                                  "${item.nombreActualizadoPorS ?? ''} ${item.apellidosActualizadoPorS ?? ''}"),
                              CustomCell(
                                '',
                                isText: false,
                                child: IconWrapper(
                                  onTap: () {
                                    Get.dialog(AlertDialogComponent(
                                      isOnlyPrimary: true,
                                      headerTitle:
                                          "Motivo                       ",
                                      widgetContent: Text(
                                        item.motivo ?? '',
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.justify,
                                        style: AppTextStyle(context).medium12(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      onTapButton: () async {
                                        Get.back();
                                      },
                                      textPrimaryButton: "Ok",
                                    ));
                                  },
                                  child: const Tooltip(
                                    message: 'Ver detalle',
                                    child: Icon(
                                      Iconsax.book_1,
                                      color: AppColors.blueDark,
                                    ),
                                  ),
                                ),
                              ),
                              CustomCell('',
                                  isText: false,
                                  child: controller.isToLeader.value
                                      ? item.estadoSolicitudF == 1
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconWrapper(
                                                  onTap: () {
                                                    Get.dialog(
                                                        AlertDialogComponent(
                                                            headerTitle:
                                                                "¿Está seguro de aceptar la justificación?",
                                                            /* title:
                                                                "Confirmar aceptación de justificación", */
                                                            onTapButton:
                                                                () async {
                                                              List<int>
                                                                  idRequestItem =
                                                                  [
                                                                item.id ?? 0
                                                              ];
                                                              controller
                                                                  .updateStateOfRequest(
                                                                      2, false,
                                                                      idRequest:
                                                                          idRequestItem);
                                                              Get.back();
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
                                                    message: 'Aprobar',
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_outline,
                                                      color: AppColors
                                                          .validationTimely,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: kSizeLittle,
                                                ),
                                                IconWrapper(
                                                  onTap: () {
                                                    Get.dialog(
                                                        AlertDialogComponent(
                                                            headerTitle:
                                                                "¿Está seguro de rechazar la justificación?",
                                                            /* title:
                                                                "Confirmar rechazo de justificación", */
                                                            onTapButton:
                                                                () async {
                                                              List<int>
                                                                  idRequestItem =
                                                                  [
                                                                item.id ?? 0
                                                              ];
                                                              controller
                                                                  .updateStateOfRequest(
                                                                      3, false,
                                                                      idRequest:
                                                                          idRequestItem);
                                                              Get.back();
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
                                                    message: 'Rechazar',
                                                    child: Icon(
                                                        Iconsax.close_circle,
                                                        color: AppColors
                                                            .validationMissing),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : item.estadoSolicitudF == 2
                                              ? const Icon(
                                                  Iconsax.copy_success,
                                                  color: AppColors.primary,
                                                )
                                              : const Icon(Iconsax.close_circle)
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconWrapper(
                                              onTap: () {
                                                Get.dialog(AlertDialogComponent(
                                                    headerTitle:
                                                        "¿Está seguro de aceptar la justificación?",
                                                    /*  title:
                                                        "Confirmar aceptación de justificación", */
                                                    onTapButton: () async {
                                                      List<int> idRequestItem =
                                                          [item.id ?? 0];
                                                      /* print("algo"); */
                                                      controller
                                                          .updateStateOfRequest(
                                                              2, false,
                                                              idRequest:
                                                                  idRequestItem);
                                                      Get.back();
                                                    },
                                                    textPrimaryButton:
                                                        "Continuar",
                                                    textSecondaryButton:
                                                        "Cancelar",
                                                    onTapButtonSecondary: () {
                                                      Get.back();
                                                    }));
                                              },
                                              child: const Tooltip(
                                                message: 'Aprobar',
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: AppColors
                                                      .validationTimely,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: kSizeLittle,
                                            ),
                                            IconWrapper(
                                              onTap: () {
                                                Get.dialog(AlertDialogComponent(
                                                    headerTitle:
                                                        "¿Está seguro de rechazar la justificación?",
                                                    /* title:
                                                        "Confirmar rechazo de justificación", */
                                                    onTapButton: () async {
                                                      /* print('press'); */
                                                      List<int> idRequestItem =
                                                          [item.id ?? 0];
                                                      controller
                                                          .updateStateOfRequest(
                                                              3, false,
                                                              idRequest:
                                                                  idRequestItem);
                                                      Get.back();
                                                    },
                                                    textPrimaryButton:
                                                        "Continuar",
                                                    textSecondaryButton:
                                                        "Cancelar",
                                                    onTapButtonSecondary: () {
                                                      Get.back();
                                                    }));
                                              },
                                              child: const Tooltip(
                                                message: 'Rechazar',
                                                child: Icon(
                                                    Iconsax.close_circle,
                                                    color: AppColors
                                                        .validationMissing),
                                              ),
                                            ),
                                          ],
                                        )),
                            ].where((element) => !element.isObscure!).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  controller.listRequest.isEmpty
                      ? const SizedBox()
                      : /* Container(
                          height: 20,
                          color: Colors.amber,
                        ), */
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => Text(
                                  /* "${(controller.page - 1) * kSizePage + 1} - ${(controller.page - 1) * kSizePage + controller.listJustifications} de ${controller.pageSize} registro(s)", */
                                  /* "${controller.pageIndex} - ${controller.countPage} de ${controller.countItem} registro(s)", */
                                  "Registros por pág: ${controller.countItem} | ${controller.pageIndex} - ${controller.countPage} páginas",
                                  style: const TextStyle(
                                      color: AppColors.blueDark,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Row(
                                children: [
                                  Obx(
                                    () => PaginatorButton(
                                      isBack: true,
                                      isActive: controller.pageIndex > 1,
                                      onTap: () {
                                        controller.page--;
                                        controller.getAllRequests(
                                            controller.isToLeader.value, true);
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
                                        controller.getAllRequests(
                                            controller.isToLeader.value, true);
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
