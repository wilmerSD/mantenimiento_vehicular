import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DateToAssignedSchedule extends StatelessWidget {
  const DateToAssignedSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
        init: StaffController(),
        builder: (controller) {
          /* 📌 Fecha de asignación */
          Widget dateToPermission = InputPrimary(
              hintText: "dd/mm/aaaa",
              readOnly: true,
              label: "Fecha de asignación",
              maxLength: 10,
              textEditingController: controller.dateToAssing,
              onChanged: (value) {
                controller.isForAnotherDay.value = true;
                controller.dateToAssing.value;
              },
              /*  validator: (date) {
            if (Helpers.compareDates(
                    controller.datePermission.text, controller.endDate.text) >
                0) {
              return "La fecha inicio no puede ser mayor";
            } else {
              return Helpers.noRequiredDateTime(date, date ?? "");
            }
          }, */
              suffixIcon: IconWrapper(
                  onTap: () async {
                    DateTime? pickdateInicio = await showDatePicker(
                      context: context,
                      locale: const Locale("es", "ES"),
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime(2100),
                    );
                    if (pickdateInicio != null) {
                      controller.dateToAssing.text =
                          Helpers.dateToStringTimeDMY(pickdateInicio);
                    }
                  },
                  child:
                      const Icon(Iconsax.calendar, color: AppColors.blueDark)));

          /* 📌 Boton para cerrar */
          Widget btnClose = BtnCancel(
            text: "Cancelar",
            onTap: () {
              Get.back();
            },
          );

          /* 📌 Boton para guardar */
          Widget btnSave = BtnPrimary(
              /* isGreen: true, */
              text: "Guardar",
              onTap: () {
                /* if (keyFormSearch.currentState!.validate()) {
                controller.listUserFilter(false);
              } */
                if (controller.dateToAssing.text != '') {
                  controller.addScheduleToAnotherDay();
                } else {
                  controller.addScheduleUser();
                }
                Get.back();
              });

          return Container(
              color: Colors.white,
              width: kSizeSmallAmpleWeb,
              height: kSizeAmpleWeb,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.warning_2),
                        const SizedBox(
                          width: kSizeLittle,
                        ),
                        Expanded(
                          child: Text(
                              "¿Desea que el horario se agregue en una fecha específica? Si es así, seleccione una fecha; de lo contrario, el horario se asignará de manera inmediata.",
                              style: AppTextStyle(context).semibold16()),
                        ),
                      ],
                    ),
                    Row(children: [Expanded(child: dateToPermission)]),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(child: btnClose),
                        const SizedBox(
                          width: kSizeSmallLittle,
                        ),
                        Expanded(child: btnSave)
                      ],
                    )
                  ]));
        });
  }
}
