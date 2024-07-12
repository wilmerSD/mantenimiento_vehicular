import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NewCheckbox extends StatelessWidget {
  const NewCheckbox(
      {Key? key, this.bordecolor, required this.value, required this.onChanged})
      : super(key: key);
  final Color? bordecolor;
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: AppColors.secundaryColor,
        side: BorderSide(color: bordecolor ?? AppColors.black, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        value: value,
        onChanged: onChanged);
  }
}
