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
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_vacation_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_add_vacations_model.dart';
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
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class RegisterJustificationUserProvider {
  final _dioClient = Get.find<DioClient>();

  /* 📌 Registrar justificación */
  Future<ResponseJustificationModel> postRegisterJustification(
    RequestJustificationModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/addJustifications",
        bodyRaw: request.toMap(),
      );
      return ResponseJustificationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener el numero total de justificaciones pendientes */
  Future<ResponseGetPendingJustificationsModel> postPendingJustifications(
    RequestGetPendingJustificationsModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/justifications/getTotalPending",
        bodyRaw: request.toJson(),
      );
      return ResponseGetPendingJustificationsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener todas las justificaciones pendientes */
  Future<ResponseGetJustificationsModel> postAllJustifications(
    RequestGetJustificationsModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/justifications/getJustifications",
        bodyRaw: request.toJson(),
      );
      return ResponseGetJustificationsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar justificaciones */
  Future<ResponseUpdateJustificationsModel> postUpdateJustifications(
    RequestUpdateJustificationsModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/justifications/update",
        bodyRaw: request.toJson(),
      );
      return ResponseUpdateJustificationsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Registrar permisos */
  Future<ResponseAddPermissionModel> postRegisterPermission(
    RequestAddPermissionModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/addPermissions",
        bodyRaw: request.toJson(),
      );
      return ResponseAddPermissionModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener indicadores vacacionales de sgv */
  Future<ResponseIndicatorsVacation> getIndicatorsSGV(
    String codigo, String idUser
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/getholidayIndicators",
        bodyRaw: {"codigo": codigo, "idUser": idUser},
      );
      return ResponseIndicatorsVacation.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Registrar vacaciones */
  Future<ResponseVacationSgvModel> postRegisterVacations(
    RequestVacationSvgModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/addVacations",
        bodyRaw: request.toJson(),
      );
      return ResponseVacationSgvModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener mis solicitudes*/
  Future<ResponseGetAllMyRequestModel> getAllMyRequest(
    RequestGetAllMyRequestModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/getAllRequestOfWorker",
        bodyRaw: request.toMap(),
      );
      return ResponseGetAllMyRequestModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Registrar autorización*/
  Future<ResponseAddAuthorizationModel> postRegisterAuthorization(
    RequestAddAuthorizationModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/addAuthorization",
        bodyRaw: request.toJson(),
      );
      return ResponseAddAuthorizationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener solicitudes de trabajadores asignados a un lider*/
  Future<ResponseRequestAsignedToLeaderModel> getAllRequestToLeader(
    RequestRequestAsignedToLeader request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/getRequestOfWorkersAsignedToLeader",
        bodyRaw: request.toMap(),
      );
      return ResponseRequestAsignedToLeaderModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener todas las solicitudes de todos los trabajadores para rrhh*/
  Future<ResponseRequestAsignedToLeaderModel> getAllRequestOfAllWorkersToRRHH(
    RequestOfAllWorkersModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/permissions/getAllRequestOfAllWorkerstoRRHH",
        bodyRaw: request.toMap(),
      );
      return ResponseRequestAsignedToLeaderModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar los estados de solicitudes*/
  Future<ResponseManagementOfRequestModel> putUpdateStateOfRequest(
    RequestManagementOfRequestModel request,
  ) async {
    try {
      final response = await _dioClient.put(
        path: "/api/permissions/putManagementOfRequests",
        bodyRaw: request.toMap(),
      );
      return ResponseManagementOfRequestModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
