import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/widgets/body_markingype.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/widgets/data_table_markingtype.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/widgets/head_markingtype.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateGeneralView extends StatelessWidget {
  const StateGeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(
        init: MarkingTypeController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Column(
                  children: [
                    const HeadMarkingType(),
                    const SizedBox(
                      height: kSizeNormalLarge,
                    ),
                    const BodyMarkingType(),
                    const SizedBox(
                      height: kSizeNormalLarge,
                    ),
                    Obx(() => controller.isLoadingTypesMark.value
                        ? HelpersComponents.getLoadingAnimation()
                        : const Expanded(child: DataTableMarkingType())),
                  ],
                )
              : Stack(
                children: [
                  ListView(
                      children: [
                        const HeadMarkingType(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        const BodyMarkingType(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoadingTypesMark.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableMarkingType())),
                      ],
                    ),
                ],
              );
        });
  }
}
