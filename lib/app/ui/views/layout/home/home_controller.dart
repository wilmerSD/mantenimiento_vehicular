import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
  var scheduleByUser = Data().obs;
  String idEmployee = '';
   

  int page = 1;
  RxInt currentPage = RxInt(1);
  RxString namesEmployee = RxString("");
  RxInt userIndex = RxInt(-1);
  RxInt pageIndex = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt quantityPages = RxInt(0);
  RxInt typeDocument = RxInt(0);
  TextEditingController nameTEC = TextEditingController(text: 'Ashley Alexander');
  TextEditingController lastNames = TextEditingController(text: 'Sanchez Diaz');
  TextEditingController email = TextEditingController(text: 'Ashley@gmail.com');
  TextEditingController phone = TextEditingController(text: '932 465 222');
  TextEditingController nameVehicule = TextEditingController(text: 'KIA e-Niro.');
  TextEditingController ageVehicule = TextEditingController(text: '2020');
  TextEditingController numSerie = TextEditingController(text: '4S1213131REF');
  TextEditingController numChasis = TextEditingController(text: 'JSKFH1313');
  TextEditingController numDescriptionVehicule = TextEditingController(text: 'Este crossover capaz y totalmente eléctrico ofrece utilidad, conveniencia y una experiencia fascinante al volante.');
  TextEditingController stateBatery = TextEditingController(text: '80%');
  TextEditingController dateIngreso = TextEditingController(text: '17/05/2024');
  TextEditingController dateSalida = TextEditingController(text: '29/05/2024');
  TextEditingController dniSearchController = TextEditingController(text: '87328754');
  TextEditingController firstDate = TextEditingController(text: '87325467');
  TextEditingController endDate = TextEditingController(text: '');
  TextEditingController fechaIngres = TextEditingController(text: '05/06/2024');
  TextEditingController fechaSalida = TextEditingController(text: '03/07/2024');
  TextEditingController comentVehicule = TextEditingController(text: 'Vehiculo con modificaciones en las puertas para que se habran hacia arriba');
  
  RxList<DatumAllStateGeneral> listTypeMantenimiento = RxList([
    DatumAllStateGeneral(idEstado: -1, descripcion: "Seleccionar"),
    DatumAllStateGeneral(idEstado: 1, descripcion: "General"),
    DatumAllStateGeneral(idEstado: 1, descripcion: "Revisión Bateria"),
  ]);

  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();
  RxInt idUserReport = RxInt(-1);
  String idUser = "";
  RxInt currentTypeMantenimiento = RxInt(-1);

  //FUNCTIONS
  /* 📌 Para inicializar variables */
  void _initialize() async {
    /* await _getinformationUser(); */
    await _getinformationUserLocal();
    getScheduleByUser();
    nameUserProfile();
  }

  /* 📌 Obtener nombres completos del usuario */
  void nameUserProfile() async {
    nameUser.value = await StorageService.get(Keys.kNameUser);
  }

  /* 📌 Obtener información del usuario */
   /* Future<void> _getinformationUser() async {
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

      /* final idUser = response.data.idUser; */
      nameUser.value = '${response.data.names} ${response.data.lastNames}';
      idEmployee.value = response.data.idUser ?? 0;
      /* await StorageService.set(key: Keys.kIdUser, value: idUser.toString()); */
    } catch (e) {
      print(e);
    } finally {
      isLoadingUser.value = false;
    }
  } */

  /* 📌 Obtener información del usuario - local */
  Future<void> _getinformationUserLocal() async {
    isLoadingUser.value = true;
    try {
      nameUser.value= await StorageService.get(Keys.kNameUser);
      idEmployee = await StorageService.get(Keys.kIdUser);

    } catch (e) {
      print(e);
    } finally {
      isLoadingUser.value = false;
    }
  }

  getScheduleByUser() async {
    /* String Iduser = await StorageService.get(Keys.kIdUser); */
    try{

    
    final response = await _userRepository.scheduleByUser(
      RequestScheduleByUser(idUser: idEmployee),
    );

    scheduleByUser.value = response.data ?? Data();
    }catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }
  
 /*  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox(); */

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }
}
