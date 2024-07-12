import 'dart:ui';
import 'package:app_valtx_asistencia/app/ui/components/alerts/alert_register_good.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/widgets/map_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/widgets/user_information.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/widgets/list_type_mark.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordattendanceView extends StatelessWidget {
  const RecordattendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordattendanceController>(
      init: RecordattendanceController(),
      builder: (controller) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 241, 250),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                /* padding: EdgeInsets.only(top: 30, left: 30), */

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MapView(),
              ),
              Center(
                child: Column(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: kSizeLittle.h,
                    )),
                    //Asistencias de la semana
                    /* const ContentWeekHome(), */
                    SizedBox(height: 12.h),
                    //Información del usuario
                    const UserInformation(),
                    SizedBox(height: 12.h),
                    /* DashedLine(
                      dashWidth: 5.0,
                      dashGap: 5.0,
                      color: AppColors.grayBlue,
                      width: 400,
                      height: 1.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: kMarginMediunApp.w),
                    ), */
                    //Información del mes
                    /* const BottomHome(), */
                    //Para marcar asistencia
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kMarginMediunApp.w),
                        child: BtnPrimaryInk(
                          text: controller.isLoading.value
                              ? "Registrando..."
                              : "Marcar",
                          loading: controller.isLoading.value,
                          onTap: () async {
                            /* -helpers.showTypesMarkingDialog(context, controller); */
                            Helpers.getShowModalBS(context,
                                title: 'Seleccionar tipo de marcación',
                                content: const ListTypeMark());
                            await controller.getCurrentLocation(false);
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: kSizeNormalLittle.h,
                    ),
                  ],
                ),
              ),
              Obx(() {
                return controller.statusAssistance.value
                    ? Positioned(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                            child:
                                Container(color: Colors.black.withOpacity(0.0)),
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              }),
              Obx(() => controller.statusAssistance.value
                  ? const AlertRegisterGood()
                  : const SizedBox()),
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    )
                  : Positioned(
                      top: 0,
                      left: 15.0,
                      child: Align(
                        widthFactor: 0,
                        alignment: Alignment.topLeft,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
            ],
          )),
    );
  }
}
