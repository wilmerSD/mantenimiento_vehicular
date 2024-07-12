import 'dart:async';
import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/response/menu/response_menu_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/dialogs/result_dialog.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/messages/page_found.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/rol/role_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/staterequest_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/typesrequest_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/typesvalidation_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/workmodality_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/historical_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/myprofile/myprofile_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/myrequest_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/changepass/changepass_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/profile_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_view.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:html' as html;

import 'package:iconsax/iconsax.dart';

class LayoutController extends GetxController {
  @override
  void onInit() async {
    /* await initialize(); */
    await listenRoute();
    focusNode.addListener(_handleBlur);

    await load();

    //setScreen();
    //startTimerToExpire();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleBlur);
    focusNode.dispose();
    super.dispose();
  }

  //INSTANCES
  FocusNode focusNode = FocusNode();

  //VARIABLES
  RxList<ResponseMenuOptionsModel> options = RxList([]);
  RxString menuRouteName = RxString("");
  RxBool isCollapsed = RxBool(false);
  RxBool isShowDownAvatar = RxBool(false);
  Timer? timer;
  Timer? timerToExpire;
  bool isLogOut = false;
  int minutesSesion = 720;
  String roleUser = '0';
  RxString nameUser = "Ashley Alexander Sánchez Díaz".obs;
  RxString nameRolUser = "Administrador".obs;

  //FUNCTIONS
  /* 📌 Para inicializar funciones */
  Future<void> initialize() async {
    await _getinformationUser();
  }

  /* 📌 Para obtener el rol del usuario y segun ello ocultar vistas (provisional) */
  Future<void> _getinformationUser() async {
    try{
      roleUser = await StorageService.get(Keys.kIdRole);
      nameUser.value = await StorageService.get(Keys.kNameUser);
      nameRolUser.value = SesionDataTemporary.data["nameRol"];
    }catch(e){

    }
    
  }

  /* 📌  */
  Future<void> listenRoute() async {
    int count = 0;
    html.window.onHashChange.listen((event) {
      count++;
      final route = "/${html.window.location.hash}";
      if (count == 1) {
        String myroute = validateRoute(route);
        RouteDataTemporary.currentRoute.value = myroute;
        setActive(myroute);
        Future.delayed(const Duration(milliseconds: 1300), () {
          html.window.history.pushState(null, '', myroute);
          count = 0;
        });
      }
    });
  }

  /* 📌 Seguridad - Validar rutas */
  String validateRoute(String myroute) {
    String resultRoute = AppRoutesName.UNKNOW;
    switch (myroute) {
      //HOME
      case AppRoutesName.HOME:
        resultRoute = AppRoutesName.HOME;
        break;

      //SEGURIDAD
      case AppRoutesName.PROFILE:
        resultRoute = AppRoutesName.PROFILE;
        break;

      case AppRoutesName.USERS:
        resultRoute = AppRoutesName.USERS;
        break;

      case AppRoutesName.CHANGEPASS:
        resultRoute = AppRoutesName.CHANGEPASS;
        break;

      //MANTENEDORES
      case AppRoutesName.MARKINGTYPE:
        resultRoute = AppRoutesName.MARKINGTYPE;
        break;

      case AppRoutesName.SCHEDULES:
        resultRoute = AppRoutesName.SCHEDULES;
        break;

      case AppRoutesName.STAFF:
        resultRoute = AppRoutesName.STAFF;
        break;

      case AppRoutesName.WORKMODALITY:
        resultRoute = AppRoutesName.WORKMODALITY;
        break;
      case AppRoutesName.TYPEREQUEST:
        resultRoute = AppRoutesName.TYPEREQUEST;
        break;

      case AppRoutesName.ROLES:
        resultRoute = AppRoutesName.ROLES;
        break;

      case AppRoutesName.STATEREQUEST:
        resultRoute = AppRoutesName.STATEREQUEST;
        break;

      case AppRoutesName.TYPEVALIDATION:
        resultRoute = AppRoutesName.TYPEVALIDATION;
        break;

      //MARCACIONES
      case AppRoutesName.DETAIL:
        resultRoute = AppRoutesName.DETAIL;
        break;

      case AppRoutesName.RECORDATTENDANCE:
        resultRoute = AppRoutesName.RECORDATTENDANCE;
        break;

      //SOLICITUDES
      case AppRoutesName.REQUEST:
        resultRoute = AppRoutesName.REQUEST;
        break;

      case AppRoutesName.MYREQUEST:
        resultRoute = AppRoutesName.MYREQUEST;
        break;

      case AppRoutesName.JUSTIFICATIONS:
        resultRoute = AppRoutesName.JUSTIFICATIONS;
        break;

      //REPORTES
      case AppRoutesName.AUDITREPORT:
        resultRoute = AppRoutesName.AUDITREPORT;
        break;

      case AppRoutesName.DAILYREPORT:
        resultRoute = AppRoutesName.DAILYREPORT;
        break;

      /* case AppRoutesName.MINISTRYREPORT:
        resultRoute = AppRoutesName.MINISTRYREPORT;
        break; */

      case AppRoutesName.OVERTIMEREPORT:
        resultRoute = AppRoutesName.OVERTIMEREPORT;
        break;

      case AppRoutesName.REQUESTREPORT:
        resultRoute = AppRoutesName.REQUESTREPORT;
        break;

      case AppRoutesName.DAILYLOCATIONREPORT:
        resultRoute = AppRoutesName.DAILYLOCATIONREPORT;
        break;

      default:
    }
    return resultRoute;
  }

