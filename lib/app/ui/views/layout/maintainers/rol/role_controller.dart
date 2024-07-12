import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allroles_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
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
  TextEditingController inputRole = TextEditingController();
  List<DatumRoles> listRoles = [];
  RxBool isLoading = RxBool(true);
  RxBool isLoadingState = RxBool(false);
  String idUser = '';
  int idUserInt = 0;

  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    inputRole.text = '';
  }

  void _initialize() async {
    getInfoUserLocal();
    await getAllStatesGeneral();
    await getAllRoles();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Traer información de roles */
  Future<void> getAllRoles() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getAllRoles(RequestScheduleByUser(idUser: idUser));
      if (!response.success) {
        return;
      }
      listRoles = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Traer información de roles-filtro */
  Future<void> getAllRolesFilter() async {
    isLoading.value = true;
    try {
      final response = await _maintainersRepository.getRolesFilter(
          RequestFilterTypesModel(
              name: inputRole.text,
              idStateEnabled: currentState.value == -1 ? 0 : currentState.value,
              idStateDisabled:
                  currentState.value == -1 ? 1 : currentState.value,
              idUser: idUser));
      if (!response.success) {
        return;
      }
      listRoles = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    isLoadingState.value = true;
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser: idUser));

      if (!response.success) {
        return;
      }
      stateList.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingState.value = false;
    }
  }

  /* 📌 Actualizar rol */
  Future<void> updateRoles() async {
    try {
      final response = await _maintainersRepository.updateRoles(
          RequestMaintainersModel(
              idUser: idUserInt,
              description: descriptionRoleUpdate.text,
              id: idRole.value));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getAllRoles();
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Crear nuevo rol */
  /* Future<void> postCreateNewRole() async {
    try {
      print("pasa por aqui");
      final response = await _maintainersRepository.getAllTypesRequest();
      print("pasa por aqui2");
      showToastNow(0, "success", "Creado con éxito");
      return;
    } catch (e) {
      showToastNow(3, "error", "Ups... Ocurrio un error inesperado");
    } finally {}
  } */

  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  RxInt idRole = RxInt(0);
  TextEditingController descriptionRoleUpdate = TextEditingController();
  String descriptionStateToEdit = '';
  RxInt idState = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int pIdRole, String pDescriptionRoleUpdate,
      String pDescriptionStateToEdit, int pIdState) {
    idRole.value = pIdRole;
    descriptionRoleUpdate.text = pDescriptionRoleUpdate;
    descriptionStateToEdit = pDescriptionStateToEdit;
    idState.value = pIdState;
  }
}
