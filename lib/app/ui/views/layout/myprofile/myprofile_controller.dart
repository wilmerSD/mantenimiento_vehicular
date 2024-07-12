import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
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
  RxString nameUser = "".obs;
  RxBool isLoadingUser = false.obs;
  var responseUserInformation = DataUser().obs;
  RxString statusMessageUserInformation = RxString("");

  //FUNCTIONS
  /* 📌 Para inicializar variables */
  void _initialize() async {
    await _getinformationUser();
    nameUserProfile();
  }

  /* 📌 Obtener nombres completos del usuario */
  void nameUserProfile() async {
    nameUser.value = await StorageService.get(Keys.kNameUser);
  }

  /* 📌 Obtener información del usuario */
  Future<void> _getinformationUser() async {
    isLoadingUser.value = true;
    try {
      final response = await _userRepository.getUserInformation(
        RequestUserInformationModel(
          username: await StorageService.get(Keys.kUserName),
          password: await StorageService.get(Keys.kPassword),
        ),
      );

      responseUserInformation.value = response.data;
      statusMessageUserInformation.value = response.statusMessage;

      if (!response.success) return;

      final idUser = response.data.idUser;
      final idRole = response.data.idRole;
      String nameUser = '${response.data.names} ${response.data.lastNames}';
      await StorageService.set(key: Keys.kIdUser, value: idUser.toString());
      await StorageService.set(key: Keys.kIdRole, value: idRole.toString());
      await StorageService.set(key: Keys.kNameUser, value: nameUser);
    } catch (e) {
      print(e);
    } finally {
      isLoadingUser.value = false;
    }
  }
}
