import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailslMonth extends StatelessWidget {
  const DetailslMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) => SizedBox(
              /* padding: EdgeInsets.only(
                left: kSizeLittle,
              ), */
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red/* AppColors.grayBlue.withOpacity(0.1) */,
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ), */
                  Container(
                    height: kSizeExtraTall.h,
                    /* width: 990, */
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grayBlue.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 7,
                          /* offset: const Offset(0, 3), */
                        ),
                      ],
                      color: AppColors.backgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kRadiusSmall),
                      ),
                    ),
                    child: Obx(() {
                      return controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : controller.responseDataMes.isEmpty
                              ? Center(
                                  child:
                                      Text('${controller.statusMessageMonth}',
                                          style: AppTextStyle(context).medium14(
                                            color: AppColors.grayBlue,
                                          )),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.only(left: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.responseDataMes.length,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: kSizeNormalMediun.w);
                                  },
                                  itemBuilder: (context, index) {
                                    final itemMonth =
                                        controller.responseDataMes[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          textScaleFactor: 1,
                                          '${itemMonth.quantity}',
                                          style: AppTextStyle(context).extra20(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          textScaleFactor: 1,
                                          itemMonth.description!,
                                          style: AppTextStyle(context).medium12(
                                            color: AppColors.grayBlue,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                    }),
                  ),
                ],
              ),
            ));
  }
}
