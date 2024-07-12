import 'package:app_valtx_asistencia/app/ui/views/layout/security/changepass/changepass_controller.dart';
import 'package:get/get.dart';

class ChangePassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePassController());
  }
}
