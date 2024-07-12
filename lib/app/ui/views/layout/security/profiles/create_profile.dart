import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/profile_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      /* 📌 Input nombre de perfil */
      Widget inputProfile = InputPrimary(
        label: "Nombre perfil",
        maxLength: 50,
        /* textEditingController: controller.modalityWork, */
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Input nombre de perfil */
      Widget inputProfileDescription = InputPrimary(
        label: "Descripción perfil",
        maxLength: 100,
        /* textEditingController: controller.modalityWork, */
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Para seleccionar estado de modalidad */
      Widget inputStateGeneral = Obx(
        () => Select(
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
          onChanged: (newValue) {
            controller.currentState.value =
                (newValue as DatumAllStateGeneral).idEstado!;
          },
        ),
      );

      /* 📌 Para cerrar*/
      Widget btnclose = BtnCancel(
        text: "Cerrar",
        onTap: () {
          Get.back();
        },
      );

      /* 📌 Para agregar el nuevo horario */
      Widget btnAdd = BtnPrimary(
        text: "Agregar",
        onTap: () async {},
      );

      return Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Añadir perfil",
                      style: AppTextStyle(context)
                          .bold26(color: AppColors.grayDarkPlus),
                    ),
                    const SizedBox(
                        height: kSizeNormalMediun,
                      ),
                    Row(
                      children: [
                        Expanded(child: inputProfile),
                        const SizedBox(width: kSize),
                        Expanded(child: inputStateGeneral),
                      ],
                    ),
                    const SizedBox(
                            height: kSizeBig,
                          ),
                    inputProfileDescription,
                    const SizedBox(
                            height: kSizeBig,
                          ),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                            flex: 8,
                            child: Row(children: [
                              Expanded(child: btnclose),
                              const SizedBox(width: kSize),
                              Expanded(child: btnAdd),
                            ]))
                      ],
                    ),
                  ]))
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: []));
    });
  }
}
