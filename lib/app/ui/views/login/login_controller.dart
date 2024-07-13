import 'dart:convert';
import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/dialogs/spinner.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/* import 'package:url_launcher/url_launcher.dart'; */

class LoginController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Instances
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isFirstTimeSession = RxBool(false);
  RxBool successCodeVerifided = RxBool(false);
  TextEditingController textCtrlCodeVerification = TextEditingController();
  TextEditingController textCtrlPasswordNew = TextEditingController();
  TextEditingController textCtrlPasswordToConfirm = TextEditingController();

  final _image = AssetImage('assets/reunion.jpg');

  //TextEditingController
  TextEditingController ctrlEmailText = TextEditingController();
  TextEditingController ctrlPasswordText = TextEditingController();

  //Functions
  void _initialize() async {
    ctrlEmailText.text = '';
    ctrlPasswordText.text = '';
  }

  /* 📌 ... */
  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  /* 📌 Validar que los campos del form esten completos antes de hacer la petición */
  void validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (ctrlEmailText.text.trim() == "" && ctrlPasswordText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su usuario y contraseña");
      return;
    }
     if (ctrlEmailText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su usuario");
      return;
    }
    if (ctrlPasswordText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su contraseña");
      return;
    }
    doAuthentication();
  }

  /* 📌 Validar que los campos del form de cambio de contraseña esten completos antes de hacer la petición */
  void validateFormChangePass(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (ctrlEmailText.text.trim() == "" && ctrlPasswordText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su usuario y contraseña");
      return;
    }
     if (ctrlEmailText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su usuario");
      return;
    }
    if (ctrlPasswordText.text.trim() == "") {
      showToastNow(2, "warning", "Por favor, ingrese su contraseña");
      return;
    }
    doAuthentication();
  }

  /* 📌 Hacer la autenticación */
  Future<void> doAuthentication() async {
    Spinner.show();
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
     /*  final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: ctrlEmailText.text.trim(),
          password: ctrlPasswordText.text.trim(),
        ),
      );
      messageError.value = response.statusMessage;
      if (!response.success) {
        isVisible.value = true;
        showToastNow(
            2, "error", "Ups! Ocurrió un error, ${response.statusMessage}");
        return;
      } */
      if (ctrlEmailText.text.trim() != "Alexander"){
        showToastNow(
            2, "error", "El usuario ingresado es incorrecto");
        return;
      }
      if (ctrlPasswordText.text.trim() != "Alexander"){
        showToastNow(
            2, "error", "La contraseña ingresada es incorrecta");
        return;
      }

    /*   //Guardar la información en sesión
      final bridge = response.data!.token;
      String payloadBase64 = bridge!.split('.')[1];
      SesionDataTemporary.data = jsonDecode(utf8.decode(base64Url.decode(
          payloadBase64.padRight((payloadBase64.length + 3) & ~3, '='))));
      await StorageService.set(key: Keys.kTokenSesion, value: bridge);
      await StorageService.set(
          key: Keys.kUserName, value: ctrlEmailText.text.trim());
      await StorageService.set(
          key: Keys.kPassword, value: ctrlPasswordText.text.trim());

      //Si es primera vez que inicia sesion
      /* isFirstTimeSession.value = SesionDataTemporary.data["isFisrtTime"] == 0; */

      //Guardamos variables en local Storage
      SesionDataTemporary.currentToken =
          await StorageService.get(Keys.kTokenSesion);
      final idRole = SesionDataTemporary.data["rol"];
      final idUser = SesionDataTemporary.data["id"];
      String firstnames = SesionDataTemporary.data["firstnames"];
      String lastnames = SesionDataTemporary.data["lastnames"];
      String fullNamesUser = "$firstnames $lastnames";
      await StorageService.set(key: Keys.kIdRole, value: idRole.toString());
      await StorageService.set(key: Keys.kNameUser, value: fullNamesUser);
      await StorageService.set(key: Keys.kIdUser, value: idUser.toString()); */

      //Ir a nueva ruta y eliminar de memoria controllers existentes
      /* if (isFirstTimeSession.value != true) {
        Get.offAllNamed(AppRoutesName.LAYOUT);
      } */
      Get.offAllNamed(AppRoutesName.LAYOUT);
    } catch (error) {
      isVisible.value = true;
      showToastNow(1, "error", Helpers.knowTypeError(error.toString()));
    } finally {
      Spinner.hide();
      isLoading.value = false;
    }
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

  /* 📌 Regresar a login */
  void goToLogin() {
    isFirstTimeSession.value = false;
  }

  /* 📌 Ir a recuperar contraseña */
  void recoverPassword() {
    Get.offNamed(AppRoutesName.RECOVERPASS);
  }

  void goToLogin01() async {
    Get.offAllNamed(AppRoutesName.LAYOUT);
  }

  /* 📌 Para redirigir a WhatsApp */
  /* launchWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/949238476');
    try{
      if (await canLaunchUrl (url)) {
            await launchUrl (url);
      } else {
          throw 'No se pudo abrir WhatsApp';
      }
    }catch(e){
      print("No se pudo conectar a whatsaap");
    }
    
  } */
}
