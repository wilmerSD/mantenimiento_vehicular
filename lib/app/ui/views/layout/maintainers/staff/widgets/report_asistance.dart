/* import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReportAsistance extends StatelessWidget {
  const ReportAsistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      builder: (controller) {
      final keyForm = GlobalKey<FormState>();
      const isProfileParametersUpdate = true;

      //Elements

      Widget inputHour = InputPrimary(
        hintText: "aa-mm-dd",
        textEditingController: controller.dateReport,
        label: "Día",
        readOnly: true,
        /* onChanged: (value) => controller.textCtrlDescriptionParameter.value, */
        /* validator: (value) {
          return Helpers.simpleRequired(
            value,
          );
        }, */
        suffixIcon: IconWrapper(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().subtract(Duration(days: 1)),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().subtract(Duration(days: 1)));
              if (picked != null) {
                controller.dateReport.text =
                    picked.toLocal().toString().split(' ')[0];
                /* String formattedTime =
                    '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                controller.hourJustification.text = formattedTime; */
              }
            },
            child: Icon(Iconsax.clock)),
        /* enabledfield: false, */
      );

      /* if (Responsive.isDesktop(context) || Responsive.isTablet(context)) { */
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Selecionar día de reporte:",
              style: AppTextStyle(context).bold24(color: AppColors.blueDark),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Form(
              key: keyForm,
              child: Column(
                children: [
                  Row(
                    children: [
                      /* Expanded(child: inputNameParameter),
                      SizedBox(
                        width: 20,
                      ), */
                      /* Expanded(child: inputValueParameter), */
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(child: inputHour),
                      SizedBox(
                        width: 20,
                      ),
                      /* Expanded(child: inputState), */
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
                const Expanded(flex: 4, child: SizedBox()),
                Expanded(
                  flex: isProfileParametersUpdate ? 8 : 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: BtnCancel(
                          text: "Cerrar",
                          onTap: () {
                            controller.dateReport.text = "";
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(
                        width: isProfileParametersUpdate ? 20.0 : 0.0,
                      ),
                      isProfileParametersUpdate
                          ? btnModificar
                          : const Expanded(flex: 0, child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      /*   } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Editar cargo",
                style: AppTextStyle(context).bold26(color: AppColors.grayDark),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Form(
                key: keyForm,
                child: Column(
                  children: [
                    Row(
                      children: [
                        /* Expanded(flex: 6, child: inputNameCode),
                        const SizedBox(width: 15.0), */
                        Expanded(flex: 6, child: inputValueParameter),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Expanded(child: inputNameParameter),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: isProfileParametersUpdate ? 10 : 1,
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
                        SizedBox(
                          width: isProfileParametersUpdate ? 20.0 : 0.0,
                        ),
                        isProfileParametersUpdate
                            ? btnModificar
                            : const Expanded(flex: 0, child: SizedBox()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } */
    });
  }
}
 */