  /* 📌 Drawer con items y subItems */
  Future<void> load() async {
    options.value = [
      //HOME
      ResponseMenuOptionsModel(
        colors: Colors.amber,
        route: AppRoutesName.HOME,
        nameOption: "Inicio",
        iconOption:
            const Icon(Iconsax.home,
                color: AppColors.backgroundColor, size: 20),
        isDesplegable: false,
        isActive: true,
        isDesplegated: false,
        isChild: false,
      ),

      //SEGURIDAD
      ResponseMenuOptionsModel(
          route: "/seguridad",
          nameOption: "Seguridad",
          iconOption: const Icon(Icons.security, color: Colors.white, size: 20),
          isDesplegable: true,
          isActive: false,
          isDesplegated: false,
          isChild: false,
          child: [
            ResponseMenuOptionsModel(
                route: AppRoutesName.CHANGEPASS,
                nameOption: "Cambio de contraseña",
                iconOption: const CircleSubItem(),
                isDesplegable: false,
                isActive: false,
                isDesplegated: false,
                isChild: true),
          ].where((element) => !element.isObscure!).toList().obs),

      //MANTENEDORES
      ResponseMenuOptionsModel(
          isObscure: false,
          route: AppRoutesName.MARKINGTYPE,
          nameOption: "Vehículo",
          iconOption: 
              const Icon(Iconsax.receipt_square,
                  color: AppColors.backgroundColor, size: 20),
          isDesplegable: false,
          isActive: false,
          isDesplegated: false,
          isChild: false),
     
     
      //REPORTES
      ResponseMenuOptionsModel(
          isObscure: roleUser == '1',
          route: AppRoutesName.STATEREQUEST,
          nameOption: "Registrar nuevo vehiculo",
          iconOption: 
              const Icon(Iconsax.presention_chart,
                  color: AppColors.backgroundColor, size: 20),
          isDesplegable: false,
          isActive: false,
          isDesplegated: false,
          isChild: false,)
    ].where((element) => !element.isObscure!).toList();
  }

  /* 📌  */
  void _handleBlur() {
    // Lógica que deseas ejecutar cuando el widget pierda el foco.
    isShowDownAvatar.value = !isShowDownAvatar.value;
  }

  /* 📌  */
  void startTimer() {
    timer?.cancel();
    timer = Timer(Duration(minutes: minutesSesion), logoutUser);
  }

  /* 📌  */
  /* void startTimerToExpire() {
    timerToExpire?.cancel();
    timerToExpire = Timer(SesionDataTemporary.timeToExpire, () {
      if (!isLogOut) {
        refreshToken(); 
      }
    });
  } */

  void logoutUser() {
    /* loginout(); */
    HelpersComponents.getModal(
      Get.context!,
      ResultDialog(
        type: 4,
        title: "Aviso de sesión expirada",
        subTitle: messageErrorUnauthorize,
        doubleButton: false,
        aceptText: "Aceptar",
        onTapAcept: () async {
          /* Get.offAllNamed(AppRoutesName.LOGIN); */
          loginout();
        },
      ),
    );
  }

  /* 📌  */
  /* void refreshToken() async {
    try {
      final response = await _loginRepository.refreshToken(
          RequestRefreshTokenTDPmodel(
              refreshToken: SesionDataTemporary.currentRefreshToken));
      if (response.state == true) {
        final bridge = response.token!.accessToken;
        String payloadBase64 = bridge!.split('.')[1];
        SesionDataTemporary.data = jsonDecode(utf8.decode(base64Url.decode(
            payloadBase64.padRight((payloadBase64.length + 3) & ~3, '='))));
        SesionDataTemporary.currentToken = response.token!.accessToken!;
        SesionDataTemporary.currentRefreshToken = response.token!.refreshToken!;
        SesionDataTemporary.init();
        await StorageService.deleteAll();
        await StorageService.set(
          key: Keys.KeyToken,
          value: bridge,
        );
        startTimerToExpire();
        load();
      }
    } catch (error) {}
  } */

