import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/typesvalidation_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/widgets/body_typesvalidation.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesvalidation/widgets/data_table_typesvalidation.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeValidationView extends StatelessWidget {
  const TypeValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeValidationController>(
        init: TypeValidationController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        const BodyTypeValidation(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableTypeValidation())),
                      ],
                    ),
                    Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    ListView(
                      children: [
                        const BodyTypeValidation(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : SizedBox(
                              height:
                                    (controller.listTypesValidation.length + 2.5) *
                                            48 +
                                        30,
                              child: const DataTableTypeValidation())),
                      ],
                    ),
                    Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
                  ],
                );
        });
  }
}
