import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/requestmanagement_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/widgets/appBar_requestmanagement.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/widgets/body_requestmanagement.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/widgets/data_table_justifications_management.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/widgets/data_table_permissions_management.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/requestmanagement/widgets/data_table_vacations_management.dart';
import 'package:flutter/material.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestManagementView extends StatelessWidget {
  const RequestManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestManagementController>(
        init: RequestManagementController(),
        builder: (controller) => Responsive.isDesktop(context) ||
                Responsive.isTablet(context)
            ? Stack(children: [
                Column(children: [
                  const AppBarRequestManagement(),
                  SizedBox(height: kMarginLargeApp.h),
                  Obx(() => controller.isLoadingGetRequest.value
                      ? HelpersComponents.getLoadingAnimation()
                      : const SizedBox(
                          height: 0.0,
                        )),
                  Obx(() => controller.showViewUponRequest.value != -1
                      ? const BodyRequestManagement()
                      : const SizedBox()),
                  SizedBox(height: kMarginLargeApp.h),
                  Expanded(
                      child: Obx(() => controller.showViewUponRequest.value == 1
                          ? DataTableJustificationsManagement()
                          : controller.showViewUponRequest.value == 2
                              ? DataTablePermissionManagement()
                              : controller.showViewUponRequest.value == 3
                                  ? DataTableVacationManagement()
                                  : const SizedBox())),
                  SizedBox(
                    height: kSizeSmallLittle.h,
                  ),
                ]),
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
              ])
            : Stack(children: [
                ListView(children: [
                  const AppBarRequestManagement(),
                  SizedBox(height: kMarginLargeApp.h),
                  Obx(() => controller.isLoadingGetRequest.value
                      ? HelpersComponents.getLoadingAnimation()
                      : const SizedBox(
                          height: 0.0,
                        )),
                  Obx(() => controller.showViewUponRequest.value != -1
                      ? const BodyRequestManagement()
                      : const SizedBox()),
                  SizedBox(height: kMarginLargeApp.h),
                  SizedBox(
                    height: (15 + 2.5) * 48 +
                                      30,
                      child: Obx(() => controller.showViewUponRequest.value == 1
                          ? const DataTableJustificationsManagement()
                          : controller.showViewUponRequest.value == 2
                              ?const DataTablePermissionManagement()
                              : controller.showViewUponRequest.value == 3
                                  ?const DataTableVacationManagement()
                                  : const SizedBox())),
                  SizedBox(
                    height: kSizeSmallLittle.h,
                  ),
                ]),
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
              ]));
  }
}
