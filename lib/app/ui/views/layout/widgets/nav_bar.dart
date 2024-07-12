import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/layout/layout_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// import 'package:iconsax/iconsax.dart';

class NavBar extends GetView<LayoutController> {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => Material(
              elevation: 1.0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: kPaddingAppLargeApp,
                  vertical: kMarginApp,
                ),
                child: Responsive.isDesktop(context)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [lateralMenu(context), const ProfileCard()],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  lateralMenu(context);
                                },
                                child: const MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Image(
                                      image:
                                          AssetImage("assets/icons/menu.png"),
                                      color: AppColors.grayDarkPlus,
                                    )),
                              ),
                              const SizedBox(width: 15.0),
                              Obx(() => Text(
                                    controller.setNavBarTitle(),
                                    style: AppTextStyle(context).bold32(),
                                  )),
                            ],
                          ),
                          const ProfileCard()
                        ],
                      ),
              ),
            ));
  }

  Widget lateralMenu(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      Scaffold.of(context).closeDrawer();
      return Obx(
        () => Text(
          controller.setNavBarTitle(),
          style: AppTextStyle(context).bold32(),
          textAlign: TextAlign.left,
        ),
      );
    } else {
      Scaffold.of(context).openDrawer();
      return const SizedBox();
    }
  }
}

class ProfileCard extends GetView<LayoutController> {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: kSizeNormalMediun,
        ),
        Responsive.isDesktop(context)
            ? Row(
                children: [
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            style: AppTextStyle(context).semibold16(
                              color: AppColors.blueDark,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: kSizeLittle,
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.blueDark,
                    child: Icon(Iconsax.user),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Text(
                        "${SesionDataTemporary.data["vnombres"]} ${SesionDataTemporary.data["vapepat"]}",
                        style: AppTextStyle(context)
                            .semi32(color: AppColors.grayDarkPlus, size: 17.6),
                      ),
                      Text("${SesionDataTemporary.data["vperfil"]}",
                          style: AppTextStyle(context).regular14(
                            color: AppColors.grayMiddle,
                          )), */
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  const SizedBox(
                    width: kSizeLittle,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isShowDownAvatar.value =
                          !controller.isShowDownAvatar.value;
                    },
                    child: const MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.blueDark,
                        child: Icon(Iconsax.user),
                      ),
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
