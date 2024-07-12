import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BodyPermissionRequest extends StatelessWidget {
  const BodyPermissionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();
          /*  final item = controller.scheduleByUser; */

          /*📌 Widget para ingresar nombre */
          Widget inputName = InputPrimary(
            textEditingController: controller.names,
            label: "Nombres y apellidos",
            onChanged: (value) => controller.names.value,
            isActive: false,
          );

          /*📌 Widget para ingresar numero de documento */
          Widget nroDocumento = InputPrimary(
            textEditingController: controller.documentNro,
            label: "Nro. Documento",
            onChanged: (value) => controller.documentNro.value,
            isActive: false,
          );

          /*📌 Widget para ingresar fecha de permiso */
          Widget dateToPermission = Obx(
            () => InputPrimary(
                autoValidate: controller.isAutovalidate.value == 0
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.onUserInteraction,
                hintText: "dd/mm/aaaa",
                label: "Fecha para permiso",
                textEditingController: controller.datePermission,
                onChanged: (value) {
                  controller.datePermission.value;
                },
                maxLength: 10,
                inputFormats: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
                ],
                validator: (date) {
                  if (Helpers.compareDatesDMY(controller.datePermission.text,
                          controller.dateToday) <
                      0) {
                    return kmessageErrorDate;
                  } else {
                    return Helpers.noRequiredDateTimeDMY(date, date ?? "");
                  }
                },
                suffixIcon: IconWrapper(
                    onTap: () async {
                      DateTime? pickdateInicio = await showDatePicker(
                        context: context,
                        locale: const Locale("es", "ES"),
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickdateInicio != null) {
                        controller.datePermission.text =
                            Helpers.dateToStringTimeDMY(pickdateInicio);
                      }
                      controller.isAutovalidate.value = 1;
                    },
                    child: const Icon(Iconsax.calendar,
                        color: AppColors.blueDark))),
          );

          /*📌 Widget para ingresar motivo*/
          Widget reason = InputPrimary(
            maxlines: null,
            inputFormats: [LengthLimitingTextInputFormatter(reasonMax)],
            textEditingController: controller.reasonToPermission,
            label: "Motivo",
            onChanged: (value) => controller.reasonToPermission.value,
          );

          /* 📌 Boton para limpiar */
          Widget btnClean = BtnCancel(
            text: "Cancelar",
            onTap: () {
              controller.currentRequest.value = -1;
              controller.cleanReasonPermission();
            },
          );

          /* 📌 Boton para enviar solicitud de permiso */
          Widget btnSend = Obx(
            () => BtnPrimary(
              text: controller.isLoadingRequest.value ? textSending : textSend,
              onTap: () {
                controller.isAutovalidate.value = 0;
                if (keyFormSearch.currentState!.validate()) {
                  controller.validateForm(context);
                }
              },
            ),
          );

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 3, child: nroDocumento),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 6, child: inputName),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 3, child: dateToPermission),
                                ],
                              ),
                              SizedBox(height: kSizeTall.h),
                              Row(
                                children: [
                                  Expanded(flex: 2, child: reason),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  const Expanded(flex: 6, child: SizedBox()),
                                  Expanded(flex: 1, child: btnSend),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 1, child: btnClean),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kPaddingAppNormalApp,
                            horizontal: kPaddingAppLargeApp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadiusMedium),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 3, child: nroDocumento),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 3, child: inputName),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 3, child: dateToPermission),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 3, child: reason),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: btnSend),
                                  const SizedBox(
                                    width: kSizeNormalLittle,
                                  ),
                                  Expanded(flex: 1, child: btnClean),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        });
  }
}
