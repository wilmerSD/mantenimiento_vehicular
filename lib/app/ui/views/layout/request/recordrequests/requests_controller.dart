import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_authorization_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/schedules/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestController extends GetxController {
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
  final _permissionRepository = Get.find<RegisterJustificationRepository>();

  //VARIABLES

  TextEditingController firstDate = TextEditingController(text: '');
  TextEditingController endDate = TextEditingController(text: '');
  TextEditingController datePermission = TextEditingController(text: '');
  TextEditingController dateAuthorization = TextEditingController(text: '');
  RxBool isLoading = RxBool(false);
  RxBool isLoadingRequest = RxBool(false);
  RxInt idEmployee = RxInt(0);
  var scheduleByUser = Data().obs;
  RxList<DatumSelect2Combo> stateListToCreateTEC = RxList([
    DatumSelect2Combo(value: -1, text: "Seleccionar"),
    DatumSelect2Combo(value: 2, text: "Permisos"),
    DatumSelect2Combo(value: 3, text: "Vacaciones"),
  ]);
  RxList<DatumSelect2Combo> listHours = RxList([
    DatumSelect2Combo(value: -1, text: "Seleccionar"),
    DatumSelect2Combo(value: 1, text: "1"),
    DatumSelect2Combo(value: 2, text: "2"),
    DatumSelect2Combo(value: 3, text: "3"),
  ]);
  RxInt idRol = RxInt(1);
  RxInt chooseTimes = RxInt(-1);
  RxInt currentRequest = RxInt(-1);
  TextEditingController nameTEC = TextEditingController(text: '');
  TextEditingController lastNames = TextEditingController(text: '');
  RxList<DatumWorkers> usersList = RxList([]);
  TextEditingController names = TextEditingController(text: '');
  TextEditingController namesUserAuthorization =
      TextEditingController(text: '');
  TextEditingController lastNamesUserAuthorization =
      TextEditingController(text: '');
  TextEditingController documentNroUserAuthorization =
      TextEditingController(text: '');
  TextEditingController documentNro = TextEditingController(text: '');
  TextEditingController reasonToPermission = TextEditingController(text: '');
  TextEditingController reasonToAuthorization = TextEditingController(text: '');
  TextEditingController dateToPermission = TextEditingController(text: '');
  TextEditingController normalAdmissionTime = TextEditingController(text: '');
  TextEditingController hourModifiedAdmissionTime =
      TextEditingController(text: '00:00:00');
  TextEditingController dniSearchController = TextEditingController(text: '');
  RxBool statusPermission = false.obs;
  RxBool statusAuthorization = false.obs;
  RxBool requestSpecial = RxBool(false);
  RxString statusMessageUserPermission = RxString("");
  RxString statusMessageUserAuthorization = RxString("");
  RxInt userSelected = RxInt(-1);
  RxInt documentosID = RxInt(1);
  int page = 1;
  RxInt currentPage = RxInt(1);
  RxString namesEmployee = RxString("");
  RxInt userIndex = RxInt(-1);
  RxInt pageIndex = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt quantityPages = RxInt(0);
  RxInt userId = RxInt(1);
  RxInt userIdAdmin = RxInt(1);
  RxInt idUserAuthorizarion = RxInt(1);
  RxBool isVisible = false.obs;
  RxString startTime = RxString("");
  RxString messageError = RxString("");
  RxString statusMessageVacations = RxString("");
  RxBool statusVacations = false.obs;
  TextEditingController reasonVacations = TextEditingController(text: '');
  RxString messageErrorVacations = RxString("");
  RxInt typeDocument = RxInt(0);
  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();
  String cip = '';
  int adelanto = 0;
  TextEditingController truncatedDay = TextEditingController();
  TextEditingController pendingDay = TextEditingController();
  TextEditingController expiredDay = TextEditingController();
  TextEditingController lawDay = TextEditingController();
  RxBool isPreviewVacation = RxBool(false);
  RxInt isAutovalidate = RxInt(0);
  String idUser = "";

  //FUNCTIONS
  /* 📌 Funciones a inizalizar */
  void initialize() async {
    await getDateCurrent();
    await getInformationUser();
    /* await getScheduleByUser(idEmployee); */
    await getIndicatorsVacations();
  }

  //Nombres del usuario:
  getInformationUser() async {
    idEmployee.value = int.parse(await StorageService.get(Keys.kIdUser));
    idUser = await StorageService.get(Keys.kIdUser);
    names.text = await StorageService.get(Keys.kNameUser);
    documentNro.text = await StorageService.get(Keys.kUserName);
    idRol.value = int.parse(await StorageService.get(Keys.kIdRole));
    cip = SesionDataTemporary.data["CIP"];
    print(cip);
  }

  //funcions
  validateForm(BuildContext context) async {
    /* FocusScope.of(context).unfocus(); */
    if (datePermission.text.trim() == "") {
      messageErrorVacations.value = 'Debe ingresar una fecha de permiso';
      showToastNow(2, "error", messageErrorVacations.value);
      return;
    }

    await addPermission();
  }

  validateVacations() async {
    if (firstDate.text.trim() == "" || endDate.text.trim() == "") {
      messageErrorVacations.value =
          'Debe ingresar una rango de fechas para las vacaciones';
      showToastNow(2, "error", messageErrorVacations.value);
      return;
    }
    if (Helpers.compareDates(firstDate.text, endDate.text) > 0) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: "La fecha inicio no puede ser mayor",
      );
      return;
    }
    await postRegisterVacationSVC();
  }

  //funciones
  validateAuthorization(BuildContext context) async {
    /* FocusScope.of(context).unfocus(); */
    if (dateAuthorization.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Debe ingresar una fecha para la autorización",
      );
      return;
    }
    if (chooseTimes.value == -1) {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Debe elegir una hora antes para la autorización",
      );
      return;
    }

    await addAuthorization();
  }

  //Registrar permiso
  addPermission() async {
    isLoadingRequest.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      /* String IdRol = await StorageService.get(Keys.kIdRole); */
      final response = await _permissionRepository.postRegisterPermission(
          RequestAddPermissionModel(
              idUser: int.parse(Iduser),
              idRole: idRol.value,
              datePermission: Helpers.changeDateToyyyyMMdd(datePermission.text),
              reason: reasonToPermission.text));

      statusPermission.value = response.success;
      statusMessageUserPermission.value = response.statusMessage;
      isLoadingRequest.value = false;
      if (!response.success) {
        showToastNow(2, "error", statusMessageUserPermission.value);
        return;
      }
      cleanReasonPermission();

      showToastNow(0, "success", statusMessageUserPermission.value);
    } catch (e) {
      isLoadingRequest.value = true;
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingRequest.value = false;
    }
  }

  //Registrar autorización
  addAuthorization() async {
    isLoadingRequest.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _permissionRepository.postRegisterAuthorization(
          RequestAddAuthorizationModel(
              idUser: idUserAuthorizarion.value,
              date: Helpers.changeDateToyyyyMMdd(dateAuthorization.text),
              reason: reasonToAuthorization.text,
              idUserAuthorizer: int.parse(Iduser),
              timePermission: chooseTimes.value));

      statusAuthorization.value = response.success;
      statusMessageUserAuthorization.value = response.statusMessage;
      isLoadingRequest.value = false;
      if (!response.success) {
        return;
      }
      /* cleanUserAuthorization(); */
    } catch (error) {
      isLoadingRequest.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo más tarde';
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(error.toString()),
      );
    } finally {
      isLoadingRequest.value = false;
    }
  }

  /*   cleanReasonAuthorization() {
    dateAuthorization.text = "";
    reasonToAuthorization.text = "";
    statusAuthorization.value = false;
  } */

  cleanReasonPermission() {
    datePermission.text = "";
    reasonToPermission.text = "";
    statusPermission.value = false;
  }

  cleanReasonVacations() {
    firstDate.text = "";
    endDate.text = "";
    reasonVacations.text = "";
    statusVacations.value = false;
  }

  /* 📌 Para limpiar variables de busqueda*/
  void clean() {
    nameTEC.text = '';
    usersList.value = [];
    dniSearchController.text = "";
    userIndex.value = -1;
  }

  //Limpiar información del usuario elegido para autorización
  cleanUserAuthorization() {
    dateAuthorization.text = '';
    chooseTimes.value = -1;
    hourModifiedAdmissionTime.text = '';
    reasonToAuthorization.text = '';
    statusAuthorization.value = false;
  }

  /* 📌 Para limpiar variables de solicitud especial*/
  void cleanVariablesRequestSpecial() {
    dateAuthorization.text = '';
    normalAdmissionTime.text = '';
    chooseTimes.value = -1;
    hourModifiedAdmissionTime.text = '';
    reasonToAuthorization.text = '';
  }

  /* 📌 Para limpiar variables de solicitud */
  void cleanVariablesRequest() {
    dateToPermission.text = '';
    normalAdmissionTime.text = '';

    hourModifiedAdmissionTime.text = '';
    reasonToPermission.text = '';
  }

  /* 📌 Obtener todos los trabajadores */
  Future<void> getAllWorkers(bool isPerPage) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    try {
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
      if (response.success) {
        usersList.value = response.data;
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Traer información de los trabajadores */
  Future<void> listUser(bool isPerPage) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    if (!isPerPage) {
      page = 1;
    }
    try {
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
        quantityPages.value = (response.count / kSizePage).ceil();
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Para pasar información del dataTable a la solicitud de permiso creado por lider */
  void passInformationOfDataTable(
      int idUsuarios,
      String nombres,
      String apellidos,
      String estado,
      String usuario,
      String rol,
      String modalidad,
      int idHorarios) {
    namesUserAuthorization.text = nombres;
    lastNamesUserAuthorization.text = apellidos;
    idUserAuthorizarion.value = idUsuarios;
    documentNroUserAuthorization.text = usuario;
  }

  /* 📌 Para obtener el horario del usuario */
  getScheduleByUser(idUserSchedule) async {
    try {
      final response = await _userRepository.scheduleByUser(
        RequestScheduleByUser(idUser: idUserSchedule.value.toString()),
      );
      scheduleByUser.value = response.data ?? Data();
      startTime.value = scheduleByUser.value.horaInicio ?? '';
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  //sustraer horas
  String substractHours(String horaInicial, int horasARestar) {
    if (horasARestar == -1) {
      horasARestar = 0;
    }
    DateTime horaFinal = DateFormat("HH:mm").parse(horaInicial);
    horaFinal = horaFinal.subtract(Duration(hours: horasARestar));
    String horaFinalStr = DateFormat("HH:mm").format(horaFinal);

    return horaFinalStr;
  }

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 3000));
    showToast.value = false;
  }

  int truncatedDayp = 0;
  int pendingDayp = 0;
  int expiredDayp = 0;
  int lawDayp = 0;

  /* 📌 Obtener indicadores vacacionales */
  Future<void> getIndicatorsVacations() async {
    try {
      final response = await _permissionRepository.getIndicatorsSGV(cip, idUser);
      if (response.success) {
        Indicador responseIndicators = response.data!.indicador!;

        truncatedDayp = responseIndicators.diasTruncos ?? 0;
        pendingDayp = responseIndicators.diasPendientes ?? 0;
        expiredDayp = responseIndicators.diasVencidos ?? 0;
        lawDay.text = responseIndicators.fechaDerecho ?? '';

        truncatedDay.text = truncatedDayp.toString();
        pendingDay.text = pendingDayp.toString();
        expiredDay.text = expiredDayp.toString();
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Registrar vacaciones en SVG */
  Future<void> postRegisterVacationSVC() async {
    if (isPreviewVacation.value == true) {
      adelanto = 1;
    } else {
      adelanto = 0;
    }
    try {
      final response = await _permissionRepository.postRegisterVacations(
          RequestVacationSvgModel(
              codigo: cip,
              perfil: "U",
              inicio: firstDate.text,
              fin: endDate.text,
              adelanto: adelanto.toString(),
              idUser: idUser));

      if (!response.success) {
        showToastNow(2, "error", response.data.descripcion);
        return;
      }
      showToastNow(0, "success", "${response.data.mensaje}");
      cleanDatesVacation();
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      adelanto = 0;
    }
  }

  /* 📌 Limpiar variables de solicitud de vacaciones */
  void cleanDatesVacation() {
    firstDate.text = '';
    endDate.text = '';
    isPreviewVacation.value = false;
  }

  /* 📌 Cambiar a true o false segun se requiera */
  void toggleCheckIsPreview() {
    isPreviewVacation.value =
        !isPreviewVacation.value; // Cambia el valor de isChecked
  }

  String dateToday = '';

  /* 📌 Obtener fechas */
  Future<void> getDateCurrent() async {
    DateTime now = DateTime.now();
    dateToday = DateFormat('dd/MM/yyyy').format(now);
  }
}
