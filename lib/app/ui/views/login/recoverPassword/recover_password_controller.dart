import 'package:app_valtx_asistencia/app/models/request/users/request_changepass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_recoverpass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_verifycode_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/dialogs/result_dialog.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/status_message_code.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  @override
  void onInit() {
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

  //VARIABLES
  RxBool isLoading = RxBool(false);
  RxBool successRespondEmail = RxBool(false);
  RxBool successRespondCode = RxBool(false);
  RxBool successCodeVerifided = RxBool(false);
  RxBool successChangePass = RxBool(false);
  RxBool isObscureText = RxBool(true);
  RxBool isVisible = true.obs;
  RxString errorTextEmail = RxString("");
  RxString errorTextPassword = RxString("");
  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();
  String idUser = '';
  int idUserInt = 0;
  int idUserToChangePass = 0;
  
  //TextEditingController
  TextEditingController textCtrlEmail = TextEditingController();
  TextEditingController textCtrlPassword = TextEditingController();
  TextEditingController textCtrlPasswordToConfirm = TextEditingController();
  TextEditingController textCtrlUser = TextEditingController();
  TextEditingController textCtrlCodeVerification = TextEditingController();

  // INSTANCES
  /* final _loginRepository = Get.find<LoginTDPRepository>(); */
  final _userRepository = Get.find<UserRepository>();
  

  //FUNCTIONS

  /*📌 Inicializar variables */
  void initialize() {}

  /*📌 Enviar código de verificación */
  Future<void> sendCodeVerification() async {
    isLoading.value = true;
    try {
      final response = await _userRepository.sendCodeToChangePass(RequestVerifyCodeModel(
        code: textCtrlCodeVerification.text,
        idUser: idUserToChangePass
      ) );
      if (!response.success) {
        showToastNow(3, "error",
          "Ups! ${response.data}");
        return;
      }
      successCodeVerifided.value = true;
      showToastNow(0, "success", response.data ?? 'Código verificado con éxito');

    } catch (error) {
      showToastNow(3, "error", Helpers.knowTypeError(error.toString()));
    }
    finally{
      isLoading.value = false;
    }
  }

  /* 📌 Cambiar contraseña */
  Future<void> changePassword() async {
    isLoading.value = true;
    try {
      final response =
          await _userRepository.changePasswordForgot(RequestChangePassModel(
        idUser: idUserToChangePass,
        password: textCtrlPassword.text,
        code: textCtrlCodeVerification.text
      ));
      if (!response.success) {
        showToastNow(3, "warning", "${response.data}");
        return;
      }
      showToastNow(0, "success", "${response.data}");
       
      Future.delayed(Duration(seconds: 2), () { 
        Get.offAllNamed(AppRoutesName.LOGIN);
      });
      
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }
  
  
  /* 📌 Enviar codigo para recuperar contraseña */
  Future<void> getCodeToChangePass() async {
    isLoading.value = true;
    try{
      final response  = await _userRepository.getCodeToChangePass(RecoverPassModel(email: textCtrlEmail.text));
      if(!response.success){
        showToastNow(3, "error",
          "Ups! ${response.data}");
        return;
      }
      idUserToChangePass = int.parse(response.data ?? "0");
      successRespondCode.value = true;
    }catch(e){
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    }finally{
      isLoading.value = false;
    }
  }

  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  /* 📌 Validar que los campos de contraseña sean iguales y no esten vacios */
  Future<void> validatePass(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (textCtrlPassword.text.trim() == "" || textCtrlPasswordToConfirm.text.trim() == "") {
      showToastNow(2, "warning", "Ingresar contraseñas");
      return;
    }
    if(textCtrlPassword.text.trim() != textCtrlPasswordToConfirm.text.trim()){
      showToastNow(2, "warning", "Asegurate que las contraseñas sean idénticas");
      return;
    }
    await changePassword();
  }

  /* 📌 Validar que el campo de código no este vacio y no sea mas de 6 digitos*/
  Future<void> validateCode(BuildContext context) async{
    if(textCtrlCodeVerification.text == ''){
      showToastNow(2, "warning", "Por favor, ingresar código");
      return;
    }
    if(textCtrlCodeVerification.text.length > 6){
      showToastNow(2, "warning", "El código no puede tener mas de seis dígitos");
      return;
    }
    await sendCodeVerification();
  }

  /* 📌 Validar que el campo de código no este vacio */
  Future<void> validateEmail(BuildContext context) async{
    if(textCtrlEmail.text == ''){
      showToastNow(2, "warning", "Por favor, ingresar su email");
      return;
    }
    await getCodeToChangePass();
  }
  
  /* /* 📌 Obtener información del usuario */
  Future<void> changePassword() async {
    try{
      final response = await _userRepository.changePassword(RequestChangePassModel(
        idUser: idUserInt,
        password: newPassword.text,
      ) );
      if(!response.success){
        print("aqui");
        showToastNow(3, "warning",
          "${response.data}");
        return;
      }
      showToastNow(0, "success", "${response.data}");

    }catch(e){
      showToastNow(3, "error",
          "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.");
    }finally{

    }
  } */

  /* 📌 Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  /* 📌 Optener Alerta */
  void getAlert(error) {
    HelpersComponents.getModal(
      Get.context!,
      ResultDialog(
        type: 0,
        title: "Ocurrió un error",
        subTitle: ToastMessages.getErrorMessage(error),
        doubleButton: false,
        aceptText: "Aceptar",
        onTapAcept: () {
          Get.back();
        },
      ),
    );
  }

  /* 📌 Regresar a login */
  void goToLogin() {
    Get.offNamed(AppRoutesName.LOGIN);
  }
}
