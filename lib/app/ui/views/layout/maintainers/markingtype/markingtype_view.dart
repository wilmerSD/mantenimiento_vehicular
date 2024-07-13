import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/markingtype_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/markingtype/widgets/body_markingype.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkingTypeView extends StatelessWidget {
  const MarkingTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarkingTypeController>(
        init: MarkingTypeController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    const Column(
                      children: [
                        BodyMarkingType(),
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
                    BodyMarkingType(),
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
