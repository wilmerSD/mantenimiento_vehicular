import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/widgets/appbarHome.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/widgets/details_schedule_user.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return AppBarHome();
   
        });
  }
}
