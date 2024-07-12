import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:get/get.dart';

class JustificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestManagementController());
  }
}
