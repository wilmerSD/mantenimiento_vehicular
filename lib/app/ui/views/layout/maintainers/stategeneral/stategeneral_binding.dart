import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:get/get.dart';

class MarkingTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarkingTypeController());
  }
}
