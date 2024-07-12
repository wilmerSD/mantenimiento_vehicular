import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaginatorButton extends StatelessWidget {
  const PaginatorButton(
      {Key? key, required this.isBack, this.onTap, required this.isActive})
      : super(key: key);
  final bool isBack;
  final void Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isBack ? "Anterior" : "Siguiente",
      child: Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? IconWrapper(
              backgroundColor: Colors.transparent,
              onTap: isActive ? onTap : null,
              radius: 20,
              child: Icon(
                isBack ? Iconsax.arrow_left_34 : Iconsax.arrow_right_2,
                color: isActive ? AppColors.blueDark : AppColors.grayBlue,
              ),
            )
          : IconWrapper(
              backgroundColor: Colors.transparent,
              onTap: isActive ? onTap : null,
              radius: 18,
              child: Icon(
                isBack ? Iconsax.arrow_left_34 : Iconsax.arrow_right_2,
                color: isActive ? AppColors.blueDark : AppColors.grayBlue,
              ),
            ),
    );
  }
}
