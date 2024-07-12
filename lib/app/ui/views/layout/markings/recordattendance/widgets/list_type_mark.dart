import 'package:app_valtx_asistencia/app/ui/views/layout/markings/recordattendance/recordattendance_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTypeMark extends StatelessWidget {
  const ListTypeMark({
    Key? key,
  }) : super(key: key);
  /* void showSecondDialog (
      BuildContext context, RecordattendanceController controller, int selectedValue){
        print("15");
         
         print("18");
    controller.assistMarker(selectedValue);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Obx(() => controller.showModalJustification.value
            ? const SizedBox()
            : controller.statusAssistance.value
                ? const AlertRegisterGood()
                : const AlertRegisterBad()
            );
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordattendanceController>(
      init: RecordattendanceController(),
      builder: (controller) => Theme(
        data: ThemeData(
          dialogBackgroundColor: AppColors.backgroundColor,
        ),
        child: Obx( () =>
              controller.isLoadingMarks.value
              ? const Center(child: CircularProgressIndicator())
              : controller.responseTypesMarking.isEmpty
                  ? Center(
                      child: Text('${controller.statusMessageTypesMarking}'),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: controller.responseTypesMarking.map(
                        (type) {
                          return ListTile(
                            title: Text(
                              type.description,
                              style: AppTextStyle(context).medium14(
                                color: AppColors.grayBlue,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context, type.idTypesMarking);
                              controller.selectedValue = type.idTypesMarking;
                              controller.descriptionTypeMark = type.description;
                              controller.assistMarker(type.idTypesMarking);
                            },
                          );
                        },
                      ).toList(),
                    ),
        ),
      ),
    );
  }
}
