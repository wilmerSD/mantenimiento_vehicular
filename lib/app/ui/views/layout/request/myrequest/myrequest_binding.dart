import 'package:app_valtx_asistencia/app/ui/views/layout/request/myrequest/myrequest_controller.dart';
import 'package:get/get.dart';

class MyRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyRequestController());
  }
}
