import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/body_to_permission.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarRequest extends StatelessWidget {
  const AppBarRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements

          /* 📌 Para seleccionar tipo de solicitud */
          Widget inputTypeRequest = Obx(
            () => Select(
              label: "Solicitud",
              value: controller.stateListToCreateTEC.firstWhere((element) =>
                  element.value == controller.currentRequest.value),
              items: controller.stateListToCreateTEC.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentRequest.value =
                    (newValue as DatumSelect2Combo).value!;
              },
            ),
          );

          Widget btnRegiterNewRequest = BtnPrimary(
              isMaxHeight: true,
              text: "Autorización de ingreso previo",
              onTap: () {
                controller.listUser(false);
                HelpersComponents.getModal(
                    barrierDismissible: true,
                    context,
                    const BodyToPermission());
              });

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppMediunApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: inputTypeRequest),
                                const Expanded(flex: 4, child: SizedBox()),
                                Obx(() {
                                  return controller.idRol.value != 1
                                      ? Expanded(
                                          flex: 2, child: btnRegiterNewRequest)
                                      : const SizedBox.shrink();
                                }),
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
                            vertical: kPaddingAppMediunApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: inputTypeRequest),
                                const Expanded(flex: 1, child: SizedBox()),
                                Obx(() {
                                  return controller.idRol.value != 1
                                      ? Expanded(
                                          flex: 3, child: btnRegiterNewRequest)
                                      : const SizedBox.shrink();
                                }),
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
