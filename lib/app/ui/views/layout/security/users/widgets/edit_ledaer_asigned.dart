import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/widgets/data_table_leaders.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditLeaderAsigned extends StatelessWidget {
  const EditLeaderAsigned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      final keyFormSearch = GlobalKey<FormState>();
      /* 📌 Nombres y apellidos del usuario*/
      Widget inputNames = InputPrimary(
        isActive: false,
        label: "Nombres y apellidos",
        maxLength: 35,
        textEditingController: controller.namesEmployee,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Nombres y Apellidos del lider a cargo */
      Widget inputNamesLeader = InputPrimary(
        isActive: false,
        label: "Nombre y apellidos",
        maxLength: 35,
        textEditingController: controller.lastNamesEmployee,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Input de numero de documento */
      Widget inputNroDocumentSearch = InputPrimary(
        label: "Nro documento",
        textEditingController: controller.dniLeaderSearch,
        inputFormats: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        maxLength: controller.typeDocument.value == 0 ? 8 : null,
        /* validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(
                r'^\d{8}$',
              ),
              "El campo debe contener ocho dígitos");
        }, */
      );

      /* 📌 Ingreso de nombres */
      Widget inputNameSearch = InputPrimary(
        label: "Nombres",
        maxLength: 30,
        textEditingController: controller.nameLeaderSearch,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Boton para limpiar */
      Widget btnClean = BtnCancel(
        text: "Limpiar",
        onTap: () {
          controller.cleanVariblesSearchLeader();
          controller.getAllLeaders(false);
        },
      );

      /* 📌 Boton para buscar */
      Widget btnSearch = BtnPrimary(
          text: "Buscar",
          onTap: () {
            if (keyFormSearch.currentState!.validate()) {
              controller.getAllLeaders(false);
            }
            /* controller.getAllLeaders(false); */
          });

      /* 📌 Boton para cerrar */
      Widget btnClose = BtnCancel(
        text: "Cerrar",
        onTap: () {
          Get.back();
          controller.cleanVariblesSearchLeader();
        },
      );

      /* 📌 Boton para guardar */
      Widget btnSave = BtnPrimary(
          text: "Guardar",
          onTap: () {
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            controller.updateLeaderAsignedToUser();
            controller.cleanVariblesSearchLeader();
            Get.back();
          });

      return Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Container(
              width: minWidthNormalTable,
              padding: const EdgeInsets.symmetric(
                  vertical: kPaddingAppNormalApp,
                  horizontal: kPaddingAppLargeApp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadiusMedium),
                color: AppColors.backgroundColor,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Editar líder/RRHH asignado",
                        style: AppTextStyle(context)
                            .bold26(color: AppColors.grayDarkPlus)),
                    const SizedBox(
                      height: kSizeSmallLittle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Usuario: ',
                            style: AppTextStyle(context).semibold16()),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 2, child: inputNames),
                        const Expanded(flex: 1, child: SizedBox()),
                        Text('Lider: ',
                            style: AppTextStyle(context).semibold16()),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 2, child: inputNamesLeader),
                      ],
                    ),
                    const SizedBox(
                      height: kSizeExtraLittle,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: kPaddingAppNormalApp,
                          horizontal: kPaddingAppLargeApp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadiusMedium),
                        color: AppColors.primaryBackground,
                      ),
                      child: Form(
                        key: keyFormSearch,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: inputNroDocumentSearch),
                            const SizedBox(
                              width: kSizeNormalLittle,
                            ),
                            Expanded(flex: 2, child: inputNameSearch),
                            const Expanded(flex: 2, child: SizedBox()),
                            Expanded(flex: 1, child: btnSearch),
                            const SizedBox(
                              width: kSizeNormalLittle,
                            ),
                            Expanded(flex: 1, child: btnClean),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kSizeExtraLittle,
                    ),
                    Obx(() => controller.isLoadingLeaders.value
                        ? HelpersComponents.getLoadingAnimation()
                        : Expanded(
                            /* height:
                          /* (controller.leadersList.length + 2.5) * 48 +
                                30, */
                          400, */
                            child: DataTableLeaders())),
                    const SizedBox(
                      height: kSizeExtraLittle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 6, child: SizedBox()),
                        Expanded(flex: 1, child: btnClose),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 1, child: btnSave),
                        const SizedBox(
                          width: kPaddingAppLargeApp,
                        )
                      ],
                    )
                  ]),
            )
          : Container(
              width: minWidthNormalTable,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Editar líder/RRHH asignado",
                        style: AppTextStyle(context)
                            .bold26(color: AppColors.grayDarkPlus)),
                    const SizedBox(
                      height: kSizeNormalMediun,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Usuario: ',
                            style: AppTextStyle(context).semibold16()),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 2, child: inputNames),
                      ],
                    ),
                    const SizedBox(
                      height: kSizeNormalMediun,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Lider:      ',
                            style: AppTextStyle(context).semibold16()),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 2, child: inputNamesLeader),
                      ],
                    ),
                    const SizedBox(
                      height: kSizeNormalMediun,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: kPaddingAppNormalApp,
                          horizontal: kPaddingAppLargeApp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadiusMedium),
                        color: AppColors.primaryBackground,
                      ),
                      child: Form(
                        key: keyFormSearch,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2, child: inputNroDocumentSearch),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 2, child: inputNameSearch),
                              ],
                            ),
                            const SizedBox(
                              height: kSizeNormalMediun,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 1, child: btnSearch),
                                const SizedBox(
                                  width: kSizeNormalLittle,
                                ),
                                Expanded(flex: 1, child: btnClean),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kSizeNormalMediun,
                    ),
                    Obx(() => controller.isLoadingLeaders.value
                        ? HelpersComponents.getLoadingAnimation()
                        : Expanded(
                            /*  height:
                                (controller.leadersList.length + 2.5) * 48 +
                                    30, */
                            child: DataTableLeaders())),
                    const SizedBox(
                      height: kSizeNormalMediun,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 2, child: SizedBox()),
                        Expanded(flex: 1, child: btnClose),
                        const SizedBox(
                          width: kSizeNormalLittle,
                        ),
                        Expanded(flex: 1, child: btnSave),
                      ],
                    )
                  ]));
    });
  }
}
