import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/typesvalidation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadTypeValidation extends StatelessWidget {
  const HeadTypeValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeValidationController>(builder: (controller) {
      //ELEMENTS

      /* 📌 Boton para crear nuevo tipo de validación */
      Widget btnAddNewTypeValidation = BtnPrimary(
          text: "Nuevo tipo de validación",
          onTap: () {
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
            controller.postCreateNewTypeValidation();
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
                    Expanded(flex: 2, child: btnAddNewTypeValidation),
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
