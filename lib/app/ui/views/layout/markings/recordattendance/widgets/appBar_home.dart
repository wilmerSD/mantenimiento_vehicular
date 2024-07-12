import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<RecordattendanceController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: kMarginApp.w, vertical: kMarginBigApp.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Container(
                  height: kSizeNormalLarge.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grayBlue.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    /* onPressed: () {
                      controller.navigateToScreen();
                    }, */
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.primary,
                    ),
                  ),
                ), */
                const SizedBox(),
                Container(
                  width: 300,
                  height: kSizeNormalLarge.h,
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingAppLargeApp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadiusMedium.h),
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grayBlue.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        textScaleFactor: 1,
                        'Valtx',
                        style: /* TextStyle(
                            color: AppColors.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.w900), */
                            AppTextStyle(context)
                                .extra22(color: AppColors.primary),
                      ),
                      const SizedBox(width: kSizeBigLittle),
                      Text(
                        textScaleFactor: 1.2,
                        helpers.getDateLarge(),
                        style: AppTextStyle(context)
                            .medium12(color: AppColors.grayBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
