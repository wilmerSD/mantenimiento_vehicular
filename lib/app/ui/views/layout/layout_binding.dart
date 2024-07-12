import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:get/get.dart';

class LayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController());
  }
}
