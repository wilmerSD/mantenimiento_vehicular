import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_controller.dart';
import 'package:get/get.dart';

class RecoverPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoverPasswordController>(() => RecoverPasswordController());
  }
}
