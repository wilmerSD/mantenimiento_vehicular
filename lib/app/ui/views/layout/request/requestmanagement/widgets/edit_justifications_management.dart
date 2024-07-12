import 'package:app_valtx_asistencia/app/models/response/response_update_justifications_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditJustificationsManagement extends StatelessWidget {
  const EditJustificationsManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(builder: (controller) {
      final keyForm = GlobalKey<FormState>();

      //Elements
      Widget inputNameParameter = InputPrimary(
        textEditingController: controller.name,
        label: "Trabajador",
        readOnly: true,
        /* onChanged: (value) => controller.textCtrlDescriptionParameter.value, */
        validator: (value) {
          /* return Helpers.simpleRequired(
            value,
          ); */
        },
        /* enabledfield: false, */
      );
      Widget inputValueParameter = InputPrimary(
        textEditingController: controller.typeMark,
        label: "Tipo Marcación",
        readOnly: true,
        inputFormats: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        /* onChanged: (value) => controller.textCtrlValueParameter.value, */
        validator: (value) {
          /* return Helpers.simpleRequired(
            value,
          ); */
        },
      );
      Widget inputHour = InputPrimary(
        textEditingController: controller.hourJustification,
        label: "Hora",
        readOnly: true,
        /* onChanged: (value) => controller.textCtrlDescriptionParameter.value, */
        validator: (value) {
          /* return Helpers.simpleRequired(
            value,
          ); */
        },
        suffixIcon: IconWrapper(
            onTap: () async {
              TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                controller.hourJustification.text = picked.format(context);
                String formattedTime =
                    '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                controller.hourJustification.text = formattedTime;
              }
            },
            child: const Icon(Iconsax.clock)),
        /* enabledfield: false, */
      );
      Widget inputState = Obx(
        () => Select(
          label: "Estado Justificación",
          value: controller.stateList.firstWhere((element) =>
              element.value == -1 /* "${controller.currentStateId.value}" */),
          items: controller.stateList.map(
            (element) {
              return DropdownMenuItem(
                value: element,
                child: OptionSelect(nameOption: element.text),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            /* controller.currentStateId.value = (newValue as DatumSelect).value!; */
            controller.idStatusJustification.value =
                (newValue as DatumSelect).value!;
            /* controller.idStatusJustification.text =
                (newValue as DatumSelect).value!; */

            /* controller.currentStateId.value =
                int.parse(newValue?.toString() ?? '');
            print('hdopdsdsdsjnfsfs:${controller.currentStateId.value}'); */
            /* print(newValue); */
          },
        ),
      );
      Widget btnModificar =  Expanded(
              child: BtnPrimary(
                text: "Modificar",
                onTap: () {
                  if (keyForm.currentState!.validate()) {
                    /* controller.updateJustifications(); */
                  }
                },
              ),
          );

      /* if (Responsive.isDesktop(context) || Responsive.isTablet(context)) { */
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Justificación",
              style: AppTextStyle(context).bold24(color: AppColors.blueDark),
            ),
            const SizedBox(
              height: kSizeNormalMediun,
            ),
            Form(
              key: keyForm,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: inputNameParameter),
                      const SizedBox(
                        width: kSizeBigLittle,
                      ),
                      Expanded(child: inputValueParameter),
                    ],
                  ),
                  const SizedBox(height: kSizeNormalLittle),
                  Row(
                    children: [
                      Expanded(child: inputHour),
                      const SizedBox(
                        width: kSizeBigLittle,
                      ),
                      Expanded(child: inputState),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 43.0,
            ),
            Row(
              children: [
                const Expanded(flex: 6, child: SizedBox()),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: BtnCancel(
                          text: "Cerrar",
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: kSizeBigLittle,
                      ),
                      btnModificar,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