  /* 📌  */
  /* void logoutUser() {
    logout(true);
    HelpersComponents.getModal(
      Get.context!,
      ResultDialog(
        type: 4,
        title: "Aviso de sesión expirada",
        subTitle: messageErrorUnauthorize,
        doubleButton: false,
        aceptText: "Aceptar",
        onTapAcept: () async {
          //Get.offAllNamed(AppRoutes.LOGIN);
        },
      ),
    );
  } */

  /* 📌  */
  void setDesplegated(String route) {
    ResponseMenuOptionsModel option =
        options.firstWhere((element) => element.route == route);
    int index = options.indexWhere((element) => element.route == route);
    option.isDesplegated = !option.isDesplegated!;
    options[index] = option;
  }

  /* 📌  */
  void collapseAll() {
    for (var i = 0; i < options.length; i++) {
      ResponseMenuOptionsModel option = options[i];
      option.isDesplegated = false;
      options[i] = option;
    }
  }

  /* 📌  */
  void setActive(String route) {
    options.value = activeOption(route, options);
    RouteDataTemporary.currentRoute.value = route;
    if (!Responsive.isDesktop(Get.context!)) {
      Get.back();
    }
  }

  /* 📌  */
  List<ResponseMenuOptionsModel> activeOption(
      String route, List<ResponseMenuOptionsModel> list) {
    List<ResponseMenuOptionsModel> myListTemporal = list
        .map((element) => element.route == route
            ? createOption(element, true, route)
            : createOption(element, false, route))
        .toList();
    return myListTemporal;
  }

  /* 📌  */
  ResponseMenuOptionsModel createOption(
      ResponseMenuOptionsModel element, bool state, String route) {
    return ResponseMenuOptionsModel(
        route: element.route,
        nameOption: element.nameOption,
        iconOption: element.iconOption,
        isDesplegable: element.isDesplegable,
        isActive: state,
        isDesplegated: element.isDesplegated,
        isChild: element.isChild,
        child: element.child == null
            ? null
            : activeOption(route, element.child ?? []));
  }

  /* 📌  */
  void collapseMenu() {
    isCollapsed.value = !isCollapsed.value;
  }

  /* 📌  */
  /*  void logout(bool auto) async {
    if (!auto) {
      Get.offAllNamed(AppRoutes.LOGIN);
      GRecaptchaV3.showBadge();
    }
    isLogOut = true;
    String value = await StorageService.get(Keys.KeyToken);
    try {
      final response = await _loginRepository.logoutAutenticathion(
          RequestLogoutTdPmodel(
              vusuario: SesionDataTemporary.data["vusuario"], token: value));
      if (response == true) {
        cleanDataSesion();
      }
    
    } catch (e) {}
  }
 */

  /* 📌 Para cerrar sesión */
  loginout() async {
    await StorageService.deleteAll();
    cleanDataSesion();
    Get.offAllNamed(AppRoutesName.LOGIN);
    /* html.window.location.replace('/#/login'); */
    /* html.window.location.href = "/#/login"; */
    /* html.window.history.replaceState(null, '', '/#/login'); */
    /* html.window.history.pushState(null, '', "/#/login"); */

    /* html.window.history.replaceState(null, '', '/#/login'); */
    /* html.window.history.pushState(null, '', "/#/login"); */
    /* html.window.location.href = "/#/login"; */
  }

