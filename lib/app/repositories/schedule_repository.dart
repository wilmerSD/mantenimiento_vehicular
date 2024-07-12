import 'package:app_valtx_asistencia/app/models/request/schedules/request_activeschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_modifyschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_activeschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_modifyschedule_model.dart';
import 'package:app_valtx_asistencia/app/providers/schedule_provider.dart';
import 'package:get/get.dart';

class ScheduleRepository {
  final _apiProvider = Get.find<ScheduleProvider>();

  Future<ResponseModifyScheduleModel> postRegisterSchedule(
    RequestModifyScheduleModel request,
  ) =>
      _apiProvider.postRegisterSchedule(request);

  Future<ResponseActiveScheduleModel> putActiveSchedule(
    RequestActiveScheduleModel request,
  ) =>
      _apiProvider.putActiveSchedule(request);
}
