import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/requests_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/appBar_select_user_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/body_permission_special_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/bottom_select_user_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/request/recordrequests/widgets/data_table_users_request.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyToPermission extends StatelessWidget {
  const BodyToPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (controller) => Obx(
              () {
                return controller.requestSpecial.value
                    ? const SizedBox(
                        width: 700,
                        height: 600,
                        child: BodyPermissionSpecialRequest())
                    : SizedBox(
                        width: minWidthNormalTable,
                        child: Column(children: [
                          const AppBarSelectUserRequest(),
                          SizedBox(height: kMarginLargeApp.h),
                          const Expanded(child: DataTableUsersRequest()),
                          SizedBox(height: kMarginLargeApp.h),
                          const BottomSelectUserRequest(),
                        ]),
                      );
              },
            ));
  }
}
