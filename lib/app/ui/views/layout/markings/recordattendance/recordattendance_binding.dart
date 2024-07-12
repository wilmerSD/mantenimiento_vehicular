import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_controller.dart';
import 'package:get/get.dart';

class RecordattendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordattendanceController());
  }
}