  /*  void changePassword(bool auto) async {
    if (!auto) {
      /* Get.offAllNamed(AppRoutes.CHANGEPASS);
      GRecaptchaV3.showBadge();
    }
    isLogOut = true;
    String value = await StorageService.get(Keys.KeyToken); */
    try {
     /*  final response = await _loginRepository.logoutAutenticathion(
          RequestLogoutTdPmodel(
              vusuario: SesionDataTemporary.data["vusuario"], token: value));
      if (response == true) {
        cleanDataSesion();
      } */
    
    } catch (e) {}
  } */

  /* 📌  */
  void cleanDataSesion() async {
    /* await StorageService.deleteAll(); */
    SesionDataTemporary.reset();
  }

  /* 📌 Segun la pagina que seleccionemos nos redirigira a su vista */
  Widget setScreen() {
    switch (RouteDataTemporary.currentRoute.value) {
      //HOME
      case AppRoutesName.HOME:
        return const HomeView();

      //HOME
      case AppRoutesName.MYPROFILE:
        return const MyProfileView();

      //SEGURIDAD
      case AppRoutesName.PROFILE:
        return const ProfileView();

      case AppRoutesName.USERS:
        return const UsersView();

      case AppRoutesName.CHANGEPASS:
        return const ChangePassView();

      //MANTENEDORES
      case AppRoutesName.MARKINGTYPE:
        return const MarkingTypeView();

      case AppRoutesName.SCHEDULES:
        return const ScheduleView();

      case AppRoutesName.STAFF:
        return const StaffView();

      case AppRoutesName.WORKMODALITY:
        return const WorkModalityView();

      case AppRoutesName.TYPEREQUEST:
        return const TypeRequestView();

      case AppRoutesName.STATEREQUEST:
        return const StateRequestView();

      case AppRoutesName.TYPEVALIDATION:
        return const TypeValidationView();

      case AppRoutesName.ROLES:
        return const RoleView();

      //MARCACIONES
      case AppRoutesName.RECORDATTENDANCE:
        return const RecordattendanceView();

      case AppRoutesName.DETAIL:
        return const HistoricalView();

      //REQUEST
      case AppRoutesName.REQUEST:
        return const RequestView();

      case AppRoutesName.MYREQUEST:
        return const MyRequestView();

      case AppRoutesName.JUSTIFICATIONS:
        return const RequestManagementView();

      case AppRoutesName.UNKNOW:
        return const Center(
          child: PageNotFound(message: "No se encontró la página solicitada"),
        );
      default:
        return const Center(
          child: PageNotFound(message: "No se encontró la página solicitada"),
        );
    }
  }

  /* 📌 Para los titulos de cada vista */
  String setNavBarTitle() {
    switch (RouteDataTemporary.currentRoute.value) {
      //HOME
      case AppRoutesName.HOME:
        return "Inicio";

      //MI PERFIL
      case AppRoutesName.MYPROFILE:
        return "Mi pefil";

      //SEGURIDAD
      case AppRoutesName.USERS:
        return "Usuarios";

      case AppRoutesName.PROFILE:
        return "Perfiles";

      case AppRoutesName.CHANGEPASS:
        return "Cambio de contraseña";

      //REPORTES
      case AppRoutesName.AUDITREPORT:
        return "Reporte de auditoría";

      case AppRoutesName.DAILYREPORT:
        return "Reporte diario";

      case AppRoutesName.DAILYLOCATIONREPORT:
        return "Reporte diario-ubicación";

      case AppRoutesName.MINISTRYREPORT:
        return "Reporte de ministerio";

      case AppRoutesName.OVERTIMEREPORT:
        return "Reporte de horas extra";

      case AppRoutesName.REQUESTREPORT:
        return "Reporte de solicitudes";

      //MARCACIONES
      case AppRoutesName.DETAIL:
        return "Historial de asistencias";

      case AppRoutesName.RECORDATTENDANCE:
        return "Registro de asistencia";

      //SOLICITUDES
      case AppRoutesName.REQUEST:
        return "Registro de solicitudes";

      case AppRoutesName.MYREQUEST:
        return "Mis de solicitudes";

      case AppRoutesName.JUSTIFICATIONS:
        return "Bandeja de solicitudes";

      //MANTENEDORES
      case AppRoutesName.MARKINGTYPE:
        return "Vehículo";

      case AppRoutesName.SCHEDULES:
        return "Bandeja horarios";

      case AppRoutesName.STAFF:
        return "Asignación de horarios";

      case AppRoutesName.WORKMODALITY:
        return "Modalidad de trabajo";

      case AppRoutesName.TYPEREQUEST:
        return "Tipos de solicitudes";

      case AppRoutesName.TYPEVALIDATION:
        return "Tipos de validaciones";

      case AppRoutesName.STATEREQUEST:
        return "Registrar nuevo vehiculo";

      case AppRoutesName.ROLES:
        return "Bandeja de roles";

      case AppRoutesName.UNKNOW:
        return "Página desconocida";
      default:
        return "Página desconocida";
    }
  }
}

/* 📌 Pequeños circulos de los subItems */
class CircleSubItem extends StatelessWidget {
  const CircleSubItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.only(left: 15.0),
      decoration: const BoxDecoration(
          color: AppColors.grayMiddle,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
    );
  }
}
