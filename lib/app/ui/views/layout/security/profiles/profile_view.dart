import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/body_profile.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/data_table_profile.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/head_profile.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/security/profiles/profile_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        const HeadProfile(),
                        SizedBox(height: kSizeBigLittle.h),
                        const BodyProfile(),
                        SizedBox(height: kSizeBigLittle.h),
                        const Expanded(child: DataTableProfile()),
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
                        const HeadProfile(),
                        SizedBox(height: kSizeBigLittle.h),
                        const BodyProfile(),
                        SizedBox(height: kSizeBigLittle.h),
                        const Expanded(child: DataTableProfile()),
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
