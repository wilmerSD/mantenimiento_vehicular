import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyRequestManagement extends StatelessWidget {
  const BodyRequestManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(builder: (controller) {
      //Elements
      /* final keyFormSearch = GlobalKey<FormState>(); */

      /* 📌 Boton para rechazar los seleccionados */
      Widget btnReject = BtnCancel(
          text: "Rechazar",
          onTap: () {
            if(controller.isToLeader.value){
             return controller.validState(3);
            }
            controller.validStateToRRHH(3);
          });

      /* 📌 Boton para aprobar los seleccionados */
      Widget btnAccept = BtnPrimary(
          isGreen: true,
          text: "Aprobar",
          onTap: () {
            if(controller.isToLeader.value){
             return controller.validState(2);
            }
            controller.validStateToRRHH(2);
          });

      return Column(
        children: [
          Row(children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(child: btnReject),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(child: btnAccept)
          ]),
        ],
      );

      /********************AQUI EMPIEZA MOVIL+*************  */
    });
  }
}
