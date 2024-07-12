import 'package:app_valtx_asistencia/app/ui/views/layout/myprofile/myprofile_controller.dart';
import 'package:get/get.dart';

class MyProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
  }
}
