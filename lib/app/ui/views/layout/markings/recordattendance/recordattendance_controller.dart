import 'dart:async';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_email_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/request/schedules/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/app/ui/components/toast/toast.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as locations;
import 'package:nominatim_geocoding/nominatim_geocoding.dart';
/* import 'package:google_maps_flutter/google_maps_flutter.dart'; */

class RecordattendanceController extends GetxController {
  late MapController mapController;
  @override
  void onInit() async {
    mapController = MapController();
    _initialize();
    super.onInit();
    update();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //INSTANCES

  final _authenticationRepository = Get.find<AuthenticationRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();
  final _typesValidationsRepository = Get.find<TypesValidationsRepository>();
  final _assistancesWeekUserRepository =
      Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _justificationRepository = Get.find<RegisterJustificationRepository>();

  locations.Location location = locations.Location();
  locations.LocationData? locationData;
  final _userRepository = Get.find<UserRepository>();

  //VARIABLES

  var responseUserInformation = DataUser().obs;
  var responseUserAssistance = DataMark().obs;
  var responseTypesMarking = <DatumAssistances>[].obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  RxString messageHintText = RxString(
      "Ej: Buen día estimado(a) Nombres,\nEl motivo de mi tardanza es ... \nGracias de antemano por su comprensión");
  RxString statusMessageTypesMarking = RxString("");
  RxString statusMessageUserInformation = RxString("");
  RxString statusMessageUserJustification = RxString("");
  RxString statusMessageWeek = RxString("");
  RxString statusMessageMonth = RxString("");
  RxString statusMessageUserAssistance =
      RxString("Ha ocurrido un error, por favor intentelo de nuevo más tarde.");
  RxString messageError = RxString("");
  RxString nameLocation = "Obteniendo ubicación...".obs;
  LatLng workPosition = const LatLng(-12.086660314676623, -76.99120477371234);
  //RxBool statusJustification = false.obs;
  RxBool statusAssistance = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingValidation = false.obs;
  RxBool isLoadingMonth = false.obs;
  RxBool isLoadingWeek = false.obs;
  RxBool isLoadingMarks = false.obs;
  RxBool isLoadingJustification = false.obs;
  RxBool isLoadingUser = false.obs;
  /* RxBool isVisible = false.obs; */
  RxBool controlHintText = true.obs;
  /* RxBool removeBarrier = false.obs; */
  double latitude = 0.0;
  double longitude = 0.0;
  double latitudeCheck = 0.0;
  double longitudeCheck = 0.0;
  int selectedValue = 0;
  String descriptionTypeMark = '';
  String reasonJustification = '';
  RxString reasonJustificationControl = ''.obs;
  DateTime? selectedDate;
  String? formattedDate;
  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();
  RxBool isAcceptedPermissionToUbication = RxBool(false);
  final Rx<LatLng> currentLocation = Rx<LatLng>(const LatLng(0, 0));
  /* late BitmapDescriptor iconMap = BitmapDescriptor.defaultMarker; */
  String idusername = '';
  RxString nameUser = "".obs;
  int intIdUsername = 0;
  int validationAgreed = 1;

  //FUNCTION

  /* 📌 Inicializar funciones o variables */
  void _initialize() async {
    await _getInformationUser();
    /* await _typesValidationsuser(); */
    await detailsControllerDate();
    /* await _getAssistancesMonthUser(formattedDate);
    await _getAssistancesWeekhUser(); */
    await _checkLocationPermission(true);
    await _getTypesMarking();
    /* await getNameLocation4(); */
  }

  /* 📌 Obtener nombres completos del usuario */
  Future<void> _getInformationUser() async {
    nameUser.value = await StorageService.get(Keys.kNameUser);
    idusername = await StorageService.get(Keys.kIdUser);
    intIdUsername = int.parse(idusername);
  }

  /* 📌 Tipos de marcación */
  Future<void> _getTypesMarking() async {
    isLoadingMarks.value = true;
    try {
      final response = await _typesAssistances.getTypesAssistances(RequestScheduleByUser(idUser: idusername));
      isLoadingMarks.value = false;
      responseTypesMarking.assignAll(response.data);
      statusMessageTypesMarking.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (e) {
      showToastNow(1, "error", Helpers.knowTypeError(e.toString()));
    }
  }

  /* 📌 Registrar asistencia */
  Future<void> assistMarker(selectedValue) async {
    isLoading.value = true;
    try {
      final hasPermission = await location.hasPermission();
      final requestPermission = await location.requestPermission();

      if (hasPermission == locations.PermissionStatus.granted ||
          requestPermission == locations.PermissionStatus.granted) {
        final response = await _registerMarkingUser.postRegisterMarking(
          RequestMarkingUserModel(
              idUser: intIdUsername,
              idTypesMarking: selectedValue,
              latitude: latitude,
              longitude: longitude,
              address: nameLocation.value),
        );

        statusAssistance.value = response.success;
        statusMessageUserAssistance.value = response.statusMessage;
        responseUserAssistance.value = response.data;

        if (!response.success) {
          showToastNow(2, "warning",
              "${statusMessageUserAssistance.value} De tener algún inconveniente comuníquese con el área de RRHH.");
          return;
        }
        isLoading.value = false;
        if (responseUserAssistance.value.idTipoValidacion != validationAgreed) {
          await sendMailOutlook(selectedValue);
        }
        return;
      }
      showToastNow(2, "Warning", "Por favor permita el acceso a la ubicación de lo contrario no podrá registrar su asistencia");
      /* _getAssistancesMonthUser(formattedDate);
      _getAssistancesWeekhUser(); */
    } catch (error) {
      /* removeBarrier.value = true;
      isVisible.value = true; */
      showToastNow(1, "error", Helpers.knowTypeError(error.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Envio de correo con información de asistencia al lider o RRHH */
  Future<void> sendMailOutlook(selectedValue) async {
    try {
      final response =
          await _registerMarkingUser.postSendEmail(RequestEmailModel(
        idUser: intIdUsername,
        idTypesMarking: selectedValue,
        validationOfMark: responseUserAssistance.value.registradoComo ?? '',
      ));
    } catch (e) {
      /* messageError.value =
          'Ha ocurrido un error al enviar correo de información a su lider, por favor comunicarle';
      showToastNow(3, "error", messageError.value); */
    }
  }

  /* 📌 Registrar justificación */
  Future<void> sendJustification(int selectedValue, String reason) async {
    isLoadingJustification.value = true;
    try {
      final response = await _justificationRepository.postRegisterJustification(
        RequestJustificationModel(
            idUser: int.parse(idusername),
            idTypeMark: selectedValue,
            reason: reason),
      );

      //statusJustification.value = response.success;
      statusMessageUserJustification.value =
          response.statusMessage.toLowerCase();
      isLoadingJustification.value = false;
      if (!response.success) {
        return;
      }
      showToastNow(
          0, "success", 'Solicitud de ${statusMessageUserJustification.value}');
    } catch (error) {
      isLoadingJustification.value = true;
      showToastNow(1, "error", Helpers.knowTypeError(error.toString()));
    }
  }

/*   /* 📌 Chequear los permisos de ubicación */
  Future<void> _checkLocationPermission(bool isInit) async {
    final hasPermission = await location.hasPermission();
    final requestPermission = await location.requestPermission();

    if (hasPermission == locations.PermissionStatus.denied ||
        requestPermission != locations.PermissionStatus.granted) {
      isAcceptedPermissionToUbication.value = false;
      if (isInit) {
        showToastNow(2, "warning",
            "Por favor permita el acceso a la ubicación de lo contrario no podrá registrar su asistencia");
      }
      return;
    } else {
      if (isInit) {
        isAcceptedPermissionToUbication.value = true;
        await getCurrentLocation(true);
      }
      isAcceptedPermissionToUbication.value = true;
    }
  } */
  /* 📌 Chequear los permisos de ubicación */
  Future<void> _checkLocationPermission(bool isInit) async {
    final hasPermission = await location.hasPermission();
    final requestPermission = await location.requestPermission();

    if (hasPermission == locations.PermissionStatus.granted ||
        requestPermission == locations.PermissionStatus.granted) {
      isAcceptedPermissionToUbication.value = true;
      if (isInit) {
        await getCurrentLocation(true);
      }
    } else {
      isAcceptedPermissionToUbication.value = false;
      showToastNow(2, "warning",
          "Por favor permita el acceso a la ubicación de lo contrario no podrá registrar su asistencia");
    }
  }

  /* 📌 Optener ubicación actual */
  Future<void> getCurrentLocation(bool isInit) async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLocation.value = LatLng(position.latitude,
          position.longitude); // -12.086660314676623,-76.99120477371234
      latitude = position.latitude;
      longitude = position.longitude;
      if (latitudeCheck != latitude && longitudeCheck != longitude) {
        latitudeCheck = position.latitude;
        longitudeCheck = position.longitude;
        getNameLocation4();
      }

      mapController.move(currentLocation.value, 18.0);
      update(); //Para actualizar el mapa
    } catch (e) {
      if (isInit) {
        showToastNow(2, "warning",
            "Ups! No pudimos encontrar tu ubicación, por favor, asegurese que ha permitido que accedan a su ubicación");
      }
    }
  }

  /* 📌 Obtener el nombre de la ubicación */
  getNameLocation4() async {
    try {
      await NominatimGeocoding.init();
      Coordinate coordinate =
          Coordinate(latitude: latitude, longitude: longitude);
      Geocoding geocoding =
          await NominatimGeocoding.to.reverseGeoCoding(coordinate);

      nameLocation.value =
          '${geocoding.address.neighbourhood} - ${geocoding.address.road}, ${geocoding.address.city} - ${geocoding.address.state}';
    } catch (e) {
      showToastNow(
          2, "warning", "Ups! No pudimos encontrar el nombre de tu ubicación");
      try {
        await Future.delayed(const Duration(
            seconds: 5)); // Esperar 5 segundos antes de intentar nuevamente
        /* await getNameLocation4(); */
      } catch (e) {}
    }
  }

  /* 📌 Guardando fecha en formato correcto */
  detailsControllerDate() {
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  /* 📌 Limpiar variables al momento de enviar una justificación */
  cleanReasonJustification() {
    reasonJustification = "";
    reasonJustificationControl.value = "";
    messageHintText.value =
        "Ej: Buen día estimado(a) Nombres,\nEl motivo de mi tardanza es ... \nGracias de antemano por su comprensión";
  }

  /* 📌 Mostrar Toast */
  void showToastNow(int icon, String type, String text) async {
    showToast.value = true;
    toast = Toast(icon: icon, typeToast: type, text: text);
    await Future.delayed(const Duration(milliseconds: 2500));
    showToast.value = false;
  }

  /* 📌 Esta función se ejecutará cada X tiempo */
  /* void runEveryxTime() {
    Timer.periodic(const Duration(seconds: 20), (timer) async {
      await getCurrentLocation(false);
    });
  } */

  /* 📌 cargar icono para el mapa */
  /*getIcons() async {
    iconMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        "assets/markerValtx.png");
    update();
  }*/

  /* 📌 cargar icono para el mapa con el paquete geocoding de google*/
  /* //Optener nombre de ubicación actual
  getNameLocation() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String streetName = placemark.street ?? '';
      nameLocation.value = streetName;
    } else {
      nameLocation.value = "Ubicación no encontrada";
    }
  } */

  /* 📌 Obtener nombre de la ubicación con el paquete geocoding de google */
  /* getNameLocation2() async {
    final coordinates = '$latitude,$longitude';
    final geocoding =
        GoogleGeocodingApi('AIzaSyDCCfG5vGiqqtKH2-RYTrdeSZsLC-_3BYo');
    final results = await geocoding.reverse(
      coordinates,
      language: 'en',
    );
    
    if (results.status == 'OK') {
      final placemark = results.results.first;
      final streetName = placemark.formattedAddress ?? '';
      nameLocation.value = streetName;
    } else {
      nameLocation.value = "Ubicación no encontrada";
    }
  } */

  /* 📌 Obtener latitud y longitud con el paquete geocoding de google */
  /*getNameLocation2() async {
    var geocoder = js.context['google']['maps']['Geocoder'];
    var geocoderInstance = geocoder();
    geocoderInstance.callMethod('geocode', [
      {'location': js.context['google']['maps']['LatLng'](latitude, longitude)},
      (results, status) {
        if (status == 'OK') {
          nameLocation.value = results[0]['formatted_address'];
          
        } else {
          nameLocation.value = "Ubicación no encontrada";
          
        }
      },
    ]);
  } */

  /* 📌 Tipos de validacion*/
  /* _typesValidationsuser() async {
    final response = await _typesValidationsRepository.getTypesValidations();
    if (!response.success) {
      return;
    }
    await StorageService.set(
        key: Keys.kTypesValidation, value: json.encode(response.toJson()));
  } */

  /* 📌 Asistencias del mes*/
  /* _getAssistancesMonthUser(formattedDate) async {
    isLoadingMonth.value = true;
    final response =
        await _assistancesMonthkUserRepository.getAssistancesMonthDate(
      RequestAssistanceInformationModel(
          idUser: int.parse(idusername), date: formattedDate),
    );

    responseUserAssistanceMonth.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    isLoadingMonth.value = false;
    if (!response.success) {
      return;
    }
  } */

  /* 📌 Asistencias de la semana*/
  /* _getAssistancesWeekhUser() async {
    isLoadingWeek.value = true;
    try {
      final response = await _assistancesWeekUserRepository.getAssistancesWeek(
        RequestIdUserModel(
          idUser: int.parse(idusername),
        ),
      );

      responseUserAssistanceWeek.assignAll(response.data ?? []);
      statusMessageWeek.value = response.statusMessage;
      isLoadingWeek.value = false;
      if (!response.success) {
        return;
      }
    } catch (error) {
      isLoading.value = false;
      isVisible.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo mas tarde';
    }
  } */
}
