import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadMarkingType extends StatelessWidget {
  const HeadMarkingType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(
      init: MarkingTypeController(),
      builder: (controller) {
      //ELEMENTS

      /* 📌 Boton para buscar */
      Widget btnAddNewTypeMarking = BtnPrimary(
          text: "Nuevo tipo de marcación",
          onTap: () {
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
           /*  controller.usersList.value = [];
            controller.listUser(false); */
          });
          return Row(
        children: [
          Expanded(
            child: Container(
              /* padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ), */
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
          ),
        ],
      );
    });
  }
}
