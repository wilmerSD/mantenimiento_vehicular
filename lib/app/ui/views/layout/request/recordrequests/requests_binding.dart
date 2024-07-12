import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:get/get.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestController());
  }
}
