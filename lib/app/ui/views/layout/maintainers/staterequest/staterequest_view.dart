import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/staterequest_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/widgets/body_staterequest.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staterequest/widgets/data_table_staterequest.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateRequestView extends StatelessWidget {
  const StateRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StateRequestController>(
        init: StateRequestController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: BtnPrimary(
                                  text: "Nuevo Vehículo",
                                  onTap: () {
                                   RouteDataTemporary.currentRoute
                                  .value = AppRoutesName.HOME;
                                  })),
                          const Expanded(flex: 6, child: SizedBox()),
                        ],
                      ),
                      const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        const BodyStateRequest(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableStateRequest())),
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
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: BtnPrimary(
                                  text: "Nuevo Vehículo",
                                  onTap: () {
                                   RouteDataTemporary.currentRoute
                                  .value = AppRoutesName.HOME;
                                  })),
                          const Expanded(flex: 5, child: SizedBox()),
                        ],
                      ),
                      const SizedBox(
                          height: kSizeNormalMediun,
                        ),
                        const BodyStateRequest(),
                        const SizedBox(
                          height: kSizeNormalLarge,
                        ),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : SizedBox(
                              height:
                                (controller.stateList.length + 2.5) * 48 + 30,
                              child:const DataTableStateRequest())),
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
