import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypeMarking_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StateGeneralController extends GetxController {
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
  String idUser = "";

  //FUNCTIONS

  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
  }

  void _initialize() async{
    await getInfoUserLocal();
    await getAllStatesGeneral();
    await getAllTypesMarkings();    
  }

  /* 📌 Traer información de tipos de marcaciones */
  Future<void> getAllTypesMarkings() async {
    isLoadingTypesMark.value = true;
    try {
      final response = await _maintainersRepository.getAllTypesMarkings(RequestScheduleByUser(idUser: idUser));
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
  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
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

  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  TextEditingController descriptionTypeMark = TextEditingController();
  String descriptionStateMark = '';
  RxInt idStateMark = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(String pdescriptionTypeMark,
      String pdescriptionStateMark, int pidStateMark) {
    descriptionTypeMark.text = pdescriptionTypeMark;
    descriptionStateMark = pdescriptionStateMark;
    idStateMark.value = pidStateMark;
  }
}
