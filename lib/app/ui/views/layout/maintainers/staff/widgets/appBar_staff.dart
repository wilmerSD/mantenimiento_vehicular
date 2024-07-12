/* import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarStaff extends StatelessWidget {
  const AppBarStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: kMarginLittleApp.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
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
                    ),
                    SizedBox(
                      width: kSizeSmallLittle.w,
                    ),
                    Text(
                      'Asignación de horarios',
                      textAlign: TextAlign.left,
                      style: AppTextStyle(context).extra20(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: 280,
                    child: Obx(
                      () => Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: kSizeBigLittle.h,
                            child: Icon(Icons.person,
                                color: AppColors.backgroundColor,
                                size: kSizeBigLittle.h),
                          ),
                          SizedBox(width: kSizeSmallLittle.w),
                          Flexible(
                            child: Text(
                              textScaleFactor: 1.2,
                              controller.names.value,
                              style: AppTextStyle(context)
                                  .medium12(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */