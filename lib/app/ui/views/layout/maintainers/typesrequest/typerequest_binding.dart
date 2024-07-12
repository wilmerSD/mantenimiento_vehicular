import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/typesrequest_controller.dart';
import 'package:get/get.dart';

class TypeRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeRequestController());
  }
}
