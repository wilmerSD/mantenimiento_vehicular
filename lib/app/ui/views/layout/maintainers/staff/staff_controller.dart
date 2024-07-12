import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_addscheduleafter_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_allschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_addschedulestouser_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_allSchedule_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {
  @override
  void onInit() {
    initialize();
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

  //INSTANCES
  final _userRepository = Get.find<UserRepository>();

  //TEXTEDITINGCONTROLLER
  TextEditingController userNameToSearchTEC = TextEditingController(text: "");
  TextEditingController nameToSearchTEC = TextEditingController(text: "");
  TextEditingController documentTEC = TextEditingController(text: "");
  TextEditingController dateReport = TextEditingController(text: "");

  //VARIABLES
  int page = 1;
/*   int countPage = 0; */
  RxBool isSelected = RxBool(false);
  RxInt amountWorkers = RxInt(0);
  RxBool isCheckHeader = RxBool(true);
  RxBool isLoading = RxBool(true);
  RxList<DatumWorkers> usersList = RxList([]);
  RxList<DatumSchedule> scheduleList = RxList([]);
  RxBool showToast = RxBool(false);
  RxInt currentPage = RxInt(1);
  RxInt idUser = RxInt(1);
  RxInt userIndex = RxInt(-1);
  RxInt idSchedule = RxInt(1);
  RxString names = RxString("");
  /* String idRoleStrings = '';
  RxInt idRoles = 0.obs; */

  RxString namesEmployee = RxString("");
  RxString lastnames = RxString("");
  RxInt quantityPages = RxInt(0);
  Widget toast = const SizedBox();
  RxInt countPage = RxInt(1);
  RxInt pageIndex = RxInt(1);
  RxInt pageSize = RxInt(1);
  RxInt countItem = RxInt(1);
  TextEditingController dateToAssing = TextEditingController();
  RxBool isForAnotherDay = RxBool(false);

  TextEditingController dniSearchController = TextEditingController(text: '');
  RxInt typeDocument = RxInt(0);

  String idUserLocal = '';
  int idUserInt = 0;

  //FUNCTIONS
  /* 📌 A inicializar */
  void initialize() async {
    await getInfoUserLocal();
    listUser(false);
    /* await _getinformationRole(); */
    await allSchedule();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUserLocal = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUserLocal);
    names.value = await StorageService.get(Keys.kNameUser);
    lastnames.value = await StorageService.get(Keys.kNameUser);
  }

  /* 📌 Traer información de los trabajadores */
  Future<void> listUser(bool isPerPage) async {
    isLoading.value = true;
    if (!isPerPage) {
      page = 1;
    }
    try {
      final response =
          await _userRepository.getAllWorkers(RequestAllWorkersModel(
        idUser: idUserInt,
        name: "",
        CIP: "",
        DNI: "",
        idEstateWorkerA: 1,
        idEstateWorkerI: 2,
        page: isPerPage ? page : 1,
      ));
      if (response.success) {
        usersList.addAll([...response.data]);
        countPage.value = response.pageCount;
        pageIndex.value = response.pageIndex;
        countItem.value = usersList.length;
        /* countPage = response.count ?? 0; */
        //calculatePages(response.count);
        /* print(response.count); */
        quantityPages.value = (response.count / kSizePage).ceil();
        /* print("hello"); */
        /*  print(quantityPages.value); */
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Obtener todos los horarios */
  Future<void> allSchedule() async {
    isLoading.value = true;
    try {
      final response =
          await _userRepository.getAllSchedules(RequestAllScheduleModel(
        idHorario: -1,
        idStatus: 1,
        idUser: idUserLocal
      ));
      if (response.success) {
        scheduleList.addAll([...response.data]);
        /* print(response.data); */
        response.data;
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Agregar horario inmediato */
  Future<void> addScheduleUser() async {
    isLoading.value = true;
    try {
      final response = await _userRepository.addSchedulesToUser(
          RequestAddSchedulesToUserModel(
              idUsers: idUser.value, idSchedule: idSchedule.value, idUser: idUserLocal));
      if (!response.success) {
        showToastNow(2, "warning", response.data);
        return;
      }

      showToastNow(0, "success", response.data);
      usersList.value = [];
      userIndex.value = -1;
      listUserFilter(false);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
      dateToAssing.text = '';
    }
  }

  /* 📌 Agregar horario para otra fecha */
  Future<void> addScheduleToAnotherDay() async {
    try {
      final response = await _userRepository.addScheduleAfter(
          RequestAddScheduleAfterModel(
              idAsignador: idUserInt,
              idWorker: idUser.value,
              fecha: Helpers.changeDateToyyyyMMdd(dateToAssing.text),
              idHorarios: idSchedule.value));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", response.data);
      usersList.value = [];
      userIndex.value = -1;
      listUserFilter(false);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      dateToAssing.text = '';
    }
  }

  /* 📌 Traer información de los trabajadores - Filtro */
  Future<void> listUserFilter(bool isPerPage) async {
    isLoading.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response =
          await _userRepository.getAllWorkers(RequestAllWorkersModel(
        idUser: int.parse(Iduser),
        name: documentTEC.text,
        CIP: "",
        DNI: dniSearchController.text,
        idEstateWorkerA: 1,
        idEstateWorkerI: 2,
        page: isPerPage ? page : 1,
      ));
      usersList.value = [];
      if (response.success) {
        usersList.addAll([...response.data]);
        /* countPage = response.count ?? 0; */
        countPage.value = response.pageCount;
        pageIndex.value = response.pageIndex;
        countItem.value = usersList.length;
        //calculatePages(response.count);
        /* print(response.count); */
        quantityPages.value = (response.count / kSizePage).ceil();
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Limpiar variables */
  void clean() {
    documentTEC.text = "";
    dniSearchController.text = '';
    usersList.value = [];
    listUser(false);
  }

  /* 📌 Calcular paginas */
  void calculatePages(int count) {
    quantityPages.value = (count / kSizePage).ceil();
    goToPage(page);
  }

  /* 📌 Ir por pagina */
  void goToPage(int page) {
    currentPage.value = page;
  }

  /* 📌 Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  /* /* 📌 Obtener rol del usuario */
  _getinformationRole() async {
    idRoleString = await StorageService.get(Keys.kIdRole);
    idRole.value = int.parse(idRoleString);
  } */

  /*   Future<void> amoungWorkers() async {
    isLoading.value = true;
    try {
      final response = await _userRepository.getAmountOfWorkers();
      if (response.success!) {
        amountWorkers.value = response.data ?? 2;
        /*  print(response.data); */
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  } */
}
