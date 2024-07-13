import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstateRequest_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StateRequestController extends GetxController {
  @override
  void onInit() async {
    _initialize();
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
  final _maintainersRepository = Get.find<MaintainersGeneralRepository>();

  //VARIABLES
  RxList<DatumAllStateGeneral> stateList = RxList([
    DatumAllStateGeneral(idEstado: -1, descripcion: "Seleccionar"),
    DatumAllStateGeneral(idEstado: 0, descripcion: "En proceso"),
    DatumAllStateGeneral(idEstado: 1, descripcion: "Terminado"),
  ]);
  RxInt currentState = RxInt(-1);

  TextEditingController descriptionStateRequest = TextEditingController();
  List<DatumAllStateRequest> listStateRequest = [
    DatumAllStateRequest(
      idEstadoSolicitud: 1,
      descripcion: 'Brayan Sebastian Lopez Guerrero',
      idEstado: 0,
      descriptionState: 'Proceso',
      vehiculo: "KIA e-Niro.rrero"
    ),
    DatumAllStateRequest(
      idEstadoSolicitud: 2,
      descripcion: 'Wendoline Salazar Arevalo',
      idEstado: 1,
      descriptionState: 'Finalizado',
      vehiculo: "KIA e-Niro.rrero",
    ),
    DatumAllStateRequest(
      idEstadoSolicitud: 3,
      descripcion: 'José José Sanchez Benavidez',
      idEstado: 1,
      descriptionState: 'Finalizado',
      vehiculo: "KIA e-Niro.rrero",
    ),
  ];
  RxBool isLoading = RxBool(true);
  RxBool isLoadingStateMark = RxBool(false);
  String idUser = '';
  int idUserInt = 0;

  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    descriptionStateRequest.text = '';
  }

  void _initialize() async {
    /* await getAllStatesGeneral(); */
    isLoading.value = false;
    /* await getAllStatesRequests(); */
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Traer información de tipos de marcaciones */
  Future<void> getAllStatesRequests() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getAllStateOfRequest(RequestScheduleByUser(idUser: idUser));
      if (!response.success) {
        return;
      }
      listStateRequest = response.data ?? [];
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Traer información de tipos de marcaciones - Filtro*/
  Future<void> getStateOfRequestFilter() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getStateRequestFilter(
          RequestFilterTypesModel(
              name: descriptionStateRequest.text,
              idStateEnabled: currentState.value == -1 ? 0 : currentState.value,
              idStateDisabled:
                  currentState.value == -1 ? 1 : currentState.value,
              idUser: idUser));
      if (!response.success) {
        return;
      }
      listStateRequest = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin01() async {
    Get.off(AppRoutesName.HOME);
  }
  
  /* 📌 Actualizar información de estado solicitudes*/
  Future<void> updateStateRequest() async {
    try {
      final response = await _maintainersRepository.updateStatesRequest(
          RequestMaintainersModel(
              idUser: idUserInt,
              description: descriptionStatesRequest.text,
              id: idStateRequest.value,));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getAllStatesRequests();
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    isLoadingStateMark.value = true;
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser:idUser ));

      if (!response.success) {
        return;
      }
      stateList.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingStateMark.value = false;
    }
  }

  /* 📌 Crear nuevo estado de solicitud */
  Future<void> postCreateNewStateRequest() async {
    try {
      final response = await _maintainersRepository.getAllTypesRequest(RequestScheduleByUser(idUser:idUser ));
      showToastNow(0, "success", "Creado con éxito");
      return;
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {}
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

  RxInt idStateRequest = RxInt(0);
  TextEditingController descriptionStatesRequest = TextEditingController();
  String descriptionState = '';
  RxInt idState = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int pIdStateRequest, String pdescriptionStateRequest,
      String pdescriptionState, int pidState) {
    idStateRequest.value = pIdStateRequest;
    descriptionStatesRequest.text = pdescriptionStateRequest;
    descriptionState = pdescriptionState;
    idState.value = pidState;
  }
}
