import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/typesrequest_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/widgets/body_typerequest.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/typesrequest/widgets/data_table_typerequest.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeRequestView extends StatelessWidget {
  const TypeRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypeRequestController>(
        init: TypeRequestController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        const BodyTypeRequest(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableTypeRequest())),
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
                        const BodyTypeRequest(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : SizedBox(
                                height:
                                    (controller.listTypesRequest.length + 2.5) *
                                            48 +
                                        30,
                                child: const DataTableTypeRequest())),
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
