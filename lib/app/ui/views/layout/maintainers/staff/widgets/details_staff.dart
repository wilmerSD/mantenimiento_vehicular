import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsStaff extends StatelessWidget {
  const DetailsStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      init: StaffController(),
      builder: (controller) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: kMarginLittleApp.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*  GestureDetector(
                  onTap: () {
                    HelpersComponents.getModal(
                        context, const ReportAsistance());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPaddingAppLittleApp),
                    margin: const EdgeInsets.only(right: 20),
                    height: kSizeNormalLarge.h,
                    decoration: BoxDecoration(
                        color: AppColors.greenLight,
                        borderRadius: BorderRadius.circular(kRadiusSmall),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greenLight.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.add,
                          color: AppColors.backgroundColor,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Descargar reporte',
                            style: AppTextStyle(context)
                                .medium14(color: AppColors.backgroundColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: kSizeExtraMediun.h,
                      height: kSizeExtraMediun.h,
                      decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(kRadiusSmall),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.red.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Icon(Icons.person,
                          color: AppColors.backgroundColor,
                          size: kSizeBigLittle.h),
                    ),
                    SizedBox(width: kSizeSmallLittle.w),
                    Text(
                      textScaleFactor: 1.2,
                      'Total de trabajadores: ',
                      style: AppTextStyle(context)
                          .medium12(color: AppColors.grayBlue),
                    ),
                    Obx(
                      () => Text(
                        textScaleFactor: 1.2,
                        '${controller.amountWorkers.value}',
                        style: AppTextStyle(context)
                            .bold16(color: AppColors.primary),
                      ),
                    )
                  ],
                ),
                /* ), */
              ],
            ),
          ],
        ),
      );
    });
  }
}
