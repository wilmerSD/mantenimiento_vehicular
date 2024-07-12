import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/widgets/body_workmodality.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/widgets/data_table_workmodality.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/workmodality/workmodality_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkModalityView extends StatelessWidget {
  const WorkModalityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkModalityController>(
        init: WorkModalityController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        /* const HeadWorkModality(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ), */
                        const BodyWorkModality(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoadingWorkModality.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableWorkModality())),
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
                        /* const HeadWorkModality(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ), */
                        const BodyWorkModality(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoadingWorkModality.value
                            ? HelpersComponents.getLoadingAnimation()
                            : SizedBox(
                                height:
                                    (controller.listModalityWork.length + 2.5) *
                                            48 +
                                        30,
                                child: const DataTableWorkModality())),
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
