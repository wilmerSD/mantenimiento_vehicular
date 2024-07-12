import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BodyStaff extends StatelessWidget {
  const BodyStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
        init: StaffController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

          /* 📌 Input de numero de documento */
          Widget inputNroDocument = InputPrimary(
            label: "Nro documento",
            textEditingController: controller.dniSearchController,
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

          /* 📌 Input de nombres */
          Widget inputNames = InputPrimary(
            label: "Nombres",
            maxLength: 30,
            textEditingController: controller.documentTEC,
            validator: (value) {
              return Helpers.simplerequiredRegex(
                  value,
                  RegExp(
                      r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
                  "Solo se aceptan letras");
            },
          );

          /* 📌 Limpiar variables de busqueda */
          Widget btnClean = BtnCancel(
            text: "Limpiar",
            onTap: () {
              controller.clean();
            },
          );

          /* 📌 Boton para buscar */
          Widget btnSearch = BtnPrimary(
              text: "Buscar",
              onTap: () {
                /* if (Helpers.simplerequiredRegex(
                        controller.documentTEC.text,
                        RegExp(
                            r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
                        "Solo se aceptan letras") ==
                    "Solo se aceptan letras") {
                  return;
                }
                controller.listUserFilter(false); */
                if (keyFormSearch.currentState!.validate()) {
                  controller.listUserFilter(false);
                }
              });

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(flex: 2, child: inputNroDocument),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 2, child: inputNames),
                                  const Expanded(flex: 2, child: SizedBox()),
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
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(flex: 2, child: inputNroDocument),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 2, child: inputNames),
                                ],
                              ),
                              const SizedBox(
                                height: kSizeBigLittle,
                              ),
                              Row(
                                children: [
                                  Expanded(flex: 2, child: btnSearch),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 2, child: btnClean),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        });
  }
}
