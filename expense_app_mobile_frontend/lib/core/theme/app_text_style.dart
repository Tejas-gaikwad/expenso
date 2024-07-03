import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle boldText24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle boldText22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static TextStyle boldText14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle boldText12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle boldText18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyText14 = const TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyText16 = const TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyText12 = const TextStyle(
    fontSize: 12,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle formHintTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textColor,
  );
}
