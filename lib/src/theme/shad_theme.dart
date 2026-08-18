import 'package:flutter/material.dart';

@immutable
class ShadColors extends ThemeExtension<ShadColors> {
  const ShadColors({
    required this.background,
    required this.foreground,
    required this.card,
    required this.muted,
    required this.mutedForeground,
    required this.border,
    required this.primary,
    required this.primaryForeground,
    required this.destructive,
  });

  final Color background;
  final Color foreground;
  final Color card;
  final Color muted;
  final Color mutedForeground;
  final Color border;
  final Color primary;
  final Color primaryForeground;
  final Color destructive;

  static const light = ShadColors(
    background: Color(0xFFFFFFFF), foreground: Color(0xFF09090B),
    card: Color(0xFFFFFFFF), muted: Color(0xFFF4F4F5),
    mutedForeground: Color(0xFF71717A), border: Color(0xFFE4E4E7),
    primary: Color(0xFF18181B), primaryForeground: Color(0xFFFAFAFA),
    destructive: Color(0xFFDC2626),
  );

  static const dark = ShadColors(
    background: Color(0xFF09090B), foreground: Color(0xFFFAFAFA),
    card: Color(0xFF09090B), muted: Color(0xFF27272A),
    mutedForeground: Color(0xFFA1A1AA), border: Color(0xFF27272A),
    primary: Color(0xFFFAFAFA), primaryForeground: Color(0xFF18181B),
    destructive: Color(0xFFEF4444),
  );

  @override
  ShadColors copyWith({Color? background, Color? foreground, Color? card,
      Color? muted, Color? mutedForeground, Color? border, Color? primary,
      Color? primaryForeground, Color? destructive}) => ShadColors(
    background: background ?? this.background, foreground: foreground ?? this.foreground,
    card: card ?? this.card, muted: muted ?? this.muted,
    mutedForeground: mutedForeground ?? this.mutedForeground, border: border ?? this.border,
    primary: primary ?? this.primary, primaryForeground: primaryForeground ?? this.primaryForeground,
    destructive: destructive ?? this.destructive,
  );

  @override
  ShadColors lerp(covariant ShadColors? other, double t) {
    if (other == null) return this;
    return ShadColors(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      card: Color.lerp(card, other.card, t)!, muted: Color.lerp(muted, other.muted, t)!,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t)!,
      border: Color.lerp(border, other.border, t)!, primary: Color.lerp(primary, other.primary, t)!,
      primaryForeground: Color.lerp(primaryForeground, other.primaryForeground, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
    );
  }
}

extension ShadContext on BuildContext {
  ShadColors get shadColors => Theme.of(this).extension<ShadColors>() ?? ShadColors.light;
}

abstract final class ShadTheme {
  static ThemeData light() => _theme(Brightness.light, ShadColors.light);
  static ThemeData dark() => _theme(Brightness.dark, ShadColors.dark);

  static ThemeData _theme(Brightness brightness, ShadColors colors) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme.fromSeed(seedColor: colors.primary, brightness: brightness,
        surface: colors.background, error: colors.destructive),
      textTheme: base.textTheme.apply(bodyColor: colors.foreground, displayColor: colors.foreground),
      dividerColor: colors.border,
      splashFactory: InkSparkle.splashFactory,
      extensions: [colors],
    );
  }
}
