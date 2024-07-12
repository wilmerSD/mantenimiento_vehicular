import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }
}
