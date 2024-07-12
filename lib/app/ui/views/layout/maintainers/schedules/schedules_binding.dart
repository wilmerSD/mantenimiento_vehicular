import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_controller.dart';
import 'package:get/get.dart';

class SchedulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchedulesController());
  }
}
