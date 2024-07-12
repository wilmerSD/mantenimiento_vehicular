import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsRequestManagement extends StatelessWidget {
  const DetailsRequestManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(
        builder: (controller) => Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: kSizeNormalLarge,
                            height: kSizeExtraMediun,
                            decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius:
                                    BorderRadius.circular(kRadiusSmall),
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
                                size: kIconSize.h),
                          ),
                          const SizedBox(width: kSizeBigLittle),
                          Text(
                            textScaleFactor: 1.2,
                            'Pendientes de aprobación: ',
                            style: AppTextStyle(context)
                                .medium12(color: AppColors.grayBlue),
                          ),
                          Obx(
                            () => Text(
                              textScaleFactor: 1.2,
                              '${controller.pendingJustifications.value}',
                              style: AppTextStyle(context)
                                  .bold16(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                      /* ), */
                    ],
                  ),
                ],
              ),
            ));
  }
}
