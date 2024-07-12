import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/result_dialog.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast_message.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';

class ToastMessages implements Exception {
  static dynamic show(String message, {String? icon}) {
    return message == messageErrorUnauthorize
        ? HelpersComponents.getModal(
            Get.context!,
            ResultDialog(
              type: 4,
              title: "Upss, algo sucedió",
              subTitle: messageErrorUnauthorize,
              doubleButton: false,
              aceptText: "Aceptar",
              onTapAcept: () {
                Get.offNamed(AppRoutesName.LOGIN);
              },
            ),
          )
        : ToastMessage(
            icon: message == messageErrorValRepeat403 ||
                    message == messageErrorUnauthorize
                ? "danger.png"
                : "close-circle.png",
            text: getErrorMessage(message),
            typeToast: "error",
          );
  }

  static String getErrorMessage(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) {
      return 'No se encontró conexión a Internet,\nverifique su conexión';
    }
    switch (message) {
      case 'TIME_OUT':
        return 'Tiempo de espera agotado';
      case 'INVALID_TOKEN':
        return 'Estuvo por mucho tiempo sin actividad\nInicia sesión nuevamente';
      case 'INTERNAL_SERVER_ERROR':
        return messageErrorInternalServer;
      case 'NOT_FOUND':
        return messageErrorNotFound404;
      case 'DUPLICATE_KEY_ERROR':
        return messageErrorValRepeat403;
      case 'VALIDATION_ERROR':
        return messageErrorValError;
      case 'UNAUTHORIZED':
        return messageErrorUnauthorize;
      case 'ACCESS_DENIED':
        return messageErrorAccesDenied;
      case 'BUSINESS_ERROR':
        return messageErrorValError;
      default:
        return message;
    }
  }
}
