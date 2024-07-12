import 'package:app_valtx_asistencia/app/models/response/solicitude/response_indicatorsvacation_model.dart';
import 'package:dio/dio.dart';

class Mt4ServicesProvider {
  final _dio = Dio();

  /* 📌 Indicadores vacacionales */
  Future<ResponseIndicatorsVacation> getIndicatorsVacations(
      String codeCIP, String idUser) async {
    try {
      _dio.options.headers = {
        'apiClave':
            "sTSR8wr4HeS5GAIR5ESP4TEFA76GojVlHAVj0RBHrEHdLUAniKij3AhIWQ8Ed",
        'Content-Type': 'application/json',
      };

      final queryParameters = {
        'codigo': codeCIP,
      };

      final response = await _dio.get(
        'http://10.4.220.15/ApiServiciosRRHH/indicadorVacaciones/indicadores',
        queryParameters: queryParameters,
      );
      return ResponseIndicatorsVacation.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
