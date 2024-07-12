import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class TypesValidations extends StatelessWidget {
  const TypesValidations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.only(top: kPaddingAppNormalApp),
        height: kSizeNormalLarge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(kRadiusSmall),
          ),
        ),
        child: Obx(
          () => controller.isLoadingTypesValidation.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  /* padding: EdgeInsets.only(
                    left: kPaddingAppNormalApp,
                  ), */
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.responseTypesValidations.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: kSizeBig);
                  },
                  itemBuilder: (context, index) {
                    final item = controller.responseTypesValidations[index];
                    Color circleColor =
                        helpers.getCircleColor(item.idValidacion ?? 0);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: kRadiusSmall.h,
                          backgroundColor: circleColor,
                        ),
                        const SizedBox(width: kSizeSmallLittle),
                        Text(
                          textScaleFactor: 1,
                          item.descripcion ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle(context).medium12(
                            color: AppColors.grayBlue,
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
