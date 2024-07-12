
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_vacationscv_model.dart';
import 'package:app_valtx_asistencia/app/providers/mt4/mt4_services_provider.dart';
import 'package:get/get.dart';

class Mt4ServicesRepository {
 
  final _apiProvider = Get.find<Mt4ServicesProvider>();

  /* 📌 Indicadores vacacionales */
  Future<ResponseIndicatorsVacation> getIndicatorsVacations(String codeCIP, String idUser
  ) =>
      _apiProvider.getIndicatorsVacations(codeCIP, idUser);

}  
