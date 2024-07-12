import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/vacation_indicators.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BodyVacationRequest extends StatelessWidget {
  const BodyVacationRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements
          final keyFormSearch = GlobalKey<FormState>();

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

          /*📌 Widget para ingresar motivo*/
          Widget reason = InputPrimary(
            maxlines: null,
            inputFormats: [LengthLimitingTextInputFormatter(150)],
            textEditingController: controller.reasonVacations,
            label: "Motivo",
            onChanged: (value) => controller.reasonVacations.value,
          );

          /* 📌 Boton para limpiar */
          Widget btnClean = BtnCancel(
            text: "Cancelar",
            onTap: () {
              controller.currentRequest.value = -1;
              controller.cleanReasonVacations();
            },
          );

          /* 📌 Boton para buscar */
          Widget btnSend = Obx(
            () => BtnPrimary(
              text: controller.isLoadingRequest.value
                  ? textSending
                  : textSend,
              onTap: () async {
                if (keyFormSearch.currentState!.validate()) {
                  controller.validateVacations();
                }
                /* controller.isLoadingRequest.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.statusVacations.value
                        ? {await controller.cleanReasonVacations()}
                        : null; */
              },
            ),
          );

          /*📌 Widget para ingresar fecha de inicio */
          Widget inputDateFirst = InputPrimary(
            hintText: "dd/mm/aaaa",
            label: "Fecha de inicio",
            maxLength: 10,
            textEditingController: controller.firstDate,
            onChanged: (value) {
              controller.firstDate.value;
            },
            inputFormats: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
            ],
            validator: (date) {
              if (Helpers.compareDatesDMY(
                      controller.firstDate.text, controller.endDate.text) >
                  0) {
                return kmessageErrorCompareDateStart;
              }
              if (Helpers.compareDatesDMY(
                      controller.firstDate.text, controller.dateToday) <
                  0) {
                return kmessageErrorCompareDateTodayStart;
              } else {
                return Helpers.noRequiredDateTimeDMY(date, date ?? "");
              }
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  DateTime? pickdateInicio = await showDatePicker(
                    context: context,
                    locale: const Locale("es", "ES"),
                    initialDate:
                        DateTime.now() /* .add(const Duration(days: 1)) */,
                    firstDate:
                        DateTime.now() /* .add(const Duration(days: 1)) */,
                    lastDate: DateTime(2100),
                  );
                  if (pickdateInicio != null) {
                    controller.firstDate.text =
                        Helpers.dateToStringTimeDMY(pickdateInicio);
                  }
                },
                child: const Icon(Iconsax.calendar, color: AppColors.blueDark)),
          );

          /*📌 Widget para ingresar fecha de fin */
          Widget inputDateEnd = InputPrimary(
            hintText: "dd/mm/aaaa",
            label: "Fecha de fin",
            maxLength: 10,
            textEditingController: controller.endDate,
            onChanged: (value) {
              controller.endDate.value;
            },
            inputFormats: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
            ],
            validator: (date) {
              if (Helpers.compareDatesDMY(
                      controller.endDate.text, controller.firstDate.text) <
                  0) {
                return kmessageErrorCompareDateEnd;
              }
              if (Helpers.compareDatesDMY(
                      controller.endDate.text, controller.dateToday) <
                  0) {
                return kmessageErrorCompareDateTodayEnd;
              } else {
                return Helpers.noRequiredDateTimeDMY(date, date ?? "");
              }
            },
            suffixIcon: IconWrapper(
                onTap: () async {
                  DateTime? pickdateInicio = await showDatePicker(
                    context: context,
                    locale: const Locale("es", "ES"),
                    initialDate:
                        DateTime.now() /* .add(const Duration(days: 1)) */,
                    firstDate:
                        DateTime.now() /* .add(const Duration(days: 1)) */,
                    lastDate: DateTime(2100),
                  );
                  if (pickdateInicio != null) {
                    controller.endDate.text =
                        Helpers.dateToStringTimeDMY(pickdateInicio);
                  }
                },
                child: const Icon(
                  Iconsax.calendar,
                  color: AppColors.blueDark,
                )),
          );

          /*📌 Widget para ingresar si es adelanto vacacional*/
          Widget isPreviewVacation = Row(children: [
            Obx(
              () => Checkbox(
                value: controller.isPreviewVacation.value,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    controller.toggleCheckIsPreview();
                  }
                },
              ),
            ),
            const Expanded(
              child: Text(
                'Adelanto vacacional',
                style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w400,
                    color: AppColors.grayMiddle),
              ),
            )
          ]);

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("Vacaciones",
                                      style:
                                          AppTextStyle(context).semibold24())),
                              SizedBox(height: kSizeExtraMediun.h),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: nroDocumento),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 2, child: inputName),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kSizeExtraMediun.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(flex: 4, child: inputDateFirst),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 4, child: inputDateEnd),
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(flex: 4, child: isPreviewVacation),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: kSizeExtraMediun.h),
                              /* Row(
                                children: [
                                  Expanded(flex: 2, child: reason),
                                  const Expanded(flex: 2, child: SizedBox()),
                                ],
                              ), */
                              SizedBox(height: kSizeSmallBig.h),
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
                    SizedBox(
                      width: kSizeSmallLittle.w,
                    ),
                    const Expanded(flex: 1, child: VacationIndicators())
                  ],
                )
              : Column(
                  children: [
                    /* const VacationIndicators(), */
                    Column(
                      children: [
                        const VacationIndicators(),
                        SizedBox(height: kMarginBigApp.h),
                        Container(
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
                                    /* Expanded(flex: 1, child: inputLastName), */
                                  ],
                                ),
                                SizedBox(height: kMarginBigApp.h),
                                Row(
                                  children: [
                                    Expanded(flex: 3, child: inputDateFirst),
                                    const Expanded(flex: 1, child: SizedBox()),
                                  ],
                                ),
                                SizedBox(height: kMarginBigApp.h),
                                Row(
                                  children: [
                                    Expanded(flex: 3, child: inputDateEnd),
                                    const Expanded(flex: 1, child: SizedBox()),
                                  ],
                                ),
                                SizedBox(height: kMarginBigApp.h),
                                isPreviewVacation,
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
                        SizedBox(height: kMarginExtraBigApp.h),
                      ],
                    ),
                  ],
                );
        });
  }
}
