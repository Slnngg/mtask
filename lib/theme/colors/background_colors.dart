import 'package:flutter/material.dart';

class BackgroundColors extends ThemeExtension<BackgroundColors> {
  final Color primary; // Blue
  final Color secondary; // White

  const BackgroundColors({
    required this.primary,
    required this.secondary,
  });

  @override
  BackgroundColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? invert,
  }) {
    return BackgroundColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  BackgroundColors lerp(ThemeExtension<BackgroundColors>? other, double t) {
    if (other is! BackgroundColors) {
      return this;
    }
    return BackgroundColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
