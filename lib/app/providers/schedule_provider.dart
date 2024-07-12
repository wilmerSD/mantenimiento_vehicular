import 'package:app_valtx_asistencia/app/models/request/schedules/request_activeschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_modifyschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_activeschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_modifyschedule_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class ScheduleProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseModifyScheduleModel> postRegisterSchedule(
    RequestModifyScheduleModel request,
  ) async {
    try {
      final response = await _dioClient.post(
        path: "/api/schedules/modifySchedule",
        bodyRaw: request.toJson(),
      );
      return ResponseModifyScheduleModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseActiveScheduleModel> putActiveSchedule(
    RequestActiveScheduleModel request,
  ) async {
    try {
      final response = await _dioClient.put(
        path: "/api/schedules/activateSchedule",
        bodyRaw: request.toJson(),
      );
      return ResponseActiveScheduleModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
