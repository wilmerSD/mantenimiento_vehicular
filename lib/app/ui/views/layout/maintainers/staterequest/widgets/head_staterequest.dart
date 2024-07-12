import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/staterequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadStateRequest extends StatelessWidget {
  const HeadStateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StateRequestController>(builder: (controller) {
      //ELEMENTS

      /* 📌 Boton para crear nuevo estado de solicitud */
      Widget btnAddNewStateRequest = BtnPrimary(
          text: "Nuevo estado de solicitud",
          onTap: () {
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            /*  controller.usersList.value = [];*/
            controller.postCreateNewStateRequest();
          });
      
      return Row(
        children: [
          Expanded(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*  Form(
                    key: keyFormSearch, 
                    child: */
                Row(
                  children: [
                    Expanded(flex: 2, child: btnAddNewStateRequest),
                    const Expanded(flex: 6, child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
