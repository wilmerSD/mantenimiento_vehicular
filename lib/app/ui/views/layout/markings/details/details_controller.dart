import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/providers/assistances_user_provider.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  @override
  void onInit() async {
    initialize();
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
  final _assistancesDayUserRepository = Get.find<AssistanceDayUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserProvider>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();
  final _typesValidationsRepository = Get.find<TypesValidationsRepository>();
  final _userRepository = Get.find<UserRepository>();

  //variables
  var responseTypesValidations = <Datum>[].obs;
  var responseDataDia = <DatumDay>[].obs;
  var responseDataMes = <DatumMonth>[].obs;
  var selectedDate = DateTime.now();
  var fecha = DateTime.now();
  var scheduleByUser = Data().obs;
  RxString statusMessageDay = ''.obs;
  RxString statusMessageMonth = ''.obs;
  RxString messageError = ''.obs;
  RxString formattedDateNow = ''.obs;
  RxString statusMessageTypesMarking = RxString("");
  String idRoleString = '';
  String userName = '';
  RxInt idRole = 0.obs;
  RxString day = ''.obs;
  RxInt montInt = 1.obs;
  RxString age = ''.obs;
  String month = '';
  String formattedDate = '';
  RxBool isLoading = false.obs;
  RxBool isLoadingUser = false.obs;
  RxBool isLoadingTypesValidation = false.obs;
  RxBool isVisible = false.obs;
  RxBool isVisibleDay = false.obs;
  /* RxString nameUser = "".obs; */
  var responseTypesMarking = <DatumAssistances>[].obs;
  TextEditingController nameTEC = TextEditingController(text: '');
  RxList<DatumWorkers> usersList = RxList([]);
  RxBool selectionColor = false.obs;

  int page = 1;
  RxInt currentPage = RxInt(1);
  RxString namesEmployee = RxString("");
  RxInt userIndex = RxInt(-1);
  RxInt pageIndex = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt quantityPages = RxInt(0);
  RxInt typeDocument = RxInt(0);
  String idUser = "";
  TextEditingController dniSearchController = TextEditingController(text: '');

  //Funtions
  void initialize() async {
    listUser(false);

    /* await detailsControllerDate(selectedDate);
    await detailsControllerDates(formattedDate);
    _typesValidationsuser2();
    assistancesDayUser(formattedDate);
    getAssistancesMonthUser(formattedDate); */
  }

  void informationOneUser() async {
    await getInfoUserLocal();
    await detailsControllerDate(selectedDate);
    await detailsControllerDates(formattedDate);
    typesValidationsuser2();
    assistancesDayUser(formattedDate);
    getAssistancesMonthUser(formattedDate);
    getScheduleByUser();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
  }
  /*   void nameUserProfile() async {
    nameUser.value = await StorageService.get(Keys.kNameUser);
  } */

  //Formatear la hora
  detailsControllerDate(selectedDates) {
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDates);
  }

  //Convertir la hora
  detailsControllerDates(String selectedDateFormat) {
    final parts = selectedDateFormat.split('-');
    age.value = parts[0];
    month = parts[1];
    montInt.value = int.parse(month);
    day.value = parts[2];
  }

  //Tipos de validacion
  typesValidationsuser2() async {
    final response = await _typesValidationsRepository.getTypesValidations(RequestScheduleByUser(idUser: idUser));
    responseTypesValidations.value = response.data;
    if (!response.success) {
      return;
    }
    /* await StorageService.set(
        key: Keys.kTypesValidation, value: json.encode(response.toJson())); */
  }

  RxInt idEmployee = RxInt(0);
  /* void getIdUserOfTable(int idworker){
    idEmployee = idworker;
  } */

  //Asistencias del mes de usuario
  void getAssistancesMonthUser(formattedDateToday) async {
    isLoading.value = true;
    try {
      final response =
          await _assistancesMonthkUserRepository.getAssistancesMonthDate(
        RequestAssistanceInformationModel(
            idUser: idEmployee.value, date: formattedDateToday, userId: idUser),
      );
      isLoading.value = false;
      responseDataMes.assignAll(response.data ?? []);
      statusMessageMonth.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }
  /* void getAssistancesMonthUser(formattedDateToday) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response =
        await _assistancesMonthkUserRepository.getAssistancesMonthDate(
      RequestAssistanceInformationModel(
          idUser: int.parse(Iduser), date: formattedDateToday),
    );
    isLoading.value = false;
    responseDataMes.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  } */

  //Asistencias del dia de usuario
  /* void assistancesDayUser(formattedDateToday) async {
    try {
      isVisibleDay.value = true;
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _assistancesDayUserRepository.getAssistancesDay(
        RequestAssistanceInformationModel(
          idUser: int.parse(Iduser),
          date: formattedDateToday,
        ),
      );

      isVisibleDay.value = false;
      responseDataDia.assignAll(response.data ?? []);
      statusMessageDay.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (error) {
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message:
            "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.",
      );
    }
  } */

  void assistancesDayUser(formattedDateToday) async {
    try {
      isVisibleDay.value = true;
      final response = await _assistancesDayUserRepository.getAssistancesDay(
        RequestAssistanceInformationModel(
          idUser: idEmployee.value,
          date: formattedDateToday,
          userId: idUser
        ),
      );

      isVisibleDay.value = false;
      responseDataDia.assignAll(response.data ?? []);
      statusMessageDay.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (e) {
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }

  getScheduleByUser() async {
    /* String Iduser = await StorageService.get(Keys.kIdUser); */
    try {
      final response = await _userRepository.scheduleByUser(
        RequestScheduleByUser(idUser: idEmployee.value.toString()),
      );
      scheduleByUser.value = response.data ?? Data();
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }

  /* 📌 Obtener el rol del usuario */
  _getinformationRole() async {
    idRoleString = await StorageService.get(Keys.kIdRole);
    idRole.value = int.parse(idRoleString);
  }

  //loginout
  loginout() async {
    await StorageService.deleteAll();
    /* Get.offNamed(AppRoutesName.LOGIN); */
    Get.offAllNamed(AppRoutesName.LOGIN);
  }

  /* 📌 Ir a detalles */
  navigateToScreen() {
    Get.back();
    Get.toNamed(AppRoutesName.DETAIL);
  }

  /* 📌 Para limpiar variables */
  void clean() {
    nameTEC.text = '';
    usersList.value = [];
    dniSearchController.text = "";
  }

  /* 📌 Obtener todos los trabajadores */
  Future<void> getAllWorkers(bool isPerPage) async {
    isLoadingUser.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response =
          await _userRepository.getAllWorkers(RequestAllWorkersModel(
        idUser: int.parse(Iduser),
        name: '',
        CIP: "",
        DNI: "",
        idEstateWorkerA: 1,
        idEstateWorkerI: 2,
        page: 1,
      ));
      usersList.value = [];
      if (response.success) {
        usersList.value = response.data;
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingUser.value = false;
    }
  }

  /*  validateFilterListUser() async {
    if (Helpers.simplerequiredRegex(
            dniSearchController.text,
            RegExp(
              r'^\d{8}$',
            ),
            "El campo debe contener ocho dígitos") ==
        "El campo debe contener ocho dígitos") {
      return;
    }

    await listUser(false);
  } */

  /* 📌 Traer información de los trabajadores */
  Future<void> listUser(bool isPerPage) async {
    isLoadingUser.value = true;
    if (!isPerPage) {
      page = 1;
    }
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response =
          await _userRepository.getAllWorkers(RequestAllWorkersModel(
        idUser: int.parse(Iduser),
        name: nameTEC.text,
        CIP: "",
        DNI: dniSearchController.text,
        idEstateWorkerA: 1,
        idEstateWorkerI: 2,
        page: isPerPage ? page : 1,
      ));
      usersList.value = [];
      if (response.success) {
        usersList.addAll([...response.data]);
        countPage.value = response.pageCount;
        pageIndex.value = response.pageIndex;
        countItem.value = usersList.length;
        /* countPage = response.count ?? 0; */
        //calculatePages(response.count);
        /* print(response.count); */
        quantityPages.value = (response.count / kSizePage).ceil();
        /* print("hello");
        print(quantityPages.value); */
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingUser.value = false;
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
}
