import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/users_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/widgets/appBar_user.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/users/widgets/data_table_users.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: UsersController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        const AppBarUsers(),
                        SizedBox(height: kMarginLargeApp.h),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : const Expanded(child: DataTableUsers())),
                        SizedBox(height: kMarginLargeApp.h),
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
                        const AppBarUsers(),
                        SizedBox(height: kMarginLargeApp.h),
                        Obx(() => controller.isLoading.value
                            ? HelpersComponents.getLoadingAnimation()
                            : SizedBox(
                                height:
                                    (controller.usersList.length + 2.5) * 48 +
                                        30,
                                child: const DataTableUsers())),
                        SizedBox(height: kMarginLargeApp.h),
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
