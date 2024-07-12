import 'package:app_valtx_asistencia/app/models/response/menu/response_menu_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/components/menu/menu_option.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
    this.isCollapsed = false,
    this.onTapCollapsed,
    required this.onTapMenu,
  }) : super(key: key);

  final bool isCollapsed;
  final Function()? onTapCollapsed;
  final Function(String idMenu) onTapMenu;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) => Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        // elevation: 2.0,
        backgroundColor: AppColors.primary,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primary,
              child: GestureDetector(
                onTap: onTapCollapsed,
                child: DrawerHeader(
                    /* decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.pink),
                      ),
                    ), */
                    child: isCollapsed
                        ? /* HelpersComponents.pathAssetIcons("menu.png",
                            const Color.fromARGB(255, 248, 253, 247)) */
                        const Icon(Iconsax.menu_14,
                            color: AppColors.backgroundColor, size: 20)
                        : Row(children: [
                            Expanded(
                              child: Container(
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    /*  scale: 0.2, */
                                    image: AssetImage("assets/img/valtx.png"),
                                    /* fit: BoxFit.scaleDown, */
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 60.0),
                                  /* child: Row(
                                        children: [
                                          HelpersComponents.pathAssetIcons(
                                              "menu.png",
                                              Color.fromARGB(255, 44, 199, 95))
                                        ],
                                      ), */
                                ),
                              ),
                            ),
                          ])),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.options.length + 1,
                  itemBuilder: (_, index) {
                    if (index == controller.options.length) {
                      return Stack(
                        children: [
                          /* Align(
                            alignment: Alignment.bottomCenter,
                            child: MenuOption(
                                onTapSubMenu: (route) {},
                                item: ResponseMenuOptionsModel(
                                  isChild: false,
                                  isDesplegated: false,
                                  route: "/login",
                                  nameOption: "Cerrar Sesión",
                                  isDesplegable: false,
                                  isActive: false,
                                  onTap: () {},
                                  iconOption: /* HelpersComponents.pathAssetIcons(
                                        "login.png",
                                        AppColors.primaryBackground) */
                                      const Icon(Iconsax.logout,
                                          color: AppColors.backgroundColor,
                                          size: 20),
                                ),
                                isCollapsed: isCollapsed,
                                onTapMenu: () {
                                  Get.dialog(AlertDialogComponent(
                                      headerTitle: "Cerrar sesión",
                                      /* content:
                                          "¿Quieres salir del sistema de marcaciones?", */
                                      title:
                                          "¿Quieres salir del ${ktittleSistem}?",
                                      onTapButton: () async {
                                        await controller.loginout();
                                      },
                                      textPrimaryButton: "SÍ",
                                      textSecondaryButton: "No",
                                      onTapButtonSecondary: () {
                                        Get.back();
                                      }));
                                }),
                          ), */
                        ],
                      );
                    } else {
                      return MenuOption(
                        item: controller.options[index],
                        isCollapsed: isCollapsed,
                        onTapMenu: () {
                          if (controller.options[index].isDesplegable!) {
                            if (isCollapsed) {
                              onTapCollapsed!();
                            }
                            controller.setDesplegated(
                                controller.options[index].route ?? "");
                          } else {
                            controller.setActive(
                                controller.options[index].route ?? "");
                          }
                        },
                        onTapSubMenu: (route) {},
                      );
                    }
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MenuOption(
                  onTapSubMenu: (route) {},
                  item: ResponseMenuOptionsModel(
                    isChild: false,
                    isDesplegated: false,
                    route: "/login",
                    nameOption: "Cerrar Sesión",
                    isDesplegable: false,
                    isActive: false,
                    onTap: () {},
                    iconOption: /* HelpersComponents.pathAssetIcons(
                                        "login.png",
                                        AppColors.primaryBackground) */
                        const Icon(Iconsax.logout,
                            color: AppColors.backgroundColor, size: 20),
                  ),
                  isCollapsed: isCollapsed,
                  onTapMenu: () {
                    Get.dialog(AlertDialogComponent(
                        headerTitle: "Cerrar sesión",
                        /* content:
                                          "¿Quieres salir del sistema de marcaciones?", */
                        title: "¿Quieres salir del ${ktittleSistem}?",
                        onTapButton: () async {
                          await controller.loginout();
                        },
                        textPrimaryButton: "SÍ",
                        textSecondaryButton: "No",
                        onTapButtonSecondary: () {
                          Get.back();
                        }));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
