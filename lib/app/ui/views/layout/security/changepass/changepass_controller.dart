import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_changepass_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {}

  //INSTANCES
  final _userRepository = Get.find<UserRepository>();

  //VARIABLES
  TextEditingController fullNamesUser = TextEditingController(text: 'Ashley Alexander Sánchez Díaz');
  TextEditingController email = TextEditingController(text: 'AlexanderSD@gmail.com');
  TextEditingController newPassword = TextEditingController();
  TextEditingController againNewPassword = TextEditingController();

  RxBool isLoading = false.obs;
  var responseUserInformation = DataUser().obs;
  RxString statusMessageUserInformation = RxString("");
  String idUser = '';
  int idUserInt = 0;
  RxBool isVisible = true.obs;
  TextEditingController emailString = TextEditingController(text: 'AlexanderSD@gmail.com');

  //FUNCTIONS
  /* 📌 Para inicializar variables */
  void _initialize() async {
    /* await getInfoUserLocal(); */
  }

  /* 📌 Obtener datos local usuario */
  Future<void> getInfoUserLocal() async {
    fullNamesUser.text = await StorageService.get(Keys.kNameUser);
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
    print(idUser);
    emailString.text = SesionDataTemporary.data["email"];
    print(emailString);
  }

  RxBool autovalidateMode = true.obs;

  /* 📌 Obtener información del usuario */
  Future<void> changePassword() async {
    try {
      final response =
          await _userRepository.changePassword(RequestChangePassModel(
        idUser: idUserInt,
        password: newPassword.text,
      ));
      if (!response.success) {
        /* print("aqui"); */
        showToastNow(3, "warning", "${response.data}");
        return;
      }
      showToastNow(0, "success", "${response.data}");
      cleanPass();
      autovalidateMode.value = false;
      Future.delayed(const Duration(seconds: 2), () {
        loginout();
      });
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    } finally {
    }
  }

  void cleanPass() {
    newPassword.text = '';
    againNewPassword.text = '';
  }

  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  //loginout
  loginout() async {
    await StorageService.deleteAll();
    SesionDataTemporary.reset();
    Get.offAllNamed(AppRoutesName.LOGIN);
  }
}
