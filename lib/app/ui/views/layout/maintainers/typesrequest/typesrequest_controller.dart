import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypeRequest_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TypeRequestController extends GetxController {
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
  ]);
  RxInt currentState = RxInt(-1);

  TextEditingController typeRequest = TextEditingController();
  List<DatumAllTypeRequest> listTypesRequest = [];
  RxBool isLoading = RxBool(true);
  RxBool isLoadingStateMark = RxBool(false);
  String idUser = '';
  int idUserInt = 0;

  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    typeRequest.text = '';
  }

  /* 📌 Para inicializar funciones o variables */
  void _initialize() async {
    getInfoUserLocal();
    await getAllStatesGeneral();
    await getAllTypesRequest();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Traer información de tipos de marcaciones */
  Future<void> getAllTypesRequest() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getAllTypesRequest(RequestScheduleByUser(idUser:idUser ));
      if (!response.success) {
        return;
      }
      listTypesRequest = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Traer información de tipos de marcaciones-filtro */
  Future<void> getTypesRequestFilter() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getTypesRequestFilter(
          RequestFilterTypesModel(
              name: typeRequest.text,
              idStateEnabled: currentState.value == -1 ? 1 : currentState.value,
              idStateDisabled:
                  currentState.value == -1 ? 1 : currentState.value,
              idUser: idUser));
      if (!response.success) {
        return;
      }
      listTypesRequest = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Actualizar tipo de solicitud */
  Future<void> updateTypeRequest() async {
    try {
      final response = await _maintainersRepository.updateTypeRequest(
          RequestMaintainersModel(
              idUser: idUserInt,
              description: descriptionTypeRequest.text,
              id: idTypeValidation.value));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getAllTypesRequest();
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

  Future<void> postCreateNewTypeRequest() async {
    try {
      /* print("pasa por aqui"); */
      final response = await _maintainersRepository.getAllTypesRequest(RequestScheduleByUser(idUser:idUser ));
      /*  print("pasa por aqui2"); */
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

  RxInt idTypeValidation = RxInt(0);
  TextEditingController descriptionTypeRequest = TextEditingController();
  String descriptionStateMark = '';
  RxInt idStateMark = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int pIdTypeValidation, String pdescriptionTypeValidation,
      String pDescriptionState, int pIdState) {
    idTypeValidation.value = pIdTypeValidation;
    descriptionTypeRequest.text = pdescriptionTypeValidation;
    descriptionStateMark = pDescriptionState;
    idStateMark.value = pIdState;
  }
}
