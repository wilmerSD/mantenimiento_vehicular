import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_activeschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_allschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_modifyschedule_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_allSchedule_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/schedule_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SchedulesController extends GetxController {
  @override
  void onInit() async {
    initialize();
    super.onInit();
  }

  @override
  void onReady() async {
    /*  update(); */
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //INSTANCES
  final _userRepository = Get.find<UserRepository>();
  final _scheduleRepository = Get.find<ScheduleRepository>();
  final _maintainersRepository = Get.find<MaintainersGeneralRepository>();

  //TEXTEDITINGCONTROLLER
  TextEditingController scheduleFilter = TextEditingController(text: "");
  TextEditingController dateReport = TextEditingController(text: "");
  TextEditingController entryTime = TextEditingController(text: '');
  TextEditingController departureTime = TextEditingController(text: '');
  TextEditingController entryTimeException =
      TextEditingController(text: '00:00');
  TextEditingController departureTimeException =
      TextEditingController(text: '00:00');

  //VARIABLES
  int page = 1;
/*   int countPage = 0; */
  RxBool isSelected = RxBool(false);
  RxInt amountWorkers = RxInt(0);
  RxBool isCheckHeader = RxBool(true);
  RxBool isLoading = RxBool(false);
  RxList<DatumWorkers> usersList = RxList([]);
  RxList<DatumSchedule> scheduleList = RxList([]);
  RxBool showToast = RxBool(false);
  RxInt currentPage = RxInt(1);
  RxString idUser = RxString("");
  RxInt userIndex = RxInt(-1);
  RxInt idSchedule = RxInt(1);
  RxString names = RxString("");
  String idRoleString = '';
  RxInt idRole = 0.obs;
  TextEditingController timeInMinutesBreak = TextEditingController(text: '');
  int timeInMinutesBreakInt = 0;

  RxString namesEmployee = RxString("");
  RxString lastnames = RxString("");
  RxInt quantityPages = RxInt(0);
  Widget toast = const SizedBox();
  RxInt countPage = RxInt(1);
  RxInt pageIndex = RxInt(1);
  RxInt pageSize = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt currentStatus = RxInt(-1);
  RxInt currentStatusFilter = RxInt(-1);
  RxInt currentBreaks = RxInt(-1);
  RxInt currentException = RxInt(-1);
  RxBool statusException = RxBool(false);
  RxBool statusAddBreak = RxBool(false);
  RxBool isLoadingAddSchedule = RxBool(false);
  RxBool statusAddSchedule = RxBool(false);
  RxString statusMessageUserAddSchedule = RxString("");
  RxBool isLoadingActivateSchedule = RxBool(false);
  RxBool statusActivateSchedule = RxBool(false);
  RxString statusMessageActivateSchedule = RxString("");
  RxString messageError = RxString("");
  RxString scheduleFilterText = RxString("");
  RxInt scheduleFilterInt = RxInt(-1);
  RxInt idSchedulesActivate = RxInt(-1);
  RxInt statusSchedulesActivate = RxInt(-1);
  RxBool isLoadingStateMark = RxBool(false);

  /*  RxList<DatumSelect2Combo> listStatus = RxList([
    DatumSelect2Combo(value: -1, text: "Seleccionar"),
    DatumSelect2Combo(value: 1, text: "Activo"),
    DatumSelect2Combo(value: 0, text: "Inactivo"),
  ]); */
  RxList<DatumAllStateGeneral> listStatus = RxList([
    DatumAllStateGeneral(idEstado: -1, descripcion: "Seleccionar"),
  ]);

  RxList<DatumSelect2Combo> listBreak = RxList([
    DatumSelect2Combo(value: -1, text: "Seleccionar"),
    DatumSelect2Combo(value: 1, text: "Lunes"),
    DatumSelect2Combo(value: 2, text: "Martes"),
    DatumSelect2Combo(value: 3, text: "Miércoles"),
    DatumSelect2Combo(value: 4, text: "Jueves"),
    DatumSelect2Combo(value: 5, text: "Viernes"),
    DatumSelect2Combo(value: 6, text: "Sábado"),
    DatumSelect2Combo(value: 7, text: "Domingo"),
    DatumSelect2Combo(value: 8, text: "Sábado y Domingo"),
  ]);

  //FUNCTIONS
  /* 📌 A inicializar */
  void initialize() async {
    await _getinformationRole();
    names.value = await StorageService.get(Keys.kNameUser);
    lastnames.value = await StorageService.get(Keys.kNameUser);
    idUser.value = await StorageService.get(Keys.kIdUser);
    getAllStatesGeneral();
    await allSchedule();
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    isLoadingStateMark.value = true;
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser: idUser.value));

      if (!response.success) {
        return;
      }
      listStatus.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingStateMark.value = false;
    }
  }

  //funciones
  validateFilterSchedule() async {
    if (Helpers.simplerequiredRegex(
            scheduleFilter.text, RegExp(r'^H\d{1,}$'), "Formato inválido") ==
        "Formato inválido") {
      return;
    }

    await allSchedule();
  }

  Future<void> allSchedule() async {
    isLoading.value = true;
    scheduleFilterText.value =
        scheduleFilter.text.replaceAll(RegExp(r'\D'), '');
    scheduleFilterInt.value = scheduleFilterText.value.isEmpty
        ? -1
        : int.parse(scheduleFilterText.value);
    try {
      final response =
          await _userRepository.getAllSchedules(RequestAllScheduleModel(
        idHorario: scheduleFilterInt.value,
        idStatus: currentStatusFilter.value,
        idUser: idUser.value 
        
      ));
      scheduleList.value = [];
      if (response.success) {
        scheduleList.addAll([...response.data]);
        /* print(response.data); */
        /* print("holaaaaaaa ${scheduleList.length}"); */
        response.data;
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  validateAddSchedule(BuildContext context) async {
    /* FocusScope.of(context); */
    if (entryTime.text.trim() == "" || departureTime.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Tiene campos sin completar",
      );
      return;
    }
    if (Helpers.compareTimes(entryTime.text, departureTime.text) > 0) {
      /*  showToastNow(2, "warning",
          "La hora de ingreso no puede ser mayor a la hora de entrada"); */
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "La hora de entrada no puede ser mayor a la hora de salida",
      );
      return;
    }
    if (currentBreaks.value == -1 || currentStatus.value == -1) {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Tiene campos sin completar",
      );
      return;
    }
    if (statusException.value) {
      if (currentException.value == -1 ||
          entryTimeException.text.trim() == "" ||
          departureTimeException.text.trim() == "") {
        /* showToastNow(2, "warning", "Tiene campos sin completar"); */
        Helpers.showSnackBar(
          context,
          title: "Validar",
          message: "Tiene campos sin completar",
        );
        return;
      }
      if (currentException.value == currentBreaks.value ||
          (currentBreaks.value == 8 &&
              (currentException.value == 6 || currentException.value == 7))) {
        /* showToastNow(2, "warning", "Tiene campos sin completar"); */
        Helpers.showSnackBar(
          context,
          title: "Validar",
          message: "El día de descanso debe ser diferente al día de excepción",
        );
        return;
      }

      if (Helpers.compareTimes(
              entryTimeException.text, departureTimeException.text) >
          0) {
        /*  showToastNow(2, "warning",
          "La hora de ingreso no puede ser mayor a la hora de entrada"); */
        Helpers.showSnackBar(
          context,
          title: "Validar",
          message: "La hora de entrada no puede ser mayor a la hora de salida",
        );
        return;
      }
    }
    if (statusAddBreak.value) {
      if (timeInMinutesBreakInt == 0 ||
          timeInMinutesBreakInt < 30 ||
          timeInMinutesBreakInt > 90) {
        Helpers.showSnackBar(
          context,
          title: "Validar",
          message: "El tiempo de refrigerio debe estar entre 30 y 90 minutos",
        );
        return;
      }
    }

    await addSchedule();
    cleanVariableAddSchedule();
    Get.back();
  }

  //Añadir horario
  addSchedule() async {
    isLoadingAddSchedule.value = true;
    try {
      final response = await _scheduleRepository
          .postRegisterSchedule(RequestModifyScheduleModel(
        idSchedule: 0,
        timeStart: entryTime.text,
        timeEnd: departureTime.text,
        idRestDay: currentBreaks.value,
        idStatus: currentStatus.value,
        dayException: currentException.value,
        timeStartException: entryTimeException.text,
        timeEndException: departureTimeException.text,
        haveRefreshment: statusAddBreak.value,
        timeRefreshment: timeInMinutesBreakInt,
        idUser: idUser.value
      ));

      statusAddSchedule.value = response.success;
      statusMessageUserAddSchedule.value = response.statusMessage;
      isLoadingAddSchedule.value = false;

      if (!response.success) {
        showToastNow(2, "error", statusMessageUserAddSchedule.value);
        return;
      }
      allSchedule();
      showToastNow(0, "success", statusMessageUserAddSchedule.value);

      cleanVariableAddSchedule();
    } catch (error) {
      isLoadingAddSchedule.value = true;
      showToastNow(3, "error",
          "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.");
    } finally {
      isLoadingAddSchedule.value = false;
    }
  }

  //Desactivar o activar horario
  //Añadir horario
  activateSchedule() async {
    isLoadingActivateSchedule.value = true;
    idRoleString = await StorageService.get(Keys.kIdRole);
    try {
      final response = await _scheduleRepository
          .putActiveSchedule(RequestActiveScheduleModel(
        idProfile: int.parse(idRoleString),
        idSchedules: [idSchedulesActivate.value],
        status: statusSchedulesActivate.value,
        idUser: idUser.value
      ));

      statusActivateSchedule.value = response.success;
      statusMessageActivateSchedule.value = response.statusMessage;
      isLoadingActivateSchedule.value = false;
      if (!response.success) {
        return;
      }
    } catch (error) {
      isLoadingActivateSchedule.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo más tarde';
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: messageError.value,
      );
    } finally {
      isLoadingActivateSchedule.value = false;
    }
  }

  /* 📌 Limpiar variables */
  void cleanVariableAddSchedule() {
    entryTime.text = "";
    departureTime.text = "";
    currentBreaks.value = -1;
    currentStatus.value = -1;
    cleanVariableException();
    statusAddSchedule.value = false;
    statusMessageUserAddSchedule.value = "";
    statusException.value = false;
    timeInMinutesBreakInt = 0;
    timeInMinutesBreak.text = '';
    statusAddBreak.value = false;
  }

  /* 📌 Limpiar variables */
  void cleanVariableActivateSchedule() {
    statusActivateSchedule.value = false;
    statusMessageActivateSchedule.value = "";
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

  void toggleCheck() {
    statusException.value =
        !statusException.value; // Cambia el valor de isChecked
  }

  void toggleCheckRefreshment() {
    statusAddBreak.value =
        !statusAddBreak.value; // Cambia el valor de isChecked
  }

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 3000));
    showToast.value = false;
  }

  //Funcinoes:
  _getinformationRole() async {
    idRoleString = await StorageService.get(Keys.kIdRole);
    idRole.value = int.parse(idRoleString);
  }

  cleanVariableException() {
    currentException.value = -1;
    entryTimeException.text = "";
    departureTimeException.text = "";
  }

  /* 📌 Para limpiar variables */
  cleanVariableFilter() {
    scheduleFilter.text = "";
    scheduleFilterInt.value = -1;
    currentStatusFilter.value = -1;
  }
}
