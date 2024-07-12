import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/typesrequest_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyTypeRequest extends StatelessWidget {
  const BodyTypeRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeRequestController>(
        init: TypeRequestController(),
        builder: (controller) {
          //ELEMENTS
          final keyFormSearch = GlobalKey<FormState>();
          /* 📌 Input tipo de solicitudes */
          Widget inputTypeRequest = InputPrimary(
            label: "Tipo de solicitud",
            maxLength: 35,
            textEditingController: controller.typeRequest,
            validator: (value) {
              return Helpers.simplerequiredRegex(
                  value,
                  RegExp(
                      r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
                  "Solo se aceptan letras");
            },
          );

          /* 📌 Para seleccionar estado de solicitud */
          Widget inputStateRequest = Obx(
            () => Select(
              label: "Estado",
              value: controller.stateList.firstWhere((element) =>
                  element.idEstado == controller.currentState.value),
              items: controller.stateList.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.descripcion),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentState.value =
                    (newValue as DatumAllStateGeneral).idEstado!;
              },
            ),
          );

          /* 📌 Boton para limpiar */
          Widget btnClean = BtnCancel(
            text: "Limpiar",
            onTap: () {
              controller.clean();
              controller.getAllTypesRequest();
            },
          );

          /* 📌 Boton para buscar */
          Widget btnSearch = BtnPrimary(
              text: "Buscar",
              onTap: () {
                if (keyFormSearch.currentState!.validate()) {
                  controller.getTypesRequestFilter();
                }
                /* controller.getTypesRequestFilter(); */
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
                                  Expanded(flex: 2, child: inputTypeRequest),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 2, child: inputStateRequest),
                                  const Expanded(flex: 2, child: SizedBox()),
                                  Expanded(flex: 1, child: btnSearch),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 1, child: btnClean)
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
                                  Expanded(flex: 2, child: inputTypeRequest),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 2, child: inputStateRequest),
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
                                  Expanded(flex: 2, child: btnClean)
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
