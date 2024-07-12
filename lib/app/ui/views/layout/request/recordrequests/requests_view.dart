import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/appBar_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/body_permission_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/body_vacation_request.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestView extends StatelessWidget {
  const RequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) {
          /* 📌 Boton de solicitud de permiso creado por lider */

          return Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          const AppBarRequest(),
                          SizedBox(height: kSizeExtraMediun.h),
                          /* Container(color: Colors.red, height: kSizeExtraMediun , width: double.infinity,), */

                          /* 📌 Cuando no se selecciona nada aun */
                          controller.currentRequest.value == -1
                              ? const SizedBox()
                              /* 📌 Cuando se selecciona justificacion */
                              :
                              /* 📌 Cuando se selecciona permisos */
                              controller.currentRequest.value == 2
                                  ? const BodyPermissionRequest()
                                  /* 📌 Cuando se selecciona vacaciones */
                                  : controller.currentRequest.value == 3
                                      ? const BodyVacationRequest()
                                      : const SizedBox.shrink()
                        ],
                      ),
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
                    )
                  ],
                )
              : Stack(
                  children: [
                    Obx(
                      () => ListView(
                        children: [
                          const AppBarRequest(),
                          SizedBox(height: kMarginBigApp.h),

                          /* 📌 Cuando no se selecciona nada aun */
                          controller.currentRequest.value == -1
                              ? const SizedBox()
                              /* 📌 Cuando se selecciona justificacion */
                              : 
                              /* 📌 Cuando se selecciona permisos */
                              controller.currentRequest.value == 2
                                  ? const BodyPermissionRequest()
                                  /* 📌 Cuando se selecciona vacaciones */
                                  : controller.currentRequest.value == 3
                                      ? const BodyVacationRequest()
                                      : const SizedBox.shrink()
                        ],
                      ),
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
                    )
                  ],
                );
        });
  }
}
