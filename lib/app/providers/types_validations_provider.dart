import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class TypesValidationsProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseTypesValidationsModel> getTypesValidations(
     RequestScheduleByUser request
  ) async {
    try {
      final response = await _dioClient.get(
        path: "/api/informationTables/typesValidation",
      );
      return ResponseTypesValidationsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
