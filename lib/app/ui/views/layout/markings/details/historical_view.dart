import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/appbar_user.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/data_table_users.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoricalView extends StatelessWidget {
  const HistoricalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Column(
                  children: [
                    const AppBarHistorical(),
                    SizedBox(height: kMarginLargeApp.h),
                    Obx(() => controller.isLoadingUser.value
                        ? HelpersComponents.getLoadingAnimation()
                        :const Expanded(
                            child: DataTableHistorical(),
                          ))
                  ],
                )
              : ListView(
                  children: [
                    const AppBarHistorical(),
                    SizedBox(height: kMarginLargeApp.h),
                    Obx(() => controller.isLoadingUser.value
                        ? HelpersComponents.getLoadingAnimation()
                        : SizedBox(
                          height: (controller.usersList.length + 2.5) * 48 +
                                      30,
                            child:const DataTableHistorical(),
                          ))
                  ],
                );
        });
  }
}
