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
import 'package:app_valtx_asistencia/app/providers/maintainers/maintainers_general_provider.dart';
import 'package:get/get.dart';

class MaintainersGeneralRepository {
  final _apiProvider = Get.find<MaintainersGeneralProvider>();

  /* 📌 Obtener información de tipo de solicitudes */
  Future<ResponseAllTypeRequest> getAllTypesRequest(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAllTypesRequest(request);

  /* 📌 Obtener información de tipo de marcaciones */
  Future<ResponseAllTypeMarkingModel> getAllTypesMarkings(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAllTypesMarkings(request);

  /* 📌 Obtener información de tipos de validaciones */
  Future<ResponseAllTypeValidationModel> getAllTypesValidations(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAllTypesValidations(request);
  
  /* 📌 Obtener información de tipos de modalidad de trabajo */
  Future<ResponseAllTypeModalityModel> getAllTypesModalityOfWork(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAllTypesModalityOfWork(request);

  /* 📌 Obtener información estado de solicitudes */
  Future<ResponseAllStateRequestModel> getAllStateOfRequest(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAllStateOfRequest(request);

  /* 📌 Obtener información estado general */
  Future<ResponseAllStateGeneralModel> getAllStatesPrimary(
    RequestScheduleByUser request 
  ) =>
      _apiProvider.getAllStatesPrimary(request);

   /* 📌 Modificar tipo de marcación */
   Future<ResponseMaintainersModel> updateTypeMark(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateTypeMark(request);

  /* 📌 Filtro tipo de marcaciones */
  Future<ResponseAllTypeMarkingModel> getTypesMarkFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getTypesMarkFilter(request);
 
 /* 📌 Filtro tipo de validaciones */
 Future<ResponseAllTypeValidationModel> getTypesValidationFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getTypesValidationFilter(request);

  /* 📌 Modificar tipo de validación */
  Future<ResponseMaintainersModel> updateTypeValidation(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateTypeValidation(request);

  /* 📌 Filto tipo de solicitud */
  Future<ResponseAllTypeRequest> getTypesRequestFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getTypesRequestFilter(request);

  
  /* 📌 Modificar tipo de solicitud */
  Future<ResponseMaintainersModel> updateTypeRequest(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateTypeRequest(request);
  
  /* 📌 Filtro modalidad de trabajo */
  Future<ResponseAllTypeModalityModel> getModalityWorkFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getModalityWorkFilter(request);

  /* 📌 Actualizar modalidad de trabajo */
  Future<ResponseMaintainersModel> updateWorkModality(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateWorkModality(request);

  /* 📌 Obtener estado solicitudes filtro */
  Future<ResponseAllStateRequestModel> getStateRequestFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getStateRequestFilter(request);

  /* 📌 Actualizar estado solicitudes */
  Future<ResponseMaintainersModel> updateStatesRequest(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateStatesRequest(request);

  /* 📌 Obtener información la tabla rol */
  Future<ResponseAllRolesModel> getRolActives(
    RequestScheduleByUser request 
  ) =>
      _apiProvider.getRolActives();

  /* 📌 Obtener información la tabla rol */
  Future<ResponseAllRolesModel> getAllRoles(
    RequestScheduleByUser request 
  ) =>
      _apiProvider.getAllRoles();

  /* 📌 Obtener estado solicitudes filtro */
  Future<ResponseAllRolesModel> getRolesFilter(
    RequestFilterTypesModel request
  ) =>
      _apiProvider.getRolesFilter(request);
  
  /* 📌 Actualizar roles */
  Future<ResponseMaintainersModel> updateRoles(
    RequestMaintainersModel request
  ) =>
      _apiProvider.updateRoles(request);
  
  /* 📌 Obterner lideres y administradores */
  Future<ResponseAllWorkersModel> getAllLeaders(
    RequestAllWorkersModel request
  ) =>
      _apiProvider.getAllLeaders(request);

  /* 📌 Actualizar rol del usuario */
  Future<ResponseMaintainersModel> updateRoleToUser(
    RequestUpdateRolUser request
  ) =>
      _apiProvider.updateRoleToUser(request);
  
  /* 📌 Cambiar o agregar lider a un usuario */
  Future<ResponseMaintainersModel> updateLeaderAsigned(
    RequestUpdateLeaderToUser request
  ) =>
      _apiProvider.updateLeaderAsigned(request);

}
