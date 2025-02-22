import 'package:app_valtx_asistencia/app/models/response/menu/response_menu_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/helpers_components.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuOption extends StatelessWidget {
  const MenuOption(
      {Key? key,
      required this.item,
      required this.isCollapsed,
      required this.onTapMenu,
      required this.onTapSubMenu})
      : super(key: key);
  final ResponseMenuOptionsModel item;
  final bool isCollapsed;
  final void Function() onTapMenu;
  final void Function(String route) onTapSubMenu;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => Column(
              children: [
                Material(
                  color: AppColors.primary,
                  child: InkWell(
                    onTap: item.isChild!
                        ? () {
                            controller.setActive(item.route!);
                          }
                        : onTapMenu,
                    child: Container(
                      color:
                          item.isChild! ? AppColors.primary : AppColors.primary,
                      padding: const EdgeInsets.only(
                          top: 12.0, bottom: 12.0, left: 15.0, right: 0.0),
                      child: isCollapsed
                          ? Row(children: [
                              /* const Spacer(), */
                              Center(
                                child: item.iconOption,
                                // color: item.isChild ?? false
                                //     ? Colors.transparent
                                //     : AppColors.grayMiddle,
                                // size: 18.0,
                              ),
                              /* const Spacer(), */
                              const SizedBox(
                                width: 10.0,
                              ),
                              item.isDesplegable!
                                  ? const SizedBox()
                                  : item.isActive!
                                      ? Container(
                                          height: 23.0,
                                          width: 6.0,
                                          decoration: BoxDecoration(
                                              gradient:
                                                  AppColors.primaryGradientLoading,
                                              borderRadius:
                                                  BorderRadius.circular(3.0)),
                                        )
                                      : const SizedBox(
                                          width: 6.0,
                                        )
                            ])
                          : Row(children: [
                              SizedBox(
                                child: item.iconOption,
                                // color: item.isChild ?? false
                                //     : AppColors.grayMiddle,
                                // size: 18.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                  child: Text(
                                item.nameOption ?? "",
                                style: AppTextStyle(context).regular14(
                                  color: item.isChild!
                                      ? AppColors.grayMiddle
                                      : Colors.white,
                                ),
                              )),
                              item.isDesplegable!
                                  ? GestureDetector(
                                      onTap: item.isChild!
                                      ? () {
                                          controller.setActive(item.route!);
                                        }
                                      : onTapMenu,
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          child: item.isDesplegated ?? false
                                              ? HelpersComponents
                                                  .pathAssetIcons(
                                                      "arrow-up.png",
                                                      AppColors
                                                          .primaryBackground)
                                              : HelpersComponents
                                                  .pathAssetIcons(
                                                      "arrow-down.png",
                                                      AppColors
                                                          .primaryBackground)),
                                    )
                                  : item.isActive!
                                      ? Container(
                                          height: 23.0,
                                          width: 6.0,
                                          decoration: BoxDecoration(
                                              gradient:
                                                  AppColors.primaryGradientLoading,
                                              borderRadius:
                                                  BorderRadius.circular(3.0)),
                                        )
                                      : const SizedBox()
                            ]),
                    ),
                  ),
                ),
                item.isDesplegated ?? false
                    ? SizedBox(
                        // child: Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: item.child!.length,
                            itemBuilder: (context, index) => MenuOption(
                                  item: item.child![index],
                                  isCollapsed: isCollapsed,
                                  onTapMenu: onTapMenu,
                                  onTapSubMenu: (route) {},
                                )),
                        // ),
                      )
                    : const SizedBox()
              ],
            ));
  }
}
