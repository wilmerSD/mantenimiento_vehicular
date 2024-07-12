import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/typesvalidation_controller.dart';
import 'package:get/get.dart';

class TypeValidationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeValidationController());
  }
}
