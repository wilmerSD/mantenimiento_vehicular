import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BtnSecundary extends StatelessWidget {
  const BtnSecundary(
      {Key? key,
      required this.text,
      this.loading = false,
      this.isMaxHeight = false,
      this.onTap,
      required this.color})
      : super(key: key);
  final String text;
  final bool loading;
  final void Function()? onTap;
  final bool? isMaxHeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMaxHeight! ? 50.0 : 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(isMaxHeight! ? 14.0 : 10.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(0, 0, 0, 0.08),
          borderRadius: BorderRadius.circular(isMaxHeight! ? 14.0 : 10.5),
          onTap: onTap,
          child: Center(
            child: Text(text,
                style: AppTextStyle(context).bold24(
                    /* size: isMaxHeight! ? 18.4 : 12.8 */)),
          ),
        ),
      ),
    );
  }
}
