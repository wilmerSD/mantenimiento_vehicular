import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/maintainers/request_maintainers_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_filtertypes_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_alltypemodality_model.dart';
import 'package:app_valtx_asistencia/app/repositories/maintainers/maintainers_general_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WorkModalityController extends GetxController {
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
  RxList<DatumAllTypeModality> listModalityWork = RxList([]);
  RxList<DatumAllStateGeneral> stateList = RxList([
    DatumAllStateGeneral(idEstado: -1, descripcion: "Seleccionar"),
  ]);
  RxInt currentState = RxInt(-1);
  RxBool isLoadingStateGeneral = RxBool(false);
  RxBool isLoadingWorkModality = RxBool(true);
  TextEditingController modalityWork = TextEditingController();
  String idUser = '';
  int idUserInt = 0;

  //FUNCTIONS

  void _initialize() async {
    getAllStatesGeneral();
    getTypesModality();
    
  }

  /* 📌 Obtener información guarada en localStorage */
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
  }

  /* 📌 Traer información de estados generales */
  Future<void> getAllStatesGeneral() async {
    isLoadingStateGeneral.value = true;
    try {
      final response = await _maintainersRepository.getAllStatesPrimary(RequestScheduleByUser(idUser:idUser ));

      if (!response.success) {
        return;
      }
      stateList.addAll([...response.data ?? []]);
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    } finally {
      isLoadingStateGeneral.value = false;
    }
  }

  /* 📌 Crear nueva modalidad */
  Future<void> createNewTypeModality() async {
    try{

    }catch(e){

    }
  }

  /* 📌 Obtener modalidades de trabajo */
  Future<void> getTypesModality() async {
    isLoadingWorkModality.value = true;
    try {
      final response = await _maintainersRepository.getAllTypesModalityOfWork(RequestScheduleByUser(idUser:idUser ));
      if (!response.success){
        return;
      }
      listModalityWork.value = response.data ?? [];

    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
    finally{
      isLoadingWorkModality.value = false;
    }
  }
  
  /* 📌 Obtener modalidades de trabajo filtro*/
  Future<void> getTypesModalityFilter() async{
    isLoadingWorkModality.value = true;
    try{
      final response = await _maintainersRepository.getModalityWorkFilter(
        RequestFilterTypesModel(
          name: modalityWork.text,
            idStateEnabled: currentState.value == -1 ? 0 : currentState.value,
            idStateDisabled: currentState.value == -1 ? 1 : currentState.value,
            idUser: idUser
        )
      );
      if(!response.success){
        return;
      }
      listModalityWork.value = response.data ?? [];
    }catch(e){
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }finally{
      isLoadingWorkModality.value = false;
    }
  }
  
  /* 📌 Actualizar modalidad de trabajo */
  Future<void> updateWorkModality() async{
    try {
      final response = await _maintainersRepository.updateWorkModality(
        RequestMaintainersModel(
          idUser: idUserInt,
              description: descriptionWorkModality.text,
              id: idWorkModality.value)
        
      );
      if(!response.success){
        return;
      }
      showToastNow(0, "success", 'Actualizado con éxito');
      getTypesModality();
    }catch(e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }

  }
  /* 📌 Limpiar variables de busqueda */
  void clean() {
    currentState.value = -1;
    modalityWork.text = '';
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
  RxInt idWorkModality = RxInt(0);
  TextEditingController descriptionWorkModality = TextEditingController();
  String descriptionState = '';
  RxInt idState = RxInt(0);

  /* 📌 Pasar información del dataTable al modal */
  void passInformation(int pIdWorkModality  ,String pDescriptionWorkModality,
      String pdescriptionStateMark, int pidState) {

    idWorkModality.value = pIdWorkModality;    
    descriptionWorkModality.text = pDescriptionWorkModality;
    descriptionState = pdescriptionStateMark;
    idState.value = pidState;
  }
}
