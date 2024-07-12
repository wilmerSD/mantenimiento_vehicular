import 'package:animate_do/animate_do.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/widgets/change_first_pass.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/widgets/form_login.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height; */
    //print('prrint:$screenHeight dddd $screenWidth');
    final _image = AssetImage('assets/reunion.jpg');
    precacheImage(_image, context);

    return GetBuilder<LoginController>(builder: (controller) {
      /* 📌 Link para cambiar contraseña  */
      Widget forgotPassword = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('¿Olvidaste tu contraseña?',
              style: TextStyle(
                  color: AppColors.grayMiddle,
                  fontWeight: FontWeight.w900,
                  fontSize: 14)),
          InkWell(
              onTap: () {
                controller.recoverPassword();
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Recuperar aquí',
                    style: TextStyle(
                        color: AppColors.blueRecoverPass,
                        fontWeight: FontWeight.w900,
                        fontSize: 14)),
              )),
        ],
      );

      return Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Scaffold(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Stack(
                      children: [
                        
                        Align(
                            alignment: Alignment.centerLeft,
                            child: FadeInLeftBig(
                              child: Container(
                                width: 800,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grayBlue.withOpacity(0.4),
                                      spreadRadius: 4,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: _image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                        Align(
                          alignment: const Alignment(1, 1),
                          child: Flex(
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.values[1],
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kMarginLargeApp),
                                      width: 550,
                                      /* width: double.infinity, */
                                      height: 500,
                                      decoration: const BoxDecoration(
                                        color: AppColors.backgroundColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(kRadiusNormal),
                                        ),
                                      ),
                                      child: Obx(
                                        () => controller
                                                .isFirstTimeSession.value
                                            ? const ChangeFirstPass()
                                            : FadeInRight(
                                              child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: kSizeNormalLittle,
                                                    ),
                                                    Text('Harkay',
                                                        style: AppTextStyle(
                                                                context)
                                                            .bold42(
                                                                color: AppColors
                                                                    .primary),
                                                        textAlign:
                                                            TextAlign.center),
                                                    const SizedBox(
                                                        width: 400,
                                                        child: FormLogin()),
                                                    SizedBox(height: 25.h),
                                                    forgotPassword,
                                                    SizedBox(height: 25.h),
                                                    Obx(
                                                      () => BtnPrimaryInk(
                                                        text: controller
                                                                .isLoading.value
                                                            ? "Verificando..."
                                                            : "Iniciar Sesión",
                                                        loading: controller
                                                            .isLoading.value,
                                                        onTap: () => controller
                                                            .goToLogin01(),
                                                                
                                                      ),
                                                    ),
                                              
                                                    /*  Expanded(child: Container()),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Stack(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.contentNotification,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: kMarginLittleApp.w,
                                                      vertical: kMarginLittleApp.h),
                                                  height: kSizeBigLittle.h,
                                                  width: kSizeBigLittle.h,
                                                  child: Image.asset('assets/whatsapp.png'),
                                                ),
                                              ],
                                                                                        ),
                                                                                        SizedBox(
                                              width: kSizeLittle.h,
                                                                                        ),
                                                                                        GestureDetector(
                                              onTap: () {
                                                /* controller.launchWhatsApp(); */
                                              },
                                              child: const Text(
                                                '¿Necesitas ayuda?',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    const Text("versión: 1.0.0 ")
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: kSizeSmallLittle.h,
                                                                                ) */
                                                  ],
                                                ),
                                            ),
                                      )),
                                  const SizedBox(
                                    width: kSizeBigLarge,
                                  )
                                ],
                              ),

                              /* ),
                    ), */
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 15.0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Obx(() => Visibility(
                          visible: controller.showToast.value,
                          child: controller.toast)),
                    ),
                  ),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 1000,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grayBlue.withOpacity(0.4),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: _image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        Align(
                          alignment: const Alignment(1, 1),
                          child: Flex(
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.values[1],
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kMarginLargeApp),
                                  width: 550,
                                  /* width: double.infinity, */
                                  height: 500,
                                  decoration: const BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(kRadiusNormal),
                                    ),
                                  ),
                                  child: Obx(
                                    () => controller.isFirstTimeSession.value
                                        ? const ChangeFirstPass()
                                        : Column(
                                            children: [
                                              const SizedBox(
                                                height: kSizeNormalLittle,
                                              ),
                                              Text('Valtx',
                                                  style: AppTextStyle(context)
                                                      .bold42(
                                                          color: AppColors
                                                              .primary),
                                                  textAlign: TextAlign.center),
                                              const SizedBox(
                                                  width: 400,
                                                  child: FormLogin()),
                                              SizedBox(height: 25.h),
                                              forgotPassword,
                                              SizedBox(height: 25.h),
                                              Obx(
                                                () => BtnPrimaryInk(
                                                  text:
                                                      controller.isLoading.value
                                                          ? "Verificando..."
                                                          : "Iniciar Sesión",
                                                  loading: controller
                                                      .isLoading.value,
                                                  onTap: () => controller
                                                      .validateForm(context),
                                                ),
                                              ),

                                              /*  Expanded(child: Container()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.contentNotification,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: kMarginLittleApp.w,
                                                vertical: kMarginLittleApp.h),
                                            height: kSizeBigLittle.h,
                                            width: kSizeBigLittle.h,
                                            child: Image.asset('assets/whatsapp.png'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: kSizeLittle.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          /* controller.launchWhatsApp(); */
                                        },
                                        child: const Text(
                                          '¿Necesitas ayuda?',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("versión: 1.0.0 ")
                                ],
                              ),
                              SizedBox(
                                height: kSizeSmallLittle.h,
                              ) */
                                            ],
                                          ),
                                  )),
                              /* ),
                    ), */
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 15.0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Obx(() => Visibility(
                          visible: controller.showToast.value,
                          child: controller.toast)),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
