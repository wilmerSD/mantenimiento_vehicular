import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_updateleadertouser_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_updateroluser_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allroles_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstateRequest_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypeMarking_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypeRequest_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypemodality_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypevalidation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class MaintainersGeneralProvider {
  final _dioClient = Get.find<DioClient>();

  /* 📌 Obtener información de tipo de solicitudes */
  Future<ResponseAllTypeRequest> getAllTypesRequest(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfTypesRequest",
      );
      return ResponseAllTypeRequest.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información de tipo de marcaciones */
  Future<ResponseAllTypeMarkingModel> getAllTypesMarkings(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfTypesMaking",
      );
      return ResponseAllTypeMarkingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información de tipos de validaciones */
  Future<ResponseAllTypeValidationModel> getAllTypesValidations(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfTypesValidation",
      );
      return ResponseAllTypeValidationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información de tipos de modalidad de trabajo */
  Future<ResponseAllTypeModalityModel> getAllTypesModalityOfWork(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfModalityWork",
      );
      return ResponseAllTypeModalityModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información estado de solicitudes */
  Future<ResponseAllStateRequestModel> getAllStateOfRequest(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfStateOfRequest",
      );
      return ResponseAllStateRequestModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información estado general */
  Future<ResponseAllStateGeneralModel> getAllStatesPrimary(
    RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllInformationOfStateGeneral",
      );
      return ResponseAllStateGeneralModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Modificar tipo de marcación */
  Future<ResponseMaintainersModel> updateTypeMark(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableTypeMark",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Filtro tipo de marcaciones */
  Future<ResponseAllTypeMarkingModel> getTypesMarkFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getTypesMarkingFilter",
          bodyRaw: request.toMap());
      return ResponseAllTypeMarkingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Filtro tipo de validaciones */
  Future<ResponseAllTypeValidationModel> getTypesValidationFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getTypesValidationFilter",
          bodyRaw: request.toMap());
      return ResponseAllTypeValidationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Modificar tipo de validación */
  Future<ResponseMaintainersModel> updateTypeValidation(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableValidation",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Filtro tipo de solicitud */
  Future<ResponseAllTypeRequest> getTypesRequestFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getTypesRequestFilter",
          bodyRaw: request.toMap());
      return ResponseAllTypeRequest.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Modificar tipo de solicitud */
  Future<ResponseMaintainersModel> updateTypeRequest(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableTypesRequest",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Filtro modalidad de trabajo */
  Future<ResponseAllTypeModalityModel> getModalityWorkFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getModailityOfWorkFilter",
          bodyRaw: request.toMap());
      return ResponseAllTypeModalityModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar modalidad de trabajo */
  Future<ResponseMaintainersModel> updateWorkModality(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableWorkModality",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener estado solicitudes filtro */
  Future<ResponseAllStateRequestModel> getStateRequestFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getStateRequestFilter",
          bodyRaw: request.toMap());
      return ResponseAllStateRequestModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar estado solicitudes */
  Future<ResponseMaintainersModel> updateStatesRequest(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableStateRequest",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información la tabla rol */
  Future<ResponseAllRolesModel> getRolActives() async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getRolesActives",
      );
      return ResponseAllRolesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener información la tabla rol */
  Future<ResponseAllRolesModel> getAllRoles() async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/getAllRoles",
      );
      return ResponseAllRolesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obtener estado solicitudes filtro */
  Future<ResponseAllRolesModel> getRolesFilter(
      RequestFilterTypesModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/informationTables/getRolesFilter",
          bodyRaw: request.toMap());
      return ResponseAllRolesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar roles */
  Future<ResponseMaintainersModel> updateRoles(
      RequestMaintainersModel request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateTableRol",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Obterner lideres y administradores */
  Future<ResponseAllWorkersModel> getAllLeaders(
      RequestAllWorkersModel request) async {
    try {
      final response = await _dioClient.post(
          path: "/api/user/getLeaders", bodyRaw: request.toMap());
      return ResponseAllWorkersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar rol del usuario */
  Future<ResponseMaintainersModel> updateRoleToUser(
      RequestUpdateRolUser request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/user/putUpdateRolOfWorkers", bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Cambiar o agregar lider a un usuario */
  Future<ResponseMaintainersModel> updateLeaderAsigned(
      RequestUpdateLeaderToUser request) async {
    try {
      final response = await _dioClient.put(
          path: "/api/informationTables/putUpdateLiderAsignedToWork",
          bodyRaw: request.toMap());
      return ResponseMaintainersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
