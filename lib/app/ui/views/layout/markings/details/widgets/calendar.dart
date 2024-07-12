import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/widgets/ctn_calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: (controller) => SizedBox(
        /* margin: EdgeInsets.symmetric(horizontal: kMarginNormalApp.w), */
        height: kSizeNormalAmple.h,
        /*  width: 350, */
        child: const Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CtnCalendar(),
          ],
        ),
      ),
    );
  }
}
