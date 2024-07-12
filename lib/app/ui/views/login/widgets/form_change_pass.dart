import 'package:app_valtx_asistencia/app/ui/components/field_form.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormChangePass extends GetView<LoginController> {
  const FormChangePass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 64.h),
        Text(
          textScaleFactor: 1,
          "Cambiar contraseña",
          style: AppTextStyle(context).bold26(color: AppColors.primary),
        ),
        SizedBox(height: 40.h),
        FieldForm(
          label: "Correo electronico",
          hintText: "",
          textInputType: TextInputType.emailAddress,
          textEditingController: controller.ctrlEmailText,
        ),
        SizedBox(height: 25.h),
        Obx(
          () => FieldForm(
            label: "Contraseña",
            hintText: "",
            privateText: controller.isVisible.value,
            suffix: GestureDetector(
              onTap: () {

                controller.setPrivate();
              },
              child: Icon(
                  controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash),
            ),
            textEditingController: controller.ctrlPasswordText,
            onEditingComplete: () {
              
              FocusScope.of(context).unfocus();
              controller.doAuthentication();
              //controller.validateForm(context);
            },
          ),
        ),

        Obx(
          () => FieldForm(
            label: "Confirmar contraseña",
            hintText: "",
            privateText: controller.isVisible.value,
            suffix: GestureDetector(
              onTap: () {

                controller.setPrivate();
              },
              child: Icon(
                  controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash),
            ),
            textEditingController: controller.ctrlPasswordText,
            onEditingComplete: () {
              
              FocusScope.of(context).unfocus();
              controller.doAuthentication();
              //controller.validateForm(context);
            },
          ),
        ),
      ],
    );
  }
}
