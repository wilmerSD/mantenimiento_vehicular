import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/changepass/changepass_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePassController>(
        init: ChangePassController(),
        builder: (controller) {
          final keyFormSearch = GlobalKey<FormState>();

          /* 📌 Información del usuario(nombres y apellidos) */
          Widget user = InputPrimary(
            isActive: false,
            label: "Nombres y apellidos",
            textEditingController: controller.fullNamesUser,
          );

          /* 📌 Email del usuario */
          Widget email = InputPrimary(
            label: "Correo",
            isActive: false,
            textEditingController: controller.emailString,
          );

          /* 📌 Input de nueva contraseña */
          Widget newPassword = Obx(
            () => InputPrimary(
                autoValidate: controller.autovalidateMode.value ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                privateText: controller.isVisible.value,
                label: "Nueva contraseña",
                textEditingController: controller.newPassword,
                onChanged: (value) {
                  controller.autovalidateMode.value = true;
                },
                suffix: IconWrapper(
                  isMini: true,
                  onTap: () {
                    controller.setPrivate();
                  },
                  child: Icon(
                    controller.isVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                    color: AppColors.blueDark,
                  ),
                ),
                validator: (value) {
                  if (controller.newPassword.text !=
                      controller.againNewPassword.text) {
                    return Helpers.comparePassword(
                      controller.newPassword.text,
                      controller.againNewPassword.text,
                    );
                  }
                  if (Helpers.requiredInput(value)! > 0) {
                    return "Por favor, ingrese una contraseña";
                  } else {
                    return null;
                  }
                }),
          );

          /* 📌 Input de nueva contraseña-repetir */
          Widget againNewPassword = Obx(
            () => InputPrimary(
              autoValidate: controller.autovalidateMode.value ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              privateText: controller.isVisible.value,
              label: "Repetir nueva contraseña",
              textEditingController: controller.againNewPassword,
              onChanged: (value) {
                  controller.autovalidateMode.value = true;
                },
              suffix: IconWrapper(
                isMini: true,
                onTap: () {
                  controller.setPrivate();
                },
                child: Icon(
                  controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash,
                  color: AppColors.blueDark,
                ),
              ),
              validator: (value) {
                if (controller.newPassword.text !=
                    controller.againNewPassword.text) {
                  return Helpers.comparePassword(
                    controller.newPassword.text,
                    controller.againNewPassword.text,
                  );
                }
                if (Helpers.requiredInput(value)! > 0) {
                  return "Por favor, ingrese una contraseña";
                } else {
                  return null;
                }
              },
            ),
          );

          /* 📌 Boton para cambiar contraseña */
          Widget btnChangePassword = Obx(
            () => BtnPrimary(
              /* isMaxHeight: true, */
              onTap: () async {
                controller.autovalidateMode.value = true;
                if (keyFormSearch.currentState!.validate()) {
                  await controller.changePassword();
                }
              },
              text: controller.isLoading.value ? "Cambiando..." : "Cambiar",
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null,
            ),
          );

          /* 📌 Para limpiar variables de contraseña */
          Widget cleanPasswords = BtnCancel(
            onTap: () {
              controller.autovalidateMode.value = false;
              controller.cleanPass(); 
            },
            text: "Limpiar",
          );

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    ListView(
                      children: [
                        Form(
                          key: keyFormSearch,
                          child: Column(children: [
                            const SizedBox(
                              width: 800.0,
                              height: kSizeSmallAmple,
                              child: Image(
                                image: AssetImage("assets/img/changePass.png"),
                              ),
                            ),
                            const SizedBox(
                              height: kSizeNormalLarge,
                            ),
                            Row(
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(flex: 1, child: user),
                                const SizedBox(
                                  width: kSizeNormalLarge,
                                ),
                                Expanded(flex: 1, child: email),
                                const Expanded(flex: 1, child: SizedBox()),
                              ],
                            ),
                            const SizedBox(
                              height: kSizeNormalLarge,
                            ),
                            Row(
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(flex: 1, child: newPassword),
                                const SizedBox(
                                  width: kSizeNormalLarge,
                                ),
                                Expanded(flex: 1, child: againNewPassword),
                                const Expanded(flex: 1, child: SizedBox()),
                              ],
                            ),
                            const SizedBox(
                              height: kSizeNormalLarge,
                            ),
                            Row(
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(flex: 1, child: cleanPasswords),
                                const SizedBox(
                                  width: kSizeNormalLarge,
                                ),
                                Expanded(flex: 1, child: btnChangePassword),
                                const Expanded(flex: 1, child: SizedBox()),
                              ],
                            ),
                            const SizedBox(
                              height: kSizeNormalMediun,
                            )
                          ]),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        children: [
                          const SizedBox(
                            width: 800.0,
                            height: kSizeSmallAmple,
                            child: Image(
                              image: AssetImage("assets/img/changePass.png"),
                            ),
                          ),
                          const SizedBox(
                            height: kSizeNormalLarge,
                          ),
                          Column(
                            children: [
                              user,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                              email,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                              newPassword,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                              againNewPassword,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                              cleanPasswords,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                              btnChangePassword,
                              const SizedBox(
                                height: kSizeNormalMediun,
                              ),
                            ],
                          ),
                        ]),
                    Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
                  ],
                );
        });
  }
}
