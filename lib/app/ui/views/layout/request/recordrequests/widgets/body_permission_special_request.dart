import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BodyPermissionSpecialRequest extends StatelessWidget {
  const BodyPermissionSpecialRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

          /*📌 Widget para ingresar nombre */
          Widget inputName = InputPrimary(
            textEditingController: controller.namesUserAuthorization,
            label: "Nombres",
            onChanged: (value) => controller.namesUserAuthorization.value,
            isActive: false,
          );

          /* 📌 Ingreso de nombres */
          Widget inputLastName = InputPrimary(
            label: "Apellidos",
            textEditingController: controller.lastNamesUserAuthorization,
            isActive: false,
          );

          /*📌 Widget para ingresar numero de documento */
          Widget nroDocumento = InputPrimary(
            textEditingController: controller.documentNroUserAuthorization,
            label: "Nro. Documento",
            onChanged: (value) => controller.documentNroUserAuthorization.value,
            isActive: false,
          );

          /*📌 Widget para ingresar fecha de permiso especial */
          Widget dateToPermission = InputPrimary(
            hintText: "dd/mm/aaaa",
            label: "Fecha para permiso",
            maxLength: 10,
            textEditingController: controller.dateAuthorization,
            onChanged: (value) {
              controller.dateAuthorization.value;
            },
            inputFormats: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
            ],
            validator: (date) {
              if (Helpers.compareDatesDMY(
                      controller.dateAuthorization.text, controller.dateToday) <
                  0) {
                return kmessageErrorDate;
              }
              if (Helpers.areDatesEqual(
                  controller.dateAuthorization.text, controller.dateToday)) {
                return kmessageErrorCompareDateTodayEqual;
              } else {
                return Helpers.noRequiredDateTimeDMY(date, date ?? "");
              }
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  DateTime? pickdateInicio = await showDatePicker(
                    context: context,
                    locale: const Locale("es", "ES"),
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime(2100),
                  );
                  if (pickdateInicio != null) {
                    controller.dateAuthorization.text =
                        Helpers.dateToStringTimeDMY(pickdateInicio);
                  }
                },
                child: const Icon(Iconsax.calendar, color: AppColors.blueDark)),
          );

          /* 📌 Para seleccionar horas antes */
          Widget inputHours = Obx(
            () => Select(
              label: "Horas antes",
              value: controller.listHours.firstWhere(
                  (element) => element.value == controller.chooseTimes.value),
              items: controller.listHours.map(
                (element) {
                  return DropdownMenuItem(
                    value: element,
                    child: OptionSelect(nameOption: element.text),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                controller.chooseTimes.value =
                    (newValue as DatumSelect2Combo).value!;
                controller.hourModifiedAdmissionTime.text =
                    controller.substractHours(
                        controller.normalAdmissionTime.text,
                        controller.chooseTimes.value);
              },
            ),
          );

          /*📌 Widget para ingresar hora de ingreso */
          Widget normalAdmissionTime = InputPrimary(
            textEditingController: controller.normalAdmissionTime,
            label: "Hora ingreso",
            onChanged: (value) => controller.startTime,
            isActive: false,
          );

          /*📌 Widget para ingresar hora de ingreso modificado */
          Widget hourModifiedAdmissionTime = InputPrimary(
            hintText: "hh:mm",
            label: "Hora para permiso",
            maxLength: 5,
            textEditingController: controller.hourModifiedAdmissionTime,
            isActive: false,
            /* onChanged: (value) {
          controller.hourModifiedAdmissionTime.value;
        }, */
            /* suffixIcon: IconWrapper(
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                controller.hourModifiedAdmissionTime.text =
                    "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
              }
            },
            child: const Icon(Iconsax.clock)), */
          );

          /*📌 Widget para ingresar motivo*/
          Widget reason = InputPrimary(
            maxlines: null,
            textEditingController: controller.reasonToAuthorization,
            inputFormats: [LengthLimitingTextInputFormatter(reasonMax)],
            label: "Motivo",
            onChanged: (value) => controller.reasonToAuthorization.value,
          );

          /* 📌 Boton para limpiar */
          Widget btnClean = BtnCancel(
            text: "Cancelar",
            onTap: () {
              /* controller.userIndex.value = -1; */
              controller.requestSpecial.value = false;
              controller.cleanVariablesRequestSpecial();
            },
          );

          /* 📌 Boton para buscar */
          Widget btnSend =
              Obx(() => controller.scheduleByUser.value.horaInicio != null
                  ? BtnPrimary(
                      text: controller.isLoadingRequest.value
                          ? textSending
                          : textSend,
                      onTap: () async {
                        if (keyFormSearch.currentState!.validate()) {
                          await controller.validateAuthorization(context);
                        }
                        controller.isLoadingRequest.value
                            ? const Center(child: CircularProgressIndicator())
                            : controller.statusAuthorization.value
                                ? {
                                    controller.requestSpecial.value = false,
                                    Get.dialog(AlertDialogComponent(
                                      title:
                                          "Información sobre la autorización",
                                      headerTitle: "Información",
                                      onTapButton: () async {
                                        await controller
                                            .cleanUserAuthorization();
                                        Get.back();
                                      },
                                      widgetContent: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              controller
                                                  .statusMessageUserAuthorization
                                                  .value,
                                              textScaleFactor: 1,
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppTextStyle(context).semi14(
                                                color: AppColors.primary,
                                              )),
                                          SizedBox(
                                            height: kSizeSmallLittle.h,
                                          ),
                                        ],
                                      ),
                                      isOnlyPrimary: true,
                                      textPrimaryButton: "OK",
                                    ))
                                  }
                                : null;
                      },
                    )
                  : SizedBox());

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
                          color: AppColors.backgroundColor,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Llenar el siguiente formulario",
                                      style: AppTextStyle(context).bold26(
                                          color: AppColors.grayDarkPlus)),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text("* ",
                                          style: AppTextStyle(context)
                                              .mid20(color: AppColors.red)),
                                      Text(
                                          "Esta autorización de ingreso previo generará horas extra",
                                          style: AppTextStyle(context).mid20(
                                              color: AppColors.grayDarkPlus)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Obx(() => controller.scheduleByUser.value
                                              .horaInicio !=
                                          null
                                      ? SizedBox()
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("* ",
                                                style: AppTextStyle(context)
                                                    .mid20(
                                                        color: AppColors.red)),
                                            Expanded(
                                              child: Text(
                                                  "El usuario tiene un horario rotativo y puede registrar su ingreso en cualquier momento, por lo que no es posible registrarle un ingreso previo.",
                                                  style: AppTextStyle(context)
                                                      .mid20(
                                                          color: AppColors
                                                              .grayDarkPlus)),
                                            )
                                          ],
                                        ))
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(flex: 2, child: nroDocumento),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      Expanded(flex: 2, child: inputName),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      Expanded(flex: 2, child: inputLastName),
                                    ],
                                  ),
                                  SizedBox(height: kMarginBigApp.h),
                                  Row(
                                    children: [
                                      Expanded(flex: 2, child: inputHours),
                                      const Expanded(child: SizedBox()),
                                      Expanded(
                                          flex: 2,
                                          child: hourModifiedAdmissionTime),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      Expanded(
                                          flex: 2, child: normalAdmissionTime),
                                    ],
                                  ),
                                  SizedBox(height: kMarginBigApp.h),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2, child: dateToPermission),
                                      const Expanded(child: SizedBox()),
                                      Expanded(flex: 5, child: reason),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: kMarginBigApp.h),
                              Row(
                                children: [
                                  const Expanded(flex: 3, child: SizedBox()),
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
                          color: AppColors.backgroundColor,
                        ),
                        child: Form(
                          key: keyFormSearch,
                          child: ListView(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2, child: nroDocumento),
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                          Expanded(flex: 2, child: inputName),
                                        ],
                                      ),
                                      SizedBox(height: kMarginBigApp.h),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2, child: inputLastName),
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                          Expanded(flex: 2, child: inputHours),
                                        ],
                                      ),
                                      SizedBox(height: kMarginBigApp.h),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: hourModifiedAdmissionTime),
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                          Expanded(
                                              flex: 2,
                                              child: normalAdmissionTime),
                                        ],
                                      ),
                                      SizedBox(height: kMarginBigApp.h),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2, child: dateToPermission),
                                          const Expanded(
                                              flex: 3, child: SizedBox()),
                                        ],
                                      ),
                                      SizedBox(height: kMarginBigApp.h),
                                      Row(
                                        children: [
                                          Expanded(flex: 5, child: reason),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: kMarginBigApp.h),
                                  Row(
                                    children: [
                                      Expanded(flex: 1, child: btnSend),
                                      const SizedBox(width: kSizeNormalLittle),
                                      Expanded(flex: 1, child: btnClean),
                                    ],
                                  ),
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
