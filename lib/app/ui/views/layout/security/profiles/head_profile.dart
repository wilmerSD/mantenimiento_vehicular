import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/workmodality_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/create_profile.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadProfile extends StatelessWidget {
  const HeadProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      //ELEMENTS

      /* 📌 Boton para crear nuevo pefil */
      Widget btnAddNewTypeMarking = BtnPrimary(
          text: "Crear Perfil",
          onTap: () {
            HelpersComponents.getModal(context, const CreateProfile());
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
                    Expanded(flex: 1, child: btnAddNewTypeMarking),
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
