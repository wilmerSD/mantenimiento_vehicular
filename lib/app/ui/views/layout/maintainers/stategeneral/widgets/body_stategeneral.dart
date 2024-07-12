import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyMarkingType extends StatelessWidget {
  const BodyMarkingType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(
      init: MarkingTypeController(),
      builder: (controller) {
      //ELEMENTS

      /* 📌 Input tipo de marcación */
      Widget inputTypeMarking = InputPrimary(
        label: "Tipo de marcación",
        maxLength: 35,
        textEditingController: controller.descriptionTypeMark,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Para seleccionar estado de solicitud */
      Widget inputStateRequest = Obx(
        () => Select(
          label: "Estado",
          value: controller.stateList.firstWhere(
              (element) => element.idEstado == controller.idStateMark.value),
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
                (newValue as DatumSelect2Combo).value!;
          },
        ),
      );

      /* 📌 Boton para limpiar */
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
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            /*  controller.usersList.value = [];
            controller.listUser(false); */
          });
      
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: inputTypeMarking),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(flex: 2, child: inputStateRequest),
                      const Expanded(flex: 2, child: SizedBox()),
                      Expanded(flex: 1, child: btnSearch),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(flex: 1, child: btnClean)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
