import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/myrequest_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/widgets/data_table_justifications.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/widgets/data_table_permissions.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/widgets/data_table_vacation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRequestView extends StatelessWidget {
  const MyRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestController>(
        init: MyRequestController(),
        builder: (controller) {
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
                    (newValue as DatumSelect2Combo).value!;
              },
            ),
          );

          /* 📌 Seleccionar estado de solicitud */
          Widget selectStateRequest = Obx(
            () => Select(
              label: "Estado solicitud",
              value: controller.listStatusRequest.firstWhere((element) =>
                  element.value == controller.currentStateRequest.value),
              items: controller.listStatusRequest.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.currentStateRequest.value =
                    (newValue as DatumSelect2Combo).value!;
              },
            ),
          );

          /* 📌 Boton filtrar o buscar */
          Widget btnSearch = BtnPrimary(
              text: "Buscar",
              onTap: () {
                /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
                controller.getAllMyRequest(false);
              });

          /* 📌 Boton limpiar variables */
          Widget btnClean = BtnCancel(
            text: "Limpiar",
            onTap: () {
              controller.clean();
            },
          );

          return Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: selectRequest,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: selectStateRequest,
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(flex: 1, child: btnClean),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(flex: 1, child: btnSearch)
                    ],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() => controller.isLoadingRequest.value
                  ? HelpersComponents.getLoadingAnimation()
                  : const SizedBox(
                      height: 0.0,
                    )),
              Obx(
                () {
                  return controller.showViewUponRequest.value == 1
                      ? Expanded(child: DataTableMyJustifications())
                      : controller.showViewUponRequest.value == 2
                          ? Expanded(child: DataTablePermissions())
                          : controller.showViewUponRequest.value == 3
                              ? Expanded(child: DataTableVacations())
                              : const SizedBox();
                },
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          );
        });
  }
}
