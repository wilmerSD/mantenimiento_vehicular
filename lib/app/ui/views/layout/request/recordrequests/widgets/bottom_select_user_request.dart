import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSelectUserRequest extends StatelessWidget {
  const BottomSelectUserRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

          /* 📌 Boton para cerrar */
          Widget btnClean = BtnCancel(
            text: "Cerrar",
            onTap: () {
              controller.clean();
              Get.back();
            },
          );

          /* 📌 Boton para seguir con el permiso */
          Widget btnNext = BtnPrimary(
              text: "Seleccionar",
              onTap: () async {
                /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */

                if (controller.userIndex.value == -1) {
                  /* showToastNow(2, "warning", "Tiene campos sin completar"); */
                  Helpers.showSnackBar(
                    Get.context!,
                    title: "Validar",
                    message: "Debes seleccionar un trabajador",
                  );
                  return;
                }
                await controller
                    .getScheduleByUser(controller.idUserAuthorizarion);
                controller.normalAdmissionTime.text =
                    controller.scheduleByUser.value.horaInicio ?? '';
                controller.requestSpecial.value = true;
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
                          color: AppColors.backgroundColorModal,
                        ),
                        child: Column(
                          children: [
                            /*  Form(
                      key: keyFormSearch, 
                      child: */
                            Row(
                              children: [
                                const Expanded(flex: 3, child: SizedBox()),
                                Expanded(flex: 1, child: btnNext),
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
                          color: AppColors.backgroundColorModal,
                        ),
                        child: Column(
                          children: [
                            /*  Form(
                      key: keyFormSearch, 
                      child: */
                            Row(
                              children: [
                                Expanded(flex: 1, child: btnNext),
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
                  ],
                );
        });
  }
}
