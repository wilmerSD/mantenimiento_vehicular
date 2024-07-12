import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/providers/types_assistances_provider.dart';
import 'package:get/get.dart';

class TypesAssistancesUserRepository {
	final _apiProvider = Get.find<TypesAssistancesProvider>();

	Future<ResponseTypesAssistancesModel> getTypesAssistances(
    RequestScheduleByUser request
	) =>
		_apiProvider.getTypesAssistances(request);

}
