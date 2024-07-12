import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/paginator_button.dart';
import 'package:app_valtx_asistencia/app/ui/components/tables/table_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/widgets/edit_ledaer_asigned.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/widgets/edit_profile.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DataTableUsers extends StatelessWidget {
  const DataTableUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      init: UsersController(),
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
                    child: Obx(
                      () => TablePrimary(
                        minWidth: minWidthSmallLittleTables,
                        columns: [
                          CustomColumn("#",
                              columnSize: ColumnSize.XS, isCenter: true),
                          CustomColumn("Nombres", columnSize: ColumnSize.S),
                          CustomColumn("Apellidos", columnSize: ColumnSize.S),
                          CustomColumn("Estado", columnSize: ColumnSize.XS),
                          CustomColumn("Nro. documento",
                              columnSize: ColumnSize.S),
                          CustomColumn("Perfil", columnSize: ColumnSize.XS),
                          CustomColumn("Lider asignado",
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
                              userIndex: -1,
                              cells: [
                                CustomCell("",
                                    isText: false,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child:
                                            Text('${item.idUsuarios ?? 0}'))),
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
                                                horizontal:
                                                    kPaddingAppLittleApp,
                                                vertical: kPaddingAppSmallApp),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    kRadiusBetweenMedionAndNormal),
                                                color:
                                                    AppColors.degradedActive),
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
                                                horizontal:
                                                    kPaddingAppLittleApp,
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
                                CustomCell(
                                    "${item.nameLeader} ${item.lastnameLeader}"),
                                CustomCell('',
                                    isText: false,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconWrapper(
                                          onTap: () {
                                            controller.passInformation(
                                                item.nombres ?? '',
                                                item.apellidos ?? '',
                                                item.idUsuarios ?? 0,
                                                item.idEstado ?? 0,
                                                item.idRol ?? 0);
                                            HelpersComponents.getModal(
                                                context, const EditProfile());
                                          },
                                          child: const Tooltip(
                                            message: 'Editar perfil',
                                            child: Icon(Iconsax.edit_2,
                                                color: AppColors.blueDark,
                                                size: 20.0),
                                          ),
                                        ),
                                        /* IconWrapper(
                                          onTap: () {
                                            controller.getAllLeaders(false);
                                            controller.passInfoToAsignedLedader(
                                                '${item.nombres} ${item.apellidos}',
                                                '${item.nameLeader} ${item.lastnameLeader}',
                                                item.idUsuarios ?? 0);
                                            HelpersComponents.getModal(context,
                                                const EditLeaderAsigned());
                                          },
                                          child: const Tooltip(
                                            message: 'Asignar lider',
                                            child: Icon(
                                                Icons.person_add_alt_outlined,
                                                color: AppColors.blueDark,
                                                size: 20.0),
                                          ),
                                        ), */
                                      ],
                                    )),
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
