import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:app_valtx_asistencia/app/providers/types_validations_provider.dart';
import 'package:get/get.dart';

class TypesValidationsRepository {
	final _apiProvider = Get.find<TypesValidationsProvider>();

	Future<ResponseTypesValidationsModel> getTypesValidations(
    RequestScheduleByUser request
	) =>
		_apiProvider.getTypesValidations(request);

}
