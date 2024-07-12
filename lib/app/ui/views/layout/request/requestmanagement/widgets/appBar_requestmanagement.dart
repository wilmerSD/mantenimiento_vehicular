import 'package:app_valtx_asistencia/app/models/response/response_update_justifications_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppBarRequestManagement extends StatelessWidget {
  const AppBarRequestManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(
        init: RequestManagementController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

          /* 📌 Para ingresar los nombres */
          Widget inputNames = InputPrimary(
            label: "Nombres",
            maxLength: 30,
            textEditingController: controller.nameSearchController,
            validator: (value) {
              return Helpers.simplerequiredRegex(
                  value,
                  RegExp(
                      r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
                  "Solo se aceptan letras");
            },
          );

          /* 📌 Para ingresar los numero de documento */
          Widget inputNroDocument = InputPrimary(
            label: "Nro documento",
            textEditingController: controller.dniSearchController,
            inputFormats: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLength: controller.typeDocument.value == 0 ? 8 : null,
            validator: (value) {
              return Helpers.simplerequiredRegex(
                  value,
                  RegExp(
                    r'^\d{8}$',
                  ),
                  "El campo debe contener ocho dígitos");
            },
          );

          /* 📌 Estado de la justificación */
          Widget inputState = Obx(
            () => Select(
              label: "Estado solicitud",
              value: controller.stateList.firstWhere((element) =>
                  element.value == controller.currentStateRequest.value),
              items: controller.stateList.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentStateRequest.value =
                    (newValue as DatumSelect).value!;
              },
              /* validator: (value) {
            if (value == null || controller.currentStateRequest.value == -1) {
              return "Este campo es obligatorio";
            }
            return null;
          }, */
            ),
          );

          /* 📌 Seleccionar tipo de solicitud */
          Widget selectRequest = Obx(
            () => Select(
              label: "Tipo solicitud",
              value: controller.stateListTypeRequest.firstWhere((element) =>
                  element.value == controller.currentRequest.value),
              items: controller.stateListTypeRequest.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentRequest.value =
                    (newValue as DatumSelect).value!;
              },
              /* validator: (value) {
            if (value == null || controller.currentRequest.value == -1) {
              return "Este campo es obligatorio";
            }
            return null;
          }, */
            ),
          );

          /* 📌 Boton para limpiar */
          Widget btnClean = BtnCancel(
            text: "Limpiar",
            onTap: () {
              controller.cleanPaginator();
              controller.cleanFilters();
              controller.clean();
              controller.showViewUponRequest.value = -1;
            },
          );

          /* 📌 Boton para buscar */
          Widget btnSearch = BtnPrimary(
              text: "Buscar",
              onTap: () {
                /* if (keyFormSearch.currentState!.validate()) {
              controller.cleanPaginator();
              controller.getAllRequests(true, false);
            } */
                controller.cleanPaginator();
                controller.getAllRequests(controller.isToLeader.value, false);
              });

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: selectRequest,
                                  ),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: inputState,
                                  ),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
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
                                  const Expanded(flex: 6, child: SizedBox()),
                                  Expanded(flex: 1, child: btnSearch),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 1, child: btnClean),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                )
              : Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: selectRequest,
                                  ),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: inputState,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: kSizeBigLittle,
                              ),
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
                                  Expanded(flex: 1, child: btnSearch),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 1, child: btnClean),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                );

          /********************AQUI EMPIEZA MOVIL+*************  */
        });
  }
}
