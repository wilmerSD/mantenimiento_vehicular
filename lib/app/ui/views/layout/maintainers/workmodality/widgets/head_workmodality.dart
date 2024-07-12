import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/workmodality_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadWorkModality extends StatelessWidget {
  const HeadWorkModality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkModalityController>(builder: (controller) {
      //ELEMENTS

      /* 📌 Boton para crear nuevo tipo de modalidad */
      Widget btnAddNewTypeMarking = BtnPrimary(
          text: "Nueva modalidad",
          onTap: () {
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            /*  controller.usersList.value = [];*/
            controller.createNewTypeModality();
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
                    Expanded(flex: 2, child: btnAddNewTypeMarking),
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
