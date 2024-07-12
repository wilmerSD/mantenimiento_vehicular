import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/myprofile/myprofile_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
        init: MyProfileController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenido,",
                        style: AppTextStyle(context).extra40(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Obx(
                        () => Text(
                          controller.nameUser.value,
                          textScaleFactor: 1,
                          style: AppTextStyle(context).bold40(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: BtnPrimaryInk(
                          text: "Registrar asistencia",
                          onTap: () => RouteDataTemporary.currentRoute.value =
                              AppRoutesName.RECORDATTENDANCE,
                        ),
                      )
                    ],
                  ),
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: ListView(
                    children: [
                      Text(
                        "Bienvenido,",
                        style: AppTextStyle(context).extra40(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Obx(
                        () => Text(
                          controller.nameUser.value,
                          textScaleFactor: 1,
                          style: AppTextStyle(context).bold40(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: BtnPrimaryInk(
                          text: "Registrar asistencia",
                          onTap: () => RouteDataTemporary.currentRoute.value =
                              AppRoutesName.RECORDATTENDANCE,
                        ),
                      )
                    ],
                  ),
                );
        });
  }
}
