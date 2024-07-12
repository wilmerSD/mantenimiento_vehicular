import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/typesrequest_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTypeRequest extends StatelessWidget {
  const EditTypeRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeRequestController>(
        init: TypeRequestController(),
        builder: (controller) {
          //ELEMENTS
          final keyForm = GlobalKey<FormState>();
          /* 📌 Nombre de tipo de solicitud */
          Widget inputTypeRequest = InputPrimary(
            label: "Tipo de solicitud",
            maxLength: 35,
            textEditingController: controller.descriptionTypeRequest,
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
                  element.idEstado == controller.idStateMark.value),
              items: controller.stateList.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.descripcion),
                  );
                },
              ).toList(),
              /* onChanged: (newValue) {
            controller.currentState.value =
                (newValue as DatumSelect2Combo).value!;
          }, */
            ),
          );

          /* 📌 Boton para cerrar */
          Widget btnClose = BtnCancel(
            text: "Cerrar",
            onTap: () {
              Get.back();
            },
          );

          /* 📌 Boton para guardar */
          Widget btnSave = BtnPrimary(
              text: "Guardar",
              onTap: () {
                if (keyForm.currentState!.validate()) {
                  controller.updateTypeRequest();
                  Get.back();
                }
                /* controller.updateTypeRequest();
                Get.back(); */
              });

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Container(
                  color: Colors.white,
                  width: kSizeSmallAmpleWeb,
                  height: kSizeAmpleWeb,
                  child: Form(
                    key: keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Editar tipo de solicitud",
                            style: AppTextStyle(context)
                                .bold26(color: AppColors.grayDarkPlus)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: inputTypeRequest),
                            const SizedBox(
                              width: kSizeNormalLittle,
                            ),
                            Expanded(flex: 1, child: inputStateRequest),
                          ],
                        ),
                        const SizedBox(
                          height: kSizeSmallLittle,
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
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: Colors.white,
                  width: kSizeSmallAmpleWeb,
                  height: kSizeAmpleWeb,
                  child: Form(
                    key: keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Editar tipo de solicitud",
                            style: AppTextStyle(context)
                                .bold26(color: AppColors.grayDarkPlus)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: inputTypeRequest),
                            const SizedBox(
                              width: kSizeNormalLittle,
                            ),
                            Expanded(flex: 1, child: inputStateRequest),
                          ],
                        ),
                        const SizedBox(
                          height: kSizeSmallLittle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(flex: 2, child: btnClose),
                            const SizedBox(
                              width: kSizeNormalLittle,
                            ),
                            Expanded(flex: 2, child: btnSave),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
