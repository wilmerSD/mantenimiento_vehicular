import 'package:app_valtx_asistencia/app/models/request/request_get_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_pending_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_update_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_authorization_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_getallmyreques_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_managementofrequest_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_requestasignedtoleader_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_requestofallworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_get_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_pending_justifications_mode.dart';
import 'package:app_valtx_asistencia/app/models/response/response_update_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_authorization_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_getallmyrequest_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_managementofrequest_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_requestasignedtoleader_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_vacationscv_model.dart';
import 'package:app_valtx_asistencia/app/providers/justification_user_provider.dart';
import 'package:get/get.dart';

class RegisterJustificationRepository {
 
  
  final _apiProvider = Get.find<RegisterJustificationUserProvider>();

  /* 📌 Registrar justificación */
  Future<ResponseJustificationModel> postRegisterJustification(
    RequestJustificationModel request,
  ) =>
      _apiProvider.postRegisterJustification(request);

  /* 📌 Obtener el numero total de justificaciones pendientes */
  Future<ResponseGetPendingJustificationsModel> pendingJustifications(
    RequestGetPendingJustificationsModel request,
  ) =>
      _apiProvider.postPendingJustifications(request);

  /* 📌 Obtener todas las justificaciones pendientes */
  Future<ResponseGetJustificationsModel> postAllJustifications(
    RequestGetJustificationsModel request,
  ) =>
      _apiProvider.postAllJustifications(request);
  
  /* 📌 Actualizar justificaciones */
  Future<ResponseUpdateJustificationsModel> postUpdateJustifications(
    RequestUpdateJustificationsModel request,
  ) =>
      _apiProvider.postUpdateJustifications(request);

  /* 📌 Registrar permisos */
  Future<ResponseAddPermissionModel> postRegisterPermission(
    RequestAddPermissionModel request,
  ) =>
      _apiProvider.postRegisterPermission(request);

  /* 📌 Obtener indicadores vacacionales de sgv */
  Future<ResponseIndicatorsVacation> getIndicatorsSGV(
    String codigo, String idUser
  ) =>
      _apiProvider.getIndicatorsSGV(codigo, idUser);
      
  /* 📌 Registrar vacaciones */
  Future<ResponseVacationSgvModel> postRegisterVacations(
    RequestVacationSvgModel request,
  ) =>
      _apiProvider.postRegisterVacations(request);

  /* 📌 Obtener mis solicitudes*/
  Future<ResponseGetAllMyRequestModel> getAllMyRequest(
    RequestGetAllMyRequestModel request,
  ) =>
      _apiProvider.getAllMyRequest(request);

  /* 📌 Registrar autorización*/
  Future<ResponseAddAuthorizationModel> postRegisterAuthorization(
    RequestAddAuthorizationModel request,
  ) =>
      _apiProvider.postRegisterAuthorization(request);

  /* 📌 Obtener solicitudes de trabajadores asignados a un lider*/
  Future<ResponseRequestAsignedToLeaderModel> getAllRequestToLeader(
    RequestRequestAsignedToLeader request,
  ) =>
      _apiProvider.getAllRequestToLeader(request);

  /* 📌 Obtener todas las solicitudes de todos los trabajadores para rrhh*/
  Future<ResponseRequestAsignedToLeaderModel> getAllRequestOfAllWorkersToRRHH(
    RequestOfAllWorkersModel request,
  ) =>
      _apiProvider.getAllRequestOfAllWorkersToRRHH(request);

  /* 📌 Actualizar los estados de solicitudes */
  Future<ResponseManagementOfRequestModel> putUpdateStateOfRequest(
    RequestManagementOfRequestModel request,
  ) =>
      _apiProvider.putUpdateStateOfRequest(request);

}
