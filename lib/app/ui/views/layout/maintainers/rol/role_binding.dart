import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/rol/role_controller.dart';
import 'package:get/get.dart';

class RoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoleController());
  }
}
