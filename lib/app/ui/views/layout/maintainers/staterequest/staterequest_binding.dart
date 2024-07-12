import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/staterequest_controller.dart';
import 'package:get/get.dart';

class StateRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StateRequestController());
  }
}
