import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allroles_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      /* 📌 Nombre de tipo de solicitud */
      Widget inputNames = InputPrimary(
        isActive: false,
        label: "Nombres",
        maxLength: 35,
        textEditingController: controller.namesEmployee,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Nombre de tipo de solicitud */
      Widget inputApellidos = InputPrimary(
        isActive: false,
        label: "Apellidos",
        maxLength: 35,
        textEditingController: controller.lastNamesEmployee,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Para seleccionar estado de solicitud */
      Widget inputState = Obx(
        () => Select(
          isActive: false,
          label: "Estado",
          value: controller.stateList.firstWhere(
              (element) => element.idEstado == controller.currentState.value),
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

      /* 📌 Seleccionar perfil */
      Widget inputProfile = Obx(
        () => Select(
          label: "Perfil",
          value: controller.rolesActives
              .firstWhere((element) => element.idRol == controller.rol.value),
          items: controller.rolesActives.map(
            (element) {
              return DropdownMenuItem(
                value: element,
                child: OptionSelect(nameOption: element.nombre),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            controller.rol.value = (newValue as DatumRoles).idRol!;
          },
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
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            controller.updateRoleUser();
            Get.back();
          });

      return Container(
        color: Colors.white,
        width: 600.0,
        height: 265.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Editar perfil usuario",
                style: AppTextStyle(context)
                    .bold26(color: AppColors.grayDarkPlus)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: inputNames),
                const SizedBox(
                  width: 15,
                ),
                Expanded(flex: 1, child: inputApellidos),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: inputState),
                const SizedBox(
                  width: 15,
                ),
                Expanded(flex: 1, child: inputProfile),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                Expanded(flex: 1, child: btnClose),
                const SizedBox(
                  width: 15,
                ),
                Expanded(flex: 1, child: btnSave),
              ],
            ),
          ],
        ),
      );
    });
  }
}
