import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static const TextStyle whiteBold20 = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle whiteBold14 = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle whiteBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle goldBold20 = TextStyle(
    fontSize: 20,
    color: AppColors.gold,
    fontWeight: FontWeight.bold,
  ); static const TextStyle goldBold24 = TextStyle(
    fontSize: 24,
    color: AppColors.gold,
    fontWeight: FontWeight.bold,
  ); static const TextStyle goldBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.gold,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightBlackBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightBlackBold14 = TextStyle(
    fontSize: 14,
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightBlackBold24 = TextStyle(
    fontSize: 24,
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
  );
}