/* import 'package:efe_agencia_visitas/app/data/temporary/models_temporary.dart';
import 'package:efe_agencia_visitas/core/theme/app_colors.dart';
import 'package:efe_agencia_visitas/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ItemSelectPaginator extends StatelessWidget {
  const ItemSelectPaginator({Key? key, required this.item, this.onTap})
      : super(key: key);
  final PaginatorItem item;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 21.0,
          decoration: BoxDecoration(
              color: item.isActive! ? AppColors.primaryBlue : Colors.white,
              border: Border.all(
                  color: item.isActive!
                      ? AppColors.primaryBlue
                      : AppColors.grayLight)),
          child: Center(
            child: Text(
              item.name ?? "",
              style: AppTextStyle(context).semi32(
                  color: item.isActive! ? Colors.white : AppColors.primaryBlue,
                  size: 12.0),
            ),
          ),
        ),
      ),
    );
  }
}
 */