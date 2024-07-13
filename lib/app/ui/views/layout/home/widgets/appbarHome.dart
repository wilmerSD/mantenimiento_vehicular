import 'package:app_valtx_asistencia/app/models/response/maintainers/response_allstategeneral_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      //Elements

      /* 📌 Ingreso de numero de documento */
      Widget inputNroDocument = InputPrimary(
        label: "Nro documento",
        textEditingController: controller.dniSearchController,
        inputFormats: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        maxLength: controller.typeDocument.value == 0 ? 8 : null,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(
                r'^\d{8}$',
              ),
              "El campo debe contener ocho dígitos");
        },
      );

      /* 📌 Ingreso de nombres */
      Widget inputName = InputPrimary(
        label: "Nombres",
        maxLength: 30,
        textEditingController: controller.nameTEC,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputApellidos = InputPrimary(
        label: "Apellidos",
        maxLength: 30,
        textEditingController: controller.lastNames,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputCorreo = InputPrimary(
        label: "Correo",
        maxLength: 30,
        textEditingController: controller.email,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputCelular = InputPrimary(
        label: "Celular",
        maxLength: 30,
        textEditingController: controller.phone,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputNameVehiculo = InputPrimary(
        label: "Nombre vehículo",
        maxLength: 30,
        textEditingController: controller.nameVehicule,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputAno = InputPrimary(
        label: "Año",
        maxLength: 30,
        textEditingController: controller.ageVehicule,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputNumSerie = InputPrimary(
        label: "N° de serie",
        maxLength: 30,
        textEditingController: controller.numSerie,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputNumChasis = InputPrimary(
        label: "N° de chasis",
        maxLength: 30,
        textEditingController: controller.numChasis,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputDescription = InputPrimary(
        label: "Descripción del vehiculo",
        maxLength: 30,
        textEditingController: controller.numDescriptionVehicule,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputEstadoBateria = InputPrimary(
        label: "Estado bateria",
        maxLength: 30,
        textEditingController: controller.stateBatery,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputFechaIngreso = InputPrimary(
        label: "Fecha entrada",
        maxLength: 30,
        textEditingController: controller.dateIngreso,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Ingreso de apellidos */
      Widget inputFechaSalida = InputPrimary(
        label: "Fecha salida",
        maxLength: 30,
        textEditingController: controller.dateSalida,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );

      /* 📌 Input de horario a buscar */
      Widget inputTipoMantenimiento = Obx(
        () => Select(
          label: "Tipo de Mantenimiento",
          value: controller.listTypeMantenimiento.firstWhere((element) =>
              element.idEstado == controller.currentTypeMantenimiento.value),
          items: controller.listTypeMantenimiento.map(
            (element) {
              return DropdownMenuItem(
                value: element,
                child: OptionSelect(nameOption: element.descripcion),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            controller.currentTypeMantenimiento.value =
                (newValue as DatumAllStateGeneral).idEstado!;
          },
        ),
      );

      /* 📌 Ingreso de comentarios sobre el vehículo */
      Widget inputComentarioVehiculo = InputPrimary(
        label: "Comentario",
        maxLength: 30,
        textEditingController: controller.comentVehicule,
        validator: (value) {
          return Helpers.simplerequiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "Solo se aceptan letras");
        },
      );
      /* 📌 Boton para limpiar */
      /*Widget btnClean = BtnCancel(
        text: "Limpiar",
        onTap: () {
          /* controller.clean();
          controller.listUser(false); */
        },
      ); */

      /* 📌 Boton para buscar */
      Widget btnSearch = BtnPrimary(
          text: "Guardar",
          onTap: () {
            controller.guardarDatos();
            /* if (keyFormSearch.currentState!.validate()) {
              controller.listUserFilter(false);
            } */
          });

      return  ListView(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.blue,
                    )
                  ],
                ),
                const Text(" Datos del cliente"),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 2, child: inputNroDocument),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 2, child: inputName),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 2, child: inputApellidos),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBigLittle,
                      ),
                      Row(
                        children: [
                          Expanded(flex: 2, child: inputCorreo),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 2, child: inputCelular),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(" Datos del vehículo"),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 3, child: inputNameVehiculo),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 1, child: inputAno),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          const Expanded(flex: 3, child: SizedBox()),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBigLittle,
                      ),
                      Row(
                        children: [
                          Expanded(flex: 3, child: inputNumSerie),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 3, child: inputNumChasis),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBigLittle,
                      ),
                      Row(
                        children: [
                          Expanded(child: inputDescription),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(" Datos de Mantenimiento"),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 2, child: inputEstadoBateria),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 2, child: inputFechaIngreso),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(flex: 2, child: inputFechaSalida),
                          const SizedBox(
                            width: kSizeExtraMediun,
                          ),
                          Expanded(
                              flex: 2, child: inputTipoMantenimiento),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBigLittle,
                      ),
                      Row(
                        children: [
                          Expanded(child: inputComentarioVehiculo),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBigLittle,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: DottedBorder(
                                color: Colors.green,
                                dashPattern: const [
                                  5,
                                  3
                                ], // Ajusta los valores para cambiar la apariencia del borde entrecortado
                                strokeWidth: 2,
                                borderType: BorderType
                                    .RRect, // Usar borde redondeado si es necesario
                                radius: const Radius.circular(
                                    12), // Radio para las esquinas redondeadas
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child:  const Center(
                                      child: Text('Adjuntar archivo')),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(child: SizedBox(
                  width: 200,
                  child: btnSearch,)
                  ),
                  const SizedBox(height: 20,)
              ],
            );
    });
  }
}
