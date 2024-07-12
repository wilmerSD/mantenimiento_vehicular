import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';
import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/responsive.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context) || Responsive.isTablet(context)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Opps...",
                style: AppTextStyle(context)
                    .mid20(color: AppColors.grayDarkPlus, size: 38.0),
              ),
              const SizedBox(
                child: Image(
                  image: AssetImage("assets/img/error404.png"),
                  width: 520.0,
                  height: 350.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                message,
                style: AppTextStyle(context).mid20(),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 150.0,
                child: BtnPrimary(
                  text: "Ir a inicio",
                  onTap: () {
                    RouteDataTemporary.currentRoute.value = AppRoutesName.HOME;
                  },
                ),
              )
            ],
          )
        : ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Opps...",
                    style: AppTextStyle(context)
                        .mid20(color: AppColors.grayDarkPlus, size: 38.0),
                  ),
                  const SizedBox(
                    child: Image(
                      image: AssetImage("assets/img/error404.png"),
                      width: 520.0,
                      height: 350.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    message,
                    style: AppTextStyle(context).mid20(),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 150.0,
                    child: BtnPrimary(
                      text: "Ir a inicio",
                      onTap: () {
                        RouteDataTemporary.currentRoute.value = AppRoutesName.HOME;
                      },
                    ),
                  )
                ],
              ),
          ],
        );
  }
}
