// ignore_for_file: dead_code

import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle titleAppBar({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

  TextStyle bold26({Color color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 26,
          fontFamily: 'Montserrat');

  TextStyle bold24({Color color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: 'Montserrat');

  TextStyle bold16({Color? color = AppColors.grayDark}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          fontFamily: 'Montserrat');
  //-----------------------------

  TextStyle normal12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: color, fontSize: 12.0, fontFamily: 'Montserrat');

  TextStyle semi12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
          fontFamily: 'Montserrat');

  TextStyle semi16({Color color = AppColors.grayLight}) =>
      Theme.of(context).textTheme.subtitle1!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          fontFamily: 'Montserrat');

  TextStyle bold14({Color? color = AppColors.grayDark}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: 'Montserrat');

  TextStyle bold18({
    Color? color = Colors.black,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          fontFamily: 'Montserrat');

  TextStyle semi14({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: 'Montserrat');

  TextStyle medium14({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: 'Montserrat');

  TextStyle medium12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: 'Montserrat');

  TextStyle extra20({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Montserrat');

  TextStyle extra22({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 22.0,
          );

  TextStyle extra14({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          );

  TextStyle extra16({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'Montserrat');

  TextStyle extra40({
    Color? color = AppColors.backgroundColor,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 40,
            fontFamily: 'Montserrat',
          );
  TextStyle mid20({Color? color = AppColors.grayMiddle, double size = 14}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color, fontWeight: FontWeight.normal, fontSize: size);

  TextStyle regular14(
          {Color? color = AppColors.grayDarkPlus, double size = 14}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color, fontWeight: FontWeight.normal, fontSize: size);

  TextStyle bold32(
          {Color? color = AppColors.grayDarkPlus, double size = 25.4}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w600, fontSize: size);

  TextStyle bold40(
          {Color? color = AppColors.grayDarkPlus, double size = 40.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w600, fontSize: size);

  TextStyle semi32(
          {Color? color = Colors.white,
          double size = 22.4,
          FontWeight? fontWeight = FontWeight.w500}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: fontWeight, fontSize: size);

  TextStyle semibold32({
    Color? color = Colors.black,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 32,
          fontFamily: 'Montserrat');

  TextStyle semibold24({
    Color? color = Colors.black,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 24,
          fontFamily: 'Montserrat');

  TextStyle regular10(
          {Color? color = AppColors.grayDarkPlus, double size = 10}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color, fontWeight: FontWeight.normal, fontSize: size);

  TextStyle bold42({Color color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 42,
          fontFamily: 'Montserrat');

  TextStyle semibold16({
    Color? color = Colors.black,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Montserrat');
}
