import 'package:animate_do/animate_do.dart';
import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/widgets/nav_bar.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class BodyLayout extends GetView<LayoutController> {
  const BodyLayout({
    Key? key,
    this.marginLayout,
  }) : super(key: key);
  final EdgeInsetsGeometry? marginLayout;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(builder: (controller) {
      return Stack(
        children: [
          Column(
            children: [
              const NavBar(),
              Expanded(
                child: Container(
                  color: AppColors.primaryBackground,
                  margin: marginLayout ??
                      const EdgeInsets.only(
                        top: kMarginMediunApp,
                        left: kMarginLargeApp,
                        right: kMarginLargeApp,
                      ),
                  child: Obx(() {
                    html.window.history.pushState(
                        null, '', RouteDataTemporary.currentRoute.value);
                    return controller.setScreen();
                  }),
                ),
              ),
            ],
          ),
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? Obx(() => Visibility(
                    visible: controller.isShowDownAvatar.value,
                    child: Positioned(
                      top: 75,
                      right: 20,
                      child: FlipInY(
                        animate: true,
                        duration: const Duration(milliseconds: 100),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: kPaddingAppNormalApp,
                              bottom: kPaddingAppNormalApp,
                              left: kPaddingAppNormalApp,
                              right: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRadiusSmall),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0,
                                    3), // Cambia la posición de la sombra según tus necesidades
                              ),
                            ],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(() => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.nameUser.value,
                                          textScaleFactor: 1,
                                          style: AppTextStyle(context).bold14(
                                            color: AppColors.blueDark,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: kSizeLittle,
                                        ),
                                        Text(
                                          controller.nameRolUser.value,
                                          /* "Gerente", */
                                          textScaleFactor: 1,
                                          style:
                                              AppTextStyle(context).semibold16(
                                            color: AppColors.blueDark,
                                          ),
                                        )
                                      ],
                                    )),
                              ]),
                        ),
                      ),
                    ),
                  ))
              : const SizedBox()
        ],
      );
    });
  }
}
