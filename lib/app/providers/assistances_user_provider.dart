import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class AssistanceMonthUserProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseAssistancesMonthUserModel> getAssistancesMonthDate(
    RequestAssistanceInformationModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/user/markingMonth",
      bodyRaw: request.toMap(),
    );
    return ResponseAssistancesMonthUserModel.fromJson(response);
  }
}

class AssistanceDayUserProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseAssistancesDayUserModel> getAssistancesDay(
    RequestAssistanceInformationModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/markingDay",
        bodyRaw: request.toMap(),
      );
      return ResponseAssistancesDayUserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

class AssistanceWeekUserProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseAssistancesWeekUserModel> getAssistancesWeek(
    RequestIdUserModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/user/markingWeek",
        bodyRaw: request.toMap(),
      );
      return ResponseAssistancesWeekUserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
