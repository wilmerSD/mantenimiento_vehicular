import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/solicitude/request_getallmyreques_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/models/response/solicitude/response_getallmyrequest_model.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:get/get.dart';

class MyRequestController extends GetxController {
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
  final _getAllMyRequest = Get.find<RegisterJustificationRepository>();

  //VARIABLES

  int page = 1;
  RxInt currentPage = RxInt(1);
  RxString namesEmployee = RxString("");
  RxInt userIndex = RxInt(-1);
  RxInt pageIndex = RxInt(1);
  RxInt countItem = RxInt(1);
  RxInt countPage = RxInt(1);
  RxInt quantityPages = RxInt(0);

  RxBool isVisible = false.obs;
  RxBool isLoadingRequest = false.obs;
  RxString messageError = RxString("");
  RxInt currentRequest = RxInt(-1);
  RxInt currentStateRequest = RxInt(-1);
  RxList<DatumGetAllMyRequest> getAllMyRequestResponse = RxList([]);

  RxList<DatumSelect2Combo> stateListTypeRequest = RxList([
    DatumSelect2Combo(value: -1, text: "Elegir solicitud"),
    DatumSelect2Combo(value: 1, text: "Justificaciones"),
    DatumSelect2Combo(value: 2, text: "Permisos"),
    DatumSelect2Combo(value: 3, text: "Vacaciones"),
  ]);
  RxList<DatumSelect2Combo> listStatusRequest = RxList([
    DatumSelect2Combo(value: -1, text: "Elegir estado"),
    DatumSelect2Combo(value: 1, text: "En proceso"),
    DatumSelect2Combo(value: 2, text: "Aprobado por líder"),
    DatumSelect2Combo(value: 3, text: "Rechazado por líder"),
  ]);

  RxInt showViewUponRequest = RxInt(0);

  //FUNCTIONS
  /* 📌 Funciones a inizalizar */
  void initialize() {}

  /* 📌 Para optener todas mis solicitudes */
  Future<void> getAllMyRequest(bool isPerPage) async {
    String idUser = await StorageService.get(Keys.kIdUser);
    isLoadingRequest.value = true;
    showViewUponRequest.value = -1;
    try {
      final response =
          await _getAllMyRequest.getAllMyRequest(RequestGetAllMyRequestModel(
        idUser: int.parse(idUser),
        typeRequest: currentRequest.value,
        stateInProgress: currentStateRequest.value,
        stateApprovedByLeader: currentStateRequest.value,
        stateRejectedByLeader: currentStateRequest.value,
        stateInProgressRrhh: 4, //Habilitar si es que piden doble validación
        stateAprovedByRrhh: 5, //Habilitar si es que piden doble validación
        stateRejectedByRrhh: 6, //Habilitar si es que piden doble validación
        page: isPerPage ? page : 1,
      ));

      if (response.success == true) {
        getAllMyRequestResponse.value = response.data ?? [];
        showViewUponRequest.value = currentRequest.value;

        countPage.value = response.pageCount ?? 0;
        pageIndex.value = response.pageIndex ?? 0;
        countItem.value = getAllMyRequestResponse.length;
        quantityPages.value = (response.count ?? 0 / kSizePage).ceil();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingRequest.value = false;
    }
  }

  /* 📌 Para limpiar variables de tipo y estado solicitud */
  void clean() {
    currentRequest.value = -1;
    currentStateRequest.value = -1;
    showViewUponRequest.value = -1;
  }
}
