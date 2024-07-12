import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VacationIndicators extends StatelessWidget {
  const VacationIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          //Elements
          /*📌 Widget para ver días truncos */
          Widget truncatedDay = InputPrimary(
            textEditingController: controller.truncatedDay,
            label: "Días truncos",
            onChanged: (value) => controller.truncatedDay.value,
            isActive: false,
          );

          /*📌 Widget para ver días pendientes */
          Widget pendingDay = InputPrimary(
            textEditingController: controller.pendingDay,
            label: "Días pendientes",
            onChanged: (value) => controller.pendingDay.value,
            isActive: false,
          );

          /*📌 Widget para ver días vencidos */
          Widget expiredDay = InputPrimary(
            textEditingController: controller.expiredDay,
            label: "Días vencidos",
            onChanged: (value) => controller.expiredDay.value,
            isActive: false,
          );

          /*📌 Widget para ver fecha de derecho */
          Widget lawDay = InputPrimary(
            textEditingController: controller.lawDay,
            label: "Fecha de derecho",
            onChanged: (value) => controller.lawDay.value,
            isActive: false,
          );

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.info_circle,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          SizedBox(width: kMarginNormalApp.h),
                          Expanded(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Información vacacional",
                                    style: AppTextStyle(context).semibold24())),
                          ),
                        ],
                      ),
                      truncatedDay,
                      SizedBox(height: kMarginBigApp.h),
                      pendingDay,
                      SizedBox(height: kMarginBigApp.h),
                      expiredDay,
                      SizedBox(height: kMarginBigApp.h),
                      lawDay,
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPaddingAppNormalApp,
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.info_circle,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          SizedBox(width: kMarginNormalApp.h),
                          Expanded(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Información vacacional",
                                    style: AppTextStyle(context).semibold24())),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: truncatedDay),
                          SizedBox(width: kMarginBigApp.h),
                          Expanded(flex: 1, child: pendingDay),
                        ],
                      ),
                      SizedBox(height: kMarginBigApp.h),
                      Row(
                        children: [
                          Expanded(flex: 1, child: expiredDay),
                          SizedBox(width: kMarginBigApp.h),
                          Expanded(flex: 1, child: lawDay),
                        ],
                      ),
                    ],
                  ),
                );
        });
  }
}
