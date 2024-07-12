import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LeyendTable extends StatelessWidget {
  const LeyendTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getItem(AppColors.grayBlue, "Categorías"),
        const SizedBox(
          width: 15.0,
        ),
        getItem(AppColors.black, "Sub Categorías"),
        const SizedBox(
          width: 15.0,
        ),
        getItem(Colors.white, "Actividades"),
        const SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Widget getItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: AppColors.blueCustomLoading)),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: const TextStyle(color: AppColors.bluelight, fontSize: 14.0),
        )
      ],
    );
  }
}
