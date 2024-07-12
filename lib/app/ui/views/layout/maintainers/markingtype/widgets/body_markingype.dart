import 'package:animate_do/animate_do.dart';
import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BodyMarkingType extends StatelessWidget {
  const BodyMarkingType({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(builder: (controller) {
      //ELEMENTS

      final _image = AssetImage('assets/carro02.png');

      final keyFormSearch = GlobalKey<FormState>();
      /* 📌 Input tipo de marcación */
      Widget inputTypeMarking = InputPrimary(
        label: "Tipo de marcación",
        maxLength: 35,
        textEditingController: controller.typeMarking,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Para seleccionar estado de solicitud */
      Widget inputStateRequest = Obx(
        () => Select(
          label: "Estado",
          value: controller.stateList.firstWhere(
              (element) => element.idEstado == controller.currentState.value),
          items: controller.stateList.map(
            (element) {
              return DropdownMenuItem(
                value: element,
                child: OptionSelect(nameOption: element.descripcion),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            controller.currentState.value =
                (newValue as DatumAllStateGeneral).idEstado!;
          },
        ),
      );

      /* 📌 Boton para limpiar */
      Widget btnClean = BtnCancel(
        text: "Limpiar",
        onTap: () {
          controller.clean();
          controller.getAllTypesMarkings();
        },
      );

      /* 📌 Boton para buscar */
      Widget btnSearch = BtnPrimary(
          text: "Buscar",
          onTap: () {
            if (keyFormSearch.currentState!.validate()) {
              controller.getTypesMarkFilter();
            }
            /* controller.getTypesMarkFilter(); */
          });

      return Row(
        /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: FadeInLeftBig(
                      child: Container(
                        /* width: 320, */
                        height: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayBlue.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image: _image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(" Modulo de sensor de corriente"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  /* width: 320, */
                  /*  height: 150, */
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thermostat, color: AppColors.blueDark),
                          Text("Temperatura: 25C°")
                        ],
                      ),
                      SizedBox(
                        height: kSizeNormalLittle,
                      ),
                      Row(
                        children: [
                          Icon(Icons.electric_car_outlined,
                              color: AppColors.blueDark),
                          Text("Corriente: 2A")
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(" Datos generales"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  /* width: 320, */
                  /*  height: 150, */
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Color.fromRGBO(3, 198, 140, 1),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.battery_charging_full,
                              color: AppColors.blueDark),
                          Text("Nivel:  60%")
                        ],
                      ),
                      SizedBox(
                        height: kSizeNormalLittle,
                      ),
                      Row(
                        children: [
                          Icon(Icons.energy_savings_leaf,
                              color: AppColors.blueDark),
                          Text("Estado:  80%")
                        ],
                      ),
                      SizedBox(
                        height: kSizeNormalLittle,
                      ),
                      Row(
                        children: [
                          Icon(Icons.car_repair_outlined,
                              color: AppColors.blueDark),
                          Text("Capacidad de recorrido aprox:  200km")
                        ],
                      ),
                      SizedBox(
                        height: kSizeNormalLittle,
                      ),
                      Row(
                        children: [
                          Icon(Icons.tire_repair, color: AppColors.blueDark),
                          Text("No conectado"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(" Datos del mantenimiento"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  /*  width: 100, */
                  height: 700.h,
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" Bateria"),
                          Icon(Icons.keyboard_arrow_up,
                              color: AppColors.blueDark),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 700,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayBlue.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mecanismo",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Inspección visual de los montanes"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de sujeción y daños mecanicos en la batería"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de los conductos y montanes"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del tapón de seguridad del enchufe"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 200,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistema de carga eléctrica",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Daños mecánicos de la batería"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de las líneas de conexión a la batería "),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales  (inspección auditiva)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 220,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistema de refrigeración",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspecionar el nivel y coloración del líquido de refrigerante\n (inspeción visual)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Fugas y ruidos inusuales  (inspección visual y auditiva)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de los 4 sensores de temperatura )"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Estado físico de los conductos de aire  (inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" Tren de trasminción"),
                          Icon(Icons.keyboard_arrow_up,
                              color: AppColors.blueDark),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 500,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayBlue.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Diferencial",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Fugas de aceite del diferencial ( inspección visual)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos en la cubierta del diferencial (inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Fluido del diferencial (según indica el fabricante )"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 215,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ejes propulsores",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección visual de las juntas universales\n(periódicamente engrasar)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección visual de los guardapolvos del árbol de propulsión "),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos del eje del diferencial y del soporte central\n(inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales de las juntas universales ( inspección auditiva)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //CHASIS
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Chasis"),
                          Icon(Icons.keyboard_arrow_up,
                              color: AppColors.blueDark),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1550,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayBlue.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 460,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistema de frenos",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de altura y juego del pedal de freno\n(ajustar de ser necesario)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales y dificultad del accionamiento del\npedal de freno (inspección auditiva y visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspeccionar el nivel y coloración del líquido de freno\n(inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales y dificultad del accionamiento de freno de\nestacionamiento (inspección auditiva y visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Fluido de freno ( Inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del espesor de los discos de freno frontales\ny posteriores "),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del espesor de las pastillas de los discos\nsolidos posteriores"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del espesor de las pastillas de los discos\nventilados frontales"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de fugas de fluido de freno (Inspeccion visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 520,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistema de propulsión",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Amortiguador de la suspensión frontal independiente McPherson\n(Inspección auditiva y visual)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Resorte de la suspensión frontal  independiente McPherson\n(Inspección auditiva y visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos del aro de neumático (Inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección visual del estado físico del neumático"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales de la barra estabilizadora frontal"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos de la suspensión y chasis ( inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección visual de los pernos de ajuste de la suspensión\ny chasis (ajustar de ser necesario)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Resorte de la suspensión posterior independiente de doble\norquilla (inspección visual y auditiva)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Amortiguador de la suspension posterior independiente de doble\nhorquilla (inspección visual y auditiva)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de la profundidad de la banda de rrodadura del\nneumático ( inspección visual )"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección de la altura del vehículo ( Inspección visual)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 460,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kRadiusMedium),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sistema de dirección",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(Icons.keyboard_arrow_up,
                                          color: AppColors.blueDark),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección visual del estado físico de los guardapolvos de la\narticulación esférica (cambiar de ser necesario)"),
                                      Icon(Icons.check_circle,
                                          color: AppColors.validationTimely),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Ruidos inusuales de la articulación esférica (rótulas)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección  del muñon de la dirección\n(inspección visual y auditiva)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Fugas de grasa del guardapolvo del extremo\ntensor (inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del juego libre del  volante de dirección\n(inspección auditiva y visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos en la articulación de la dirección\n(inspección visual y auditiva)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del espesor de las pastillas de los discos\nsolidos posteriores"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Inspección del aliniamiento de las ruedas\n(inpsección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSizeNormalLittle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Daños mecánicos en la cubierta de la cremallera\n(Inspección visual)"),
                                      Icon(Icons.error_outlined,
                                          color: AppColors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
