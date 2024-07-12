import 'package:app_valtx_asistencia/app/ui/components/menu/drawer_menu.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/body_layout.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        init: LayoutController(),
        builder: (controller) {
          return Listener(
            onPointerHover: (event) {
              controller.startTimer();
            },
            child: GestureDetector(
              onTap: () {
                controller.isShowDownAvatar.value = false;
              },
              child: Scaffold(
                /* key: GlobalKey(), */
                backgroundColor: AppColors.primaryBackground,
                drawer: DrawerMenu(
                  onTapMenu: (idMenu) {},
                ),
                body: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Muestra menu lateral solo si es web
                      if (Responsive.isDesktop(context))
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 0),
                            width: controller.isCollapsed.value ? 52.0 : 280.0,
                            child: DrawerMenu(
                              isCollapsed: controller.isCollapsed.value,
                              onTapCollapsed: () {
                                controller.collapseAll();
                                controller.isCollapsed.value =
                                    !controller.isCollapsed.value;
                              },
                              onTapMenu: (idMenu) {},
                            ),
                          ),
                        ),

                      //Contenido
                      const Expanded(
                        flex: 12,
                        child: SafeArea(
                          top: false,
                          bottom: false,
                          child: BodyLayout(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
