/* 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateUsuario extends StatelessWidget {
  const CreateUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      // final isPermisionUpdate =
      //     SesionDataTemporary.data["SUSERS-UPDATE"] == true;
      //Elements
      final keyForm = GlobalKey<FormState>();
      Widget usuario = InputPrimary(
        label: "Usuario",
        textEditingController: controller.userNameToCreateTEC,
        validator: (value) {
          return Helpers.requiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "solo se aceptan letras");
        },
        //hint: "DNI",
        //  isActive: false,
      );
      Widget inputNombre = InputPrimary(
        label: "Nombre completo",
        textEditingController: controller.nameToCreateTEC,
        validator: (value) {
          return Helpers.simpleRequired(value);
        },
      );
      Widget apellidoParter = InputPrimary(
        label: "Apellido paterno",
        textEditingController: controller.lastnameToCreateTEC,
        validator: (value) {
          return Helpers.requiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "solo se aceptan letras");
        },
        //isActive: false,
      );

      Widget apellidoMaterno = InputPrimary(
        label: "Apellido materno",
        textEditingController: controller.lastname2ToCreateTEC,
        validator: (value) {
          return Helpers.requiredRegex(
              value,
              RegExp(r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚñÑ])[a-zA-ZáéíóúÁÉÍÓÚ\sñÑ]*$'),
              "solo se aceptan letras");
        },

        //isActive: false,
      );

      Widget tipoDocumento = Obx(() => Select(
            value: controller.listDocumento.firstWhere(
                (element) => element.value == controller.documentosID.value),
            label: "Tipo documento",
            items: controller.listDocumento.map(
              (element) {
                return DropdownMenuItem(
                  value: element,
                  child: OptionSelect(nameOption: element.text),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              controller.documentosID.value = (newValue as DatumSelect3).value!;
            },
            validator: (value) {
              return Helpers.simpleRequiredCboString(
                  (value as DatumSelect3).value!.toString());
            },
          ));

      Widget inputProfile = Obx(
        () => controller.isLoadingProfileToCreate.value
            ? const Select(
                label: "Perfil",
                hint: "Seleccionar",
                isActive: false,
              )
            : Select(
                value: controller.profileListToEdit.firstWhere((element) =>
                    element.value == controller.currentProfileId.value),
                label: 'Perfil',
                items: controller.profileListToEdit.map(
                  (data) {
                    return DropdownMenuItem(
                      value: data,
                      child: OptionSelect(nameOption: data.text),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  controller.currentProfileId.value =
                      (value as DatumSelect2Combo).value!;
                },
                validator: (value) {
                  if (value == null ||
                      controller.currentProfileId.value == -1) {
                    return "Este campo es obligatorio";
                  }
                  return null;
                },
              ),
      );

      Widget nroDocumento = Obx(
        () => InputPrimary(
          label: "Nro documento",
          textEditingController: controller.documentToCreateTEC,
          inputFormats: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          maxLength: controller.documentosID.value == 0
              ? 8
              : controller.documentosID.value == 1
                  ? 12
                  : null,
          validator: (value) {
            if (controller.documentosID.value == 0) {
              return Helpers.requiredRegex(
                  value,
                  RegExp(
                    r'^\d{8}$',
                  ),
                  "Formato DNI incorrecto");
            } else if (controller.documentosID.value == 1) {
              return Helpers.requiredRegex(
                  value,
                  RegExp(
                    r'^\d{12}$',
                  ),
                  "Formato de carnet incorrecto");
            } else {
              return Helpers.requiredRegex(
                  value,
                  RegExp(
                    'null',
                  ),
                  "Seleccione un tipo de documento");
            }
            // return Helpers.simpleRequired(value);
          },
        ),
      );
      Widget inputCorreo = InputPrimary(
        label: "Correo electronico",
        textEditingController: controller.mailToCreateTEC,
         validator: (value) {
          return Helpers.simpleRequired(value);
        },
        // validator: (value) {
        //   if (value == null || controller.currentProfileId.value == -1) {
        //     return "Este campo es obligatorio";
        //   }
        //   return null;
        // },
      );

      Widget contrasena = InputPrimary(
        label: "Contraseña",
        textEditingController: controller.passwordToCreateTEC,
         validator: (value) {
          return Helpers.simpleRequired(value);
        },
        // validator: (value) {
        //   if (value == null || controller.currentProfileId.value == -1) {
        //     return "Este campo es obligatorio";
        //   }
        //   return null;
        // },
      );

      Widget repetirContrasena = InputPrimary(
        label: "Repetir contraseña",
        textEditingController: controller.password2ToCreateTEC,
        validator: (value) {
          return Helpers.completeValidatePasssword(
              controller.passwordToCreateTEC.text,
              controller.password2ToCreateTEC.text,
              value);
        },
        //isActive: false,
      );

      Widget inputState = Obx(
        () => Select(
          label: "Estado",
          value: controller.stateListToCreateTEC.firstWhere((element) =>
              element.value == "${controller.currentStateToCreate.value}"),
          items: controller.stateListToCreateTEC.map(
            (element) {
              return DropdownMenuItem(
                value: element,
                child: OptionSelect(nameOption: element.text),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            controller.currentStateToCreate.value =
                int.parse((newValue as DatumSelect).value!);
          },
        ),
      );
      Widget btnCancel = BtnCancel(
        text: "Cerrar",
        onTap: () {
          Get.back();
          Future.delayed(const Duration(milliseconds: 300), () {
            controller.cleanDataToCreate();
          });
        },
      );
      Widget btnRegistrar = Expanded(
        child: BtnPrimary(
          text: "Registrar",
          onTap: () async {
            if (keyForm.currentState!.validate()) {
              if (await controller.documentosID.value != -1 &&
                  controller.currentProfileId.value != -1) {
                Get.back();
                controller.putUser(context);
              }
            }
          },
        ),
      );

      return Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Form(
              key: keyForm,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                // child: Form(
                //  key: keyForm,
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Crear usuario",
                      style: AppTextStyle(context)
                          .semi32(color: AppColors.primaryBlue),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 25, right: 25),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(0, 113, 206, 1),
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: usuario),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      child: inputNombre,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(child: apellidoParter),
                                    const SizedBox(width: 10.0),
                                    Expanded(child: apellidoMaterno),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    Expanded(child: tipoDocumento),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      child: SizedBox(child: nroDocumento),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(flex: 2, child: inputCorreo),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: contrasena,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Expanded(
                                      child: Expanded(
                                        flex: 5,
                                        child: repetirContrasena,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Expanded(
                                      flex: 6,
                                      child: SizedBox(child: inputProfile),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Expanded(
                                      child: Expanded(
                                        flex: 5,
                                        child: inputState,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          child: btnCancel,
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(flex: 5, child: btnRegistrar),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
                //   ),
              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Form(
                //  key: keyForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Editar usuario",
                          style: AppTextStyle(context)
                              .semi32(color: AppColors.grayDarkPlus),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Expanded(
                          child: usuario,
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: inputNombre,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                          // flex: isPermisionUpdate ? 10 : 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: btnCancel,
                              ),
                              SizedBox(
                                  // width: isPermisionUpdate ? 20.0 : 0.0,
                                  ),
                              btnRegistrar,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
 */