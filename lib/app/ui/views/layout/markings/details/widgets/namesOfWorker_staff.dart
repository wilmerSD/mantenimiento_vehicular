import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

final helpers = Helpers();

class NamesOfWorkerStaff extends StatelessWidget {
  const NamesOfWorkerStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.only(top: kPaddingAppNormalApp),
        /* height: 50 */ /* kSizeBigLarge.h */
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(kRadiusSmall),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trabajador: ",
              style: AppTextStyle(context).bold18(color: AppColors.grayBlue),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.namesEmployee.value,
                    style:
                        AppTextStyle(context).bold18(color: AppColors.blueDark),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconWrapper(
              onTap: () {
                controller.selectionColor.value = false;
                Get.back();
              },
              child: const Tooltip(
                message: 'Salir',
                child: Icon(
                    size: 30,
                    Iconsax.close_circle,
                    color: Color.fromRGBO(218, 41, 28, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
