import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/details_day.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/details_month.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/details_schedule.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/namesOfWorker_staff.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/types_validations.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) {
          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Container(
                  color: Colors.white,
                  width: minWidthNormalTable,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
                          children: [
                            Column(
                              children: [
                                const NamesOfWorkerStaff(),
                                const TypesValidations(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 2, child: DetailsDay()),
                                    SizedBox(
                                      width: kSizeLittle.w,
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Calendar(),
                                          DetailsSchedule()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: kSizeExtraLittle.h,
                            ),
                          ],
                        ),
                      ),
                      /* const Expanded(child: SizedBox()), */
                      const DetailslMonth(),
                    ],
                  ),
                )
              : Container(
                  color: Colors.white,
                  width: minWidthNormalTable,
                  child: ListView(
                    children: [
                      const Column(
                        children: [
                          NamesOfWorkerStaff(),
                          TypesValidations(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: Calendar()),
                            ],
                          ),
                          SizedBox(
                            height: kSizeExtraLittle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2, child: DetailsDay()),
                            ],
                          ),
                          SizedBox(
                            height: kSizeExtraLittle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: DetailsSchedule()),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kSizeExtraLittle.h,
                      ),
                      const DetailslMonth(),
                    ],
                  ),
                );
        });
  }
}
