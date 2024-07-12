import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:get/get.dart';

class StaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StaffController());
  }
}
