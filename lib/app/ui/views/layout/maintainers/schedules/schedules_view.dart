import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/schedules_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/widgets/add_schedule.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/widgets/data_table_schedule.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/schedules/widgets/search_schedule.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulesController>(
        init: SchedulesController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: BtnPrimary(
                                  text: "Nuevo Horario",
                                  onTap: () {
                                    HelpersComponents.getModal(
                                        context, const AddSchedule());
                                  })),
                          const Expanded(flex: 6, child: SizedBox()),
                        ],
                      ),
                      SizedBox(height: kMarginLargeApp.h),
                      const SearchSchedule(),
                      SizedBox(height: kMarginLargeApp.h),
                      Obx(() => controller.isLoading.value
                          ? HelpersComponents.getLoadingAnimation()
                          : const Expanded(
                              child: DataTableSchedule(),
                            ))
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
                  ],
                )
              : Stack(
                  children: [
                    ListView(
                      children: [
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: BtnPrimary(
                                      text: "Nuevo Horario",
                                      onTap: () {
                                        HelpersComponents.getModal(
                                            context, const AddSchedule());
                                      })),
                              const Expanded(flex: 6, child: SizedBox()),
                            ],
                          ),
                          SizedBox(height: kMarginLargeApp.h),
                          const SearchSchedule(),
                          SizedBox(height: kMarginLargeApp.h),
                          Obx(() => controller.isLoading.value
                              ? HelpersComponents.getLoadingAnimation()
                              : SizedBox(
                                  height:
                                      (controller.scheduleList.length + 2.5) *
                                              48 +
                                          30,
                                  child: const DataTableSchedule(),
                                ))
                        ]),
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
