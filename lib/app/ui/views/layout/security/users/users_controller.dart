import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_updateleadertouser_model.dart';
import 'package:app_valtx_asistencia/app/models/request/users/request_updateroluser_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allroles_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/users/response_allworkers_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
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
  final _maintainersRepository = Get.find<MaintainersGeneralRepository>();

  //VARIABLES
  RxBool isLoading = RxBool(true);
  RxBool isLoadingLeaders = RxBool(true);
  int page = 1;
  RxInt currentPage = RxInt(1);
  TextEditingController namesEmployee = TextEditingController();
  TextEditingController lastNamesEmployee = TextEditingController();

  RxInt userIndex = RxInt(-1);
  RxInt pageIndex = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt quantityPages = RxInt(0);
  TextEditingController nameTEC = TextEditingController(text: '');
  TextEditingController dniSearchController = TextEditingController(text: '');
  RxInt typeDocument = RxInt(0);
  RxList<DatumWorkers> usersList = RxList([]);
  RxList<DatumWorkers> leadersList = RxList([]);

  RxList<DatumAllStateGeneral> stateList = RxList([
    DatumAllStateGeneral(idEstado: -1, descripcion: "Seleccionar"),
  ]);
  RxInt currentState = RxInt(-1);

  String idUser = '';
  int idUserInt = 0;

  int page2 = 1;
  RxInt countPage2 = RxInt(1);
  RxInt pageIndex2 = RxInt(1);
  RxInt countItem2 = RxInt(1);

  RxInt quantityPages2 = RxInt(0);
  //FUNCTIONS

  /* 📌 Al iniciar la vista */
  Future<void> initialize() async {
    try {
      await getInfoUserLocal();
      listUser(false);
      await getRoles();
      await getAllStatesGeneral();
    } catch (e) {
      print(e);
    } finally {}
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  RxList<DatumRoles> rolesActives = RxList([]);
  RxInt rol = RxInt(-1);

  /* 📌 Obtener roles */
  Future<void> getRoles() async {
    try {
      final response = await _maintainersRepository.getAllRoles(RequestScheduleByUser(idUser: idUser));
      if (!response.success) {
        return;
      }
      rolesActives.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Traer información de los trabajadores */
  Future<void> listUser(bool isPerPage) async {
    isLoading.value = true;
    try {
      final response =
          await _userRepository.getAllWorkers(RequestAllWorkersModel(
        idUser: idUserInt,
        name: nameTEC.text,
        CIP: "",
        DNI: dniSearchController.text,
        idEstateWorkerA: 1,
        idEstateWorkerI: 0,
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
    } catch (error) {
      showToastNow(3, "error", Helpers.knowTypeError(error.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Para editar rol del usuario */
  Future<void> updateRoleUser() async {
    try {
      final response =
          await _maintainersRepository.updateRoleToUser(RequestUpdateRolUser(
        idUser: idUserInt,
        idRol: rol.value,
        id: idUserToEdit.value,
      ));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      listUser(false);
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  RxInt leaderToAsigned = RxInt(0);
  /* 📌 Para asignar un lider diferente a un usuario */
  Future<void> updateLeaderAsignedToUser() async {
    try {
      final response = await _maintainersRepository
          .updateLeaderAsigned(RequestUpdateLeaderToUser(
        idUser: idUserInt,
        idLeader: leaderToAsigned.value,
        id: idUserToEdit.value,
      ));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      listUser(false);
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  TextEditingController nameLeaderSearch = TextEditingController();
  TextEditingController dniLeaderSearch = TextEditingController();

  /* 📌 Obtener lideres y rrhh */
  Future<void> getAllLeaders(bool isPerPage) async {
    isLoadingLeaders.value = true;
    try {
      final response =
          await _maintainersRepository.getAllLeaders(RequestAllWorkersModel(
        idUser: idUserInt,
        name: nameLeaderSearch.text,
        CIP: "",
        DNI: dniLeaderSearch.text,
        idEstateWorkerA: 1,
        idEstateWorkerI: 0,
        page: isPerPage ? page2 : 1,
      ));
      if (!response.success) {
        return;
      }
      leadersList.value = response.data;

      countPage2.value = response.pageCount;
      pageIndex2.value = response.pageIndex;
      countItem2.value = leadersList.length;

      quantityPages2.value = (response.count / kSizePage).ceil();
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingLeaders.value = false;
    }
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser: idUser));

      if (!response.success) {
        return;
      }
      stateList.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(3, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Para limpiar variables */
  void clean() {
    nameTEC.text = '';
    dniSearchController.text = '';
    usersList.value = [];
  }

  /* 📌 Para limpiar variables de busqueda en vista de asignación de lider */
  void cleanVariblesSearchLeader() {
    userIndex.value = -1;
    nameLeaderSearch.text = '';
    dniLeaderSearch.text = '';
  }

  /* 📌 Pasar información del dataTable al modal de asignación de lider*/
  void passInfoToAsignedLedader(
      String pNamesEmployee, String pLastNamesToEdit, int pIdUserToEdit) {
    namesEmployee.text = pNamesEmployee; //Nombres del usuario
    lastNamesEmployee.text = pLastNamesToEdit; //Nombres del lider
    idUserToEdit.value = pIdUserToEdit; //En que usuario se hara la modificación
  }

  RxInt idUserToEdit = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(String pNamesToEdit, String pLastNamesToEdit,
      int pIdUserToEdit, int pIdStateToEdit, int pRol) {
    namesEmployee.text = pNamesToEdit;
    lastNamesEmployee.text = pLastNamesToEdit;
    idUserToEdit.value = pIdUserToEdit;
    currentState.value = pIdStateToEdit;
    rol.value = pRol;
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
