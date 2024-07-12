import 'package:app_valtx_asistencia/app/models/request/schedules/request_addscheduleafter_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_allschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_addschedulestouser_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_changepass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_recoverpass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_verifycode_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_general_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_addscheduletouser_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_allSchedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_recoverpass_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_verifycode_model.dart';
import 'package:app_valtx_asistencia/app/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  /* 📌 Información de un usuario*/
  Future<ResponseUserInformationModel> getUserInformation(
    RequestUserInformationModel request,
  ) =>
      _apiProvider.getUserInformation(request);

  /* 📌 Todos los trabajadores con su horario*/
  Future<ResponseAllWorkersModel> getAllWorkers(
    RequestAllWorkersModel request,
  ) =>
      _apiProvider.getAllWorkers(request);

  /* 📌 Cantidad de trabajadores*/
  Future<ResponseAllWorkersCounterModel> getAmountOfWorkers(
    RequestScheduleByUser request
  ) =>
      _apiProvider.getAmountOfWorkers(request);

  //Horarios
  Future<ResponseAllScheduleModel> getAllSchedules(
    RequestAllScheduleModel request,
  ) =>
      _apiProvider.getAllSchedules(request);

  // Añadir horario a usuario
  Future<ResponseAddScheduleToUserModel> addSchedulesToUser(
          RequestAddSchedulesToUserModel request) =>
      _apiProvider.addSchedulesToUser(request);

  Future<void> getReport(String firstDate, String endDate, String idUser) =>
      _apiProvider.getReport(firstDate, endDate, idUser);

  //Reporte Asistencia-Ubicación
  Future<void> getReportAssistanceLocation(String firstDate, String endDate, String idUser) =>
      _apiProvider.getReportAssistanceLocation(firstDate, endDate, idUser);

  //Reporte sobretiempo
  Future<void> getReportOvertime(String firstDate, String endDate, String idUser) =>
      _apiProvider.getReportOvertime(firstDate, endDate, idUser);

  //Reporte solicitudes
  Future<void> getReportRequest(
          int idTipoSolicitud, int idUser, String firstDate, String endDate, String userId) =>
      _apiProvider.getReportRequest(
          idTipoSolicitud, idUser, firstDate, endDate, userId);

  //Reporte auditoría
  Future<void> getReportAudit(int idUser, String firstDate, String endDate, String userId) =>
      _apiProvider.getReportAudit(idUser, firstDate, endDate, userId);

  // Obtener horario por usuario
  Future<ResponseScheduleByUser> scheduleByUser(
          RequestScheduleByUser request) =>
      _apiProvider.scheduleByUser(request);

  /* 📌 Agregar horario a usuario para otro dia  */
  Future<ResponseAddScheduleToUserModel> addScheduleAfter(
          RequestAddScheduleAfterModel request) =>
      _apiProvider.addScheduleAfter(request);

  /* 📌 Actualizar contraseña el olvidar*/
  Future<ResponseGeneralModel> changePasswordForgot(RequestChangePassModel request) =>
      _apiProvider.changePasswordForgot(request);

  /* 📌 Actualizar contraseña */
  Future<ResponseGeneralModel> changePassword(RequestChangePassModel request) =>
      _apiProvider.changePassword(request);

  /* 📌 Recuperar contraseña obtener de código */
  Future<ResponseRecoverPassModel> getCodeToChangePass(RecoverPassModel request) =>
      _apiProvider.getCodeToChangePass(request);

  /* 📌 Recuperar contraseña envío de código */
  Future<ResponseVerifyCodeModel> sendCodeToChangePass(RequestVerifyCodeModel request) =>
      _apiProvider.sendCodeToChangePass(request);
  
}
