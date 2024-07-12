import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypevalidation_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TypeValidationController extends GetxController {
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

  TextEditingController inputTypeValidation = TextEditingController();
  List<DatumAllTypeValidation> listTypesValidation = [];
  RxBool isLoading = RxBool(true);
  RxBool isLoadingStateMark = RxBool(false);
  String idUser = '';
  int idUserInt = 0;
  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    inputTypeValidation.text = '';
  }

  /* 📌 Para inicializar funciones o variables */
  void _initialize() async {
    getInfoUserLocal();
    await getAllStatesGeneral();
    await getAllTypesValidation();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Obtener información de tipos de validación */
  Future<void> getAllTypesValidation() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getAllTypesValidations(RequestScheduleByUser(idUser:idUser ));
      if (!response.success) {
        return;
      }
      listTypesValidation = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Obtener información de tipos de validación */
  Future<void> getTypesValidationFilter() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getTypesValidationFilter(
          RequestFilterTypesModel(
              name: inputTypeValidation.text,
              idStateEnabled: currentState.value == -1 ? 1 : currentState.value,
              idStateDisabled:
                  currentState.value == -1 ? 0 : currentState.value,  
              idUser: idUser));
      if (!response.success) {
        return;
      }
      listTypesValidation = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Actualizar tipos de validación */
  Future<void> updateTypesValidation() async {
    try {
      final response = await _maintainersRepository.updateTypeValidation(
          RequestMaintainersModel(
              idUser: idUserInt,
              description: descriptionTypeValidation.text,
              id: idTypeValidation.value));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getAllTypesValidation();
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

  /* 📌 Crear nuevo tipo de validación */
  Future<void> postCreateNewTypeValidation() async {
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

  RxInt idTypeValidation = RxInt(0);
  TextEditingController descriptionTypeValidation = TextEditingController();
  String descriptionStateMark = '';
  RxInt idStateMark = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int pidTypeValidation, String pdescriptionValidation,
      String pdescriptionState, int pidState) {
    idTypeValidation.value = pidTypeValidation;
    descriptionTypeValidation.text = pdescriptionValidation;
    descriptionStateMark = pdescriptionState;
    idStateMark.value = pidState;
  }
}
