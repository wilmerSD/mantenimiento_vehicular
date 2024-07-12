import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_view.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final routes = [
    GetPage(
      name: AppRoutesName.LOGIN,
      page: () => const LoginView(),
      binding: LoginBiding(),
    ),
    GetPage(
      name: AppRoutesName.RECOVERPASS,
      page: () => const RecoverPasswordView(),
      binding: RecoverPasswordBinding(),
    ),
    GetPage(
      name: AppRoutesName.LAYOUT,
      page: () => const LayoutView(), /* middlewares: [RouteMiddleware()] */
    ),
     GetPage(
      name: AppRoutesName.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

class RouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return SesionDataTemporary.currentToken == ""
        ? const RouteSettings(name: AppRoutesName.LOGIN)
        : null;
  }
}
