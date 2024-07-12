import 'package:app_valtx_asistencia/app/models/request/request_email_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_sendemail_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class RegisterMarkingUserProvider {
  final _dioClient = Get.find<DioClient>();

  /* 📌 Para registrar asistencia */
  Future<ResponseRegisterMarkingUserModel> postRegisterMarking(
    RequestMarkingUserModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/assistance/addMarkingVirtual",
        bodyRaw: request.toMap(),
      );
      return ResponseRegisterMarkingUserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /* 📌 Para enviar correo cuando un trabajador registro su asitencia (tarde, fuera de hora, y sobretiempo1) */
  Future<ResponseSendEmailModel> postSendEmail(
    RequestEmailModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/notifications/latenessreport",
        bodyRaw: request.toMap(),
      );
      return ResponseSendEmailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
