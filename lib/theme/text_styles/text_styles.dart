import 'package:flutter/material.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';

abstract class TextStyles {
  static TextStyle displayLarge = const TextStyle(
    fontSize: 40,
    height: 54 / 40,
    fontWeight: FontWeight.bold,
    color: SupportColors.black,
  );

  static const displayMedium = TextStyle(
    fontSize: 32,
    height: 44 / 32,
    fontWeight: FontWeight.bold,
    color: SupportColors.black,
  );

  static const displaySmall = TextStyle(
    fontSize: 28,
    height: 38 / 28,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );

  static const headlineLarge = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );

  static const headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );

  static const headlineSmall = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.bold,
    color: SupportColors.black,
  );

  static const titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  static const labelMedium = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  static const labelSmall = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  //MD
  static const TextStyle mdRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );
  static const TextStyle mdMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );

  static const TextStyle mdSemibold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: SupportColors.black,
  );

  //XS
  static const TextStyle smRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );
  static const TextStyle smMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );
  static const TextStyle smSemibold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );
  static const TextStyle smBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: SupportColors.black,
  );

  //XS
  static const TextStyle xsRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: SupportColors.black,
  );
  static const TextStyle xsMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: SupportColors.black,
  );
  static const TextStyle xsSemibold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );

  static const TextStyle xlSemi = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: SupportColors.black,
  );
}
