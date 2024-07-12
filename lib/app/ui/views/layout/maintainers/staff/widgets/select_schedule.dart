import 'package:app_valtx_asistencia/app/ui/components/button/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/staff_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/widgets/data_table_schedule.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/maintainers/staff/widgets/date_to_assignedschedule.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSchedule extends StatelessWidget {
  const SelectSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
        init: StaffController(),
        builder: (controller) {
          final keyForm = GlobalKey<FormState>();

          /* 📌 Botón de modificar */
          Widget btnModificar = Expanded(
            child: BtnPrimary(
              text: "Modificar",
              onTap: () {
                Get.back();
                HelpersComponents.getModal(
                    context, const DateToAssignedSchedule());
              },
            ),
          );

          /* 📌 Botón de cerrar */
          Widget cancel = BtnCancel(
            text: "Cerrar",
            onTap: () {
              Get.back();
            },
          );

          return SizedBox(
            width: 1000,
            child: Column(
              children: [
                Text(
                  "Elegir Horario",
                  style:
                      AppTextStyle(context).bold24(color: AppColors.blueDark),
                ),
                const SizedBox(
                  height: kSizeNormalMediun,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Trabajador: ",
                      style: AppTextStyle(context)
                          .bold18(color: AppColors.blueDark),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.namesEmployee.value,
                            style: AppTextStyle(context)
                                .bold18(color: AppColors.grayBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kSizeSmallLittle,
                ),
                const Expanded(child: DataTableSchedule()),
                const SizedBox(
                  height: kSizeBigLittle,
                ),
                (Responsive.isDesktop(context) || Responsive.isTablet(context))
                    ? Row(
                        children: [
                          const Expanded(flex: 10, child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(child: cancel),
                                const SizedBox(width: kSizeBigLittle),
                                btnModificar,
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          const Expanded(flex: 3, child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(child: cancel),
                                const SizedBox(width: kSizeBigLittle),
                                btnModificar,
                              ],
                            ),
                          ),
                        ],
                      )
              ],
            ),
          );
        });
  }
}
