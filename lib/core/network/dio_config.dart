import 'package:app_valtx_asistencia/core/environment/env.dart';
import 'package:app_valtx_asistencia/core/network/interceptors/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioConfig {
  static void initialize() async {
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: Environment.appConfig["baseUrl"],
          connectTimeout: Duration(
            milliseconds: Environment.appConfig["connectTimeout"],
          ),
          receiveTimeout: Duration(
            milliseconds: Environment.appConfig["receiveTimeout"],
          ),
          responseType: ResponseType.json,
         
        ),
      )..interceptors.addAll([
          LoggerInterceptor(),
        ]),
      fenix: true,
    );
  }
}
