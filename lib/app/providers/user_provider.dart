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
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserProvider {
  final _dioClient = Get.find<DioClient>();

  /* 📌 Información de un usuario*/
  Future<ResponseUserInformationModel> getUserInformation(
    RequestUserInformationModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/information",
        bodyRaw: request.toMap(),
      );
      return ResponseUserInformationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Todos los trabajadores con su horario*/
  Future<ResponseAllWorkersModel> getAllWorkers(
    RequestAllWorkersModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/getAllWorkers",
        bodyRaw: request.toMap(),
      );
      return ResponseAllWorkersModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Cantidad de trabajadores*/
  Future<ResponseAllWorkersCounterModel> getAmountOfWorkers(
     RequestScheduleByUser request
  ) async {
    try {
      final response =
          await _dioClient.get(path: "/api/user/getAllWorkersAmount");
      return ResponseAllWorkersCounterModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //Horarios
  Future<ResponseAllScheduleModel> getAllSchedules(
    RequestAllScheduleModel request,
  ) async {
    try {
      final response = await _dioClient.post(
          path: "/api/schedules/schedules", bodyRaw: request.toJson());
      return ResponseAllScheduleModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //Añadir horario a usuario
  Future<ResponseAddScheduleToUserModel> addSchedulesToUser(
    RequestAddSchedulesToUserModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/schedules/addScheduleUser",
        bodyRaw: request.toJson(),
      );
      return ResponseAddScheduleToUserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Descargar reporte asistencia  */
  Future<void> getReport(String firstDate, String endDate, String idUser) async {
    try {
      final response = await _dioClient.post(
          path: "/api/report/reportAsistance",
          headers: {
            /* "Content-Type":
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", */
            'Content-Disposition': 'attachment; filename=MiArchivo.xlsx'
          },
          responseType: ResponseType.bytes,
          bodyRaw: {
            "FechaInicio": firstDate,
            "FechaFin": endDate,
          });
      /* print(response); */
      Helpers.attachmentFormat(
          response: response, filename: "Asistencias_$firstDate-$endDate.xlsx");
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Descargar reporte asistencia-ubicacion */
  Future<void> getReportAssistanceLocation(
      String firstDate, String endDate, String idUser) async {
    try {
      final response = await _dioClient.post(
          path: "/api/report/reportAsistanceWithLocation",
          headers: {
            /* "Content-Type":
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", */
            'Content-Disposition': 'attachment; filename=MiArchivo.xlsx'
          },
          responseType: ResponseType.bytes,
          bodyRaw: {
            "FechaInicio": firstDate,
            "FechaFin": endDate,
          });
      /* print(response); */
      Helpers.attachmentFormat(
          response: response,
          filename: "Asistencias-Ubicacion_$firstDate-$endDate.xlsx");
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Descargar reporte sobretiempo  */
  Future<void> getReportOvertime(String firstDate, String endDate, String idUser) async {
    try {
      final response = await _dioClient.post(
          path: "/api/report/reportOvertime",
          headers: {
            /* "Content-Type":
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", */
            'Content-Disposition': 'attachment; filename=MiArchivo.xlsx'
          },
          responseType: ResponseType.bytes,
          bodyRaw: {
            "FechaInicio": firstDate,
            "FechaFin": endDate,
          });
      /* print(response); */
      Helpers.attachmentFormat(
          response: response, filename: "Sobretiempo_$firstDate-$endDate.xlsx");
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Descargar reporte solicitudes  */
  Future<void> getReportRequest(
      int idTipoSolicitud, int idUser, String firstDate, String endDate, String userId) async {
    try {
      final response = await _dioClient.post(
          path: "/api/report/reportRequest",
          headers: {
            /* "Content-Type":
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", */
            'Content-Disposition': 'attachment; filename=MiArchivo.xlsx'
          },
          responseType: ResponseType.bytes,
          bodyRaw: {
            "idTipoSolicitud": idTipoSolicitud,
            "idUser": idUser,
            "FechaInicio": firstDate,
            "FechaFin": endDate,
          });
      /* print(response); */
      Helpers.attachmentFormat(
          response: response, filename: "Solicitudes_$firstDate-$endDate.xlsx");
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Descargar reporte de auditoría */
  Future<void> getReportAudit(
      int idUser, String firstDate, String endDate, String userId) async {
    try {
      final response = await _dioClient.post(
          path: "/api/report/reportAudit",
          headers: {
            /* "Content-Type":
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", */
            'Content-Disposition': 'attachment; filename=MiArchivo.xlsx'
          },
          responseType: ResponseType.bytes,
          bodyRaw: {
            "idUser": idUser,
            "FechaInicio": firstDate,
            "FechaFin": endDate,
          });
      Helpers.attachmentFormat(
          response: response, filename: "Auditoría_$firstDate-$endDate.xlsx");
    } catch (e) {
      rethrow;
    }
  }

  //Obtener horario por usuario
  Future<ResponseScheduleByUser> scheduleByUser(
    RequestScheduleByUser request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/schedules/scheduleByUser",
        bodyRaw: request.toJson(),
      );
      return ResponseScheduleByUser.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Agregar horario a usuario para otro dia  */
  Future<ResponseAddScheduleToUserModel> addScheduleAfter(
    RequestAddScheduleAfterModel request,
  ) async {
    try {
      final response = await _dioClient.put(
        path: "/api/informationTables/addScheduleToAsignmentSchedules",
        bodyRaw: request.toJson(),
      );
      return ResponseAddScheduleToUserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar contraseña el olvidar*/
  Future<ResponseGeneralModel> changePasswordForgot(
    RequestChangePassModel request,
  ) async {
    try {
      final response = await _dioClient.put(
        path: "/api/user/putupdatePasswordForgot",
        bodyRaw: request.toMap(),
      );
      return ResponseGeneralModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Actualizar contraseña */
  Future<ResponseGeneralModel> changePassword(
    RequestChangePassModel request,
  ) async {
    try {
      final response = await _dioClient.put(
        path: "/api/user/putupdatePassword",
        bodyRaw: request.toMap(),
      );
      return ResponseGeneralModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Recuperar contraseña recibir de código */
  Future<ResponseRecoverPassModel> getCodeToChangePass(
    RecoverPassModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/sendCodeVerfication",
        bodyRaw: request.toMap(),
      );
      return ResponseRecoverPassModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Recuperar contraseña envío de código */
  Future<ResponseVerifyCodeModel> sendCodeToChangePass(
    RequestVerifyCodeModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/verificationOfCode",
        bodyRaw: request.toMap(),
      );
      return ResponseVerifyCodeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
