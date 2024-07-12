import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypeMarking_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MarkingTypeController extends GetxController {
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
  TextEditingController typeMarking = TextEditingController();
  List<DatumAllTypeMarking> listTypesMarking = [];
  RxBool isLoadingTypesMark = RxBool(true);
  RxBool isLoadingStateMark = RxBool(false);
  String idUser = '';
  int idUserInt = 0;

  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    typeMarking.text = '';
  }

  void _initialize() async {
    getInfoUserLocal();
    await getAllStatesGeneral();
    await getAllTypesMarkings();
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Traer información de tipos de marcaciones */
  Future<void> getAllTypesMarkings() async {
    isLoadingTypesMark.value = true;
    try {
      final response = await _maintainersRepository.getAllTypesMarkings(RequestScheduleByUser(idUser: idUser) );
      if (!response.success) {
        return;
      }
      listTypesMarking = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingTypesMark.value = false;
    }
  }

  /* 📌 Traer información de tipos de marcaciones-filtro */
  Future<void> getTypesMarkFilter() async {
    isLoadingTypesMark.value = true;
    try {
      final response = await _maintainersRepository.getTypesMarkFilter(
          RequestFilterTypesModel(
              name: typeMarking.text,
              idStateEnabled: currentState.value == -1 ? 0 : currentState.value,
              idStateDisabled:
                  currentState.value == -1 ? 1 : currentState.value,
              idUser: idUser));
      if (!response.success) {
        return;
      }
      listTypesMarking = response.data ?? [];
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingTypesMark.value = false;
    }
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    isLoadingStateMark.value = true;
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser: idUser));

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

  /* 📌 Crear nuevo tipo de marcación */
  Future<void> updateTypeMark() async {
    try {
      final response = await _maintainersRepository.updateTypeMark(
          RequestMaintainersModel(
              idUser: idUserInt,
              description: descriptionTypeMark.text,
              id: idTypeMark.value,));
      if (!response.success) {
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getAllTypesMarkings();
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
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

  RxInt idTypeMark = RxInt(0);
  TextEditingController descriptionTypeMark = TextEditingController();
  String descriptionStateMark = '';
  RxInt idStateMark = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int idTMArk, String pdescriptionTypeMark,
      String pdescriptionStateMark, int pidStateMark) {
    idTypeMark.value = idTMArk;
    descriptionTypeMark.text = pdescriptionTypeMark;
    descriptionStateMark = pdescriptionStateMark;
    idStateMark.value = pidStateMark;
  }
}
