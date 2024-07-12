import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_managementofrequest_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_requestasignedtoleader_model.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_requestofallworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_update_justifications_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_requestasignedtoleader_model.dart';
import 'package:app_valtx_asistencia/app/providers/justification_user_provider.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/result_dialog.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/core/helpers/status_message_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestManagementController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
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

  //VARIABLES
  RxInt pendingJustifications = 0.obs;
  RxList<DataAsignedToLeader> listRequest = RxList([]);
  List<int> arrayId = [];
  RxBool isCheckHeader = RxBool(false);
  RxBool isToLeader = RxBool(false);
  RxBool showToast = RxBool(false);
  bool stateFormated = false;
  RxString nameUser = ''.obs;
  RxInt currentPage = RxInt(-1);
  RxInt idStatusJustification = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt pageIndex = RxInt(1);
  RxInt pageSize = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt showViewUponRequest = RxInt(-1);
  String idRoleString = '';
  int page = 1;
  RxString namesEmployee = RxString('');
  RxInt userIndex = RxInt(-1);
  RxInt quantityPages = RxInt(0);
  String idLeaderString = '';

  RxBool isShowToast = RxBool(false);
  RxBool isLoadingGetRequest = RxBool(false);
  Widget toast = const SizedBox();

  RxList<DatumSelect> stateList = RxList([
    DatumSelect(value: -1, text: "Elegir estado"),
    DatumSelect(value: 1, text: "En proceso"),
    DatumSelect(value: 2, text: "Aprobado"),
    DatumSelect(value: 3, text: "Rechazado"),
  ]);
  RxInt currentStateRequest = RxInt(-1);

  RxList<DatumSelect> stateListTypeRequest = RxList([
    DatumSelect(value: -1, text: "Elegir solicitud"),
    DatumSelect(value: 1, text: "Justificaciones"),
    DatumSelect(value: 2, text: "Permisos"),
    /* DatumSelect(value: 3, text: "Vacaciones"), */
  ]);
  RxInt currentRequest = RxInt(-1);

  //TextEditingController
  TextEditingController nameSearchController = TextEditingController(text: '');
  TextEditingController dniSearchController = TextEditingController(text: '');
  TextEditingController cipSearchController = TextEditingController(text: '');
  RxInt typeDocument = RxInt(0);

  TextEditingController name = TextEditingController(text: "");
  TextEditingController lastName = TextEditingController(text: "");
  TextEditingController typeMark = TextEditingController(text: "");
  TextEditingController idTypeMark = TextEditingController(text: "");
  TextEditingController dateJustification = TextEditingController(text: "");
  TextEditingController idStatusJustificationSearch =
      TextEditingController(text: "0");
  TextEditingController idUserJustification = TextEditingController(text: "");
  TextEditingController hourJustification = TextEditingController(text: "");

  //INSTANCES
  final _request = Get.find<RegisterJustificationUserProvider>();

  //FUNTIONS
  /* 📌 Para inicializar funciones o variables */
  void _initialize() async {
    getIdUser();
    isLeaderOrRRHH();
  }

  String isLeaderORHHH = '';
  /* 📌 Saber si es lider o de RRHH */
  Future<void> isLeaderOrRRHH() async {
    try {
      isLeaderORHHH = await StorageService.get(Keys.kIdRole);
      if (int.parse(isLeaderORHHH) == 2) {
        isToLeader.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getIdUser() async {
    idLeaderString = await StorageService.get(Keys.kIdUser);
  }

  /* 📌 Obtener todas las solicitudes de los trabajadores */
  Future<void> getAllRequests(isToLeader, bool isPerPage) async {
    showViewUponRequest.value = -1;
    isLoadingGetRequest.value = true;

    try {
      final response;
      if (isToLeader) {
        response =
            await _request.getAllRequestToLeader(RequestRequestAsignedToLeader(
          idLeader: int.parse(idLeaderString),
          filterName: nameSearchController.text,
          filterCip: cipSearchController.text,
          filterDni: dniSearchController.text,
          typeRequest: currentRequest.value,
          stateInProgress:
              currentStateRequest.value == -1 ? 1 : currentStateRequest.value,
          stateApprovedByLeader:
              currentStateRequest.value == -1 ? 2 : currentStateRequest.value,
          stateRejectedByLeader:
              currentStateRequest.value == -1 ? 3 : currentStateRequest.value,
          stateInProgressRrhh: 4, //Habilitar si es que piden doble validación
          stateAprovedByRrhh: 5, //Habilitar si es que piden doble validación
          stateRejectedByRrhh: 6, //Habilitar si es que piden doble validación
          page: isPerPage ? page : 1,
        ));
      } else {
        response = await _request
            .getAllRequestOfAllWorkersToRRHH(RequestOfAllWorkersModel(
          typeRequest: currentRequest.value,
          filterName: nameSearchController.text,
          filterCip: cipSearchController.text,
          filterDni: dniSearchController.text,
          stateInProgress:
              currentStateRequest.value == -1 ? 1 : currentStateRequest.value,
          stateApprovedByLeader:
              currentStateRequest.value == -1 ? 2 : currentStateRequest.value,
          stateRejectedByLeader:
              currentStateRequest.value == -1 ? 3 : currentStateRequest.value,
          stateInProgressRrhh: 4, //Habilitar si es que piden doble validación
          stateAprovedByRrhh: 5, //Habilitar si es que piden doble validación
          stateRejectedByRrhh: 6, //Habilitar si es que piden doble validación
          page: isPerPage ? page : 1,
        ));
      }
      if (!response.success) {}
      showViewUponRequest.value = currentRequest.value;
      listRequest.value = response.data ?? [];

      countPage.value = response.pageCount ?? 0;
      pageIndex.value = response.pageIndex ?? 0;
      countItem.value = listRequest.length;
      quantityPages.value = (response.count ?? 0 / kSizePage).ceil();
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingGetRequest.value = false;
    }
  }

  /* 📌 Actualizar estado de solicitudes */
  Future<void> updateStateOfRequest(int state, bool isArray,
      {List<int>? idRequest}) async {
    try {
      final response = await _request
          .putUpdateStateOfRequest(RequestManagementOfRequestModel(
        idUser: int.parse(idLeaderString),
        estadoSolicitudF: state,
        ids: isArray ? arrayId : idRequest,
      ));
      if (response.success!) {
        getAllRequests(isToLeader.value, false);
        showToastNow(0, "success", "Estado actualizado");
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Limpiar variables de los filtros */
  void cleanFilters() async {
    nameSearchController.clear();
    dniSearchController.clear();
    currentStateRequest.value = -1;
    currentRequest.value = -1;
  }

  /* 📌 Alerta */
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

  /* 📌 Limpiar lista de justificaciones */
  void clean() {
    listRequest.clear();
  }

  /* 📌 Limpiar el paginador del dataTable */
  void cleanPaginator() {
    page = 1;
    pageIndex.value = 1;
    pageSize.value = 1;
    countPage.value = 1;
    countItem.value = 1;
  }

  /* 📌 Guardar el id de la solicitud seleccionada */
  void saveCheckId() {
    arrayId = [];
    listRequest.forEach((element) {
      if (element.isCheck!) {
        arrayId.add(element.id!);
      }
    });
    isCheckHeader.value = false;
  }

  /* 📌 Validar el estado(lider) */
  void validState(int state) {
    saveCheckId();
    if (arrayId.isEmpty) {
      showToastNow(2, "warning", "Seleccione uno o más usuarios");
    } else if (!validateDataState(state)) {
      showToastNow(3, "error",
          "Hay usuario(s) ${Helpers.swithState(stateFormated, "o").toLowerCase()}(s)");
    } else {
      updateStateOfRequest(state, true);
    }
  }

  /* 📌 Validar que lo que seleccione sea diferente del estado que quiero modificar(Lider) ya que solo podra modificar una vez*/
  bool validateDataState(int state) {
    bool isValid = false;
    for (var item in arrayId) {
      final user = listRequest.firstWhere((element) => element.id == item);
      if (user.descripcionEstadoSolicitud == "En proceso") {
        isValid = true;
        break;
      }
    }
    return isValid;
  }

  /* 📌 Validar que lo que seleccione sea diferente del estado que quiero modificar */
  bool validateDataStateToRRHH(int state) {
    if (state == 2) {
      stateFormated = true;
      stateFormated = true;
    } else {
      stateFormated = false;
    }
    bool isValid = false;
    for (var item in arrayId) {
      final user = listRequest.firstWhere((element) => element.id == item);
      if (user.descripcionEstadoSolicitud !=
          Helpers.swithState(stateFormated, "o")) {
        //en proceso != aprobado
        isValid = true;
        break;
      }
    }
    return isValid;
  }

  /* 📌 Validar el estado RRHH*/
  void validStateToRRHH(int state) {
    saveCheckId();
    if (arrayId.isEmpty) {
      showToastNow(2, "warning", "Seleccione uno o más usuarios");
    } else if (!validateDataStateToRRHH(state)) {
      showToastNow(3, "error",
          "Hay usuario(s) ${Helpers.swithState(stateFormated, "o").toLowerCase()}(s)");
    } else {
      updateStateOfRequest(state, true);
    }
  }

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  /* 📌 Chequear items del row */
  void checkItemRow(int index) {
    DataAsignedToLeader profileScreenModel = listRequest[index];
    profileScreenModel.isCheck = !profileScreenModel.isCheck!;
    listRequest[index] = profileScreenModel;
  }

  /* 📌 Chequear todos los row */
  void checkAllRow(bool currentValue) {
    listRequest.forEach((element) {
      element.isCheck = currentValue;
    });
    isCheckHeader.value = !isCheckHeader.value;
  }
}
