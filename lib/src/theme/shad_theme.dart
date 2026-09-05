import 'package:flutter/material.dart';

enum AppStyle { vega, nova, maia, lyra, mira, luma, rhea, sera }

enum AppColorScheme { neutral }

@immutable
class ShadStyle extends ThemeExtension<ShadStyle> {
  const ShadStyle({
    required this.name,
    required this.radius,
    required this.controlHeight,
    required this.spacing,
    required this.fontSize,
    required this.elevation,
    required this.borderWidth,
    required this.letterSpacing,
    required this.underlined,
  });

  final AppStyle name;
  final double radius;
  final double controlHeight;
  final double spacing;
  final double fontSize;
  final double elevation;
  final double borderWidth;
  final double letterSpacing;
  final bool underlined;

  static const vega = ShadStyle(
    name: AppStyle.vega,
    radius: 8,
    controlHeight: 40,
    spacing: 12,
    fontSize: 14,
    elevation: 0,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const nova = ShadStyle(
    name: AppStyle.nova,
    radius: 6,
    controlHeight: 36,
    spacing: 8,
    fontSize: 14,
    elevation: 0,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const maia = ShadStyle(
    name: AppStyle.maia,
    radius: 16,
    controlHeight: 48,
    spacing: 16,
    fontSize: 15,
    elevation: 1,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const lyra = ShadStyle(
    name: AppStyle.lyra,
    radius: 0,
    controlHeight: 40,
    spacing: 12,
    fontSize: 14,
    elevation: 0,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const mira = ShadStyle(
    name: AppStyle.mira,
    radius: 4,
    controlHeight: 32,
    spacing: 6,
    fontSize: 13,
    elevation: 0,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const luma = ShadStyle(
    name: AppStyle.luma,
    radius: 18,
    controlHeight: 44,
    spacing: 16,
    fontSize: 15,
    elevation: 2,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const rhea = ShadStyle(
    name: AppStyle.rhea,
    radius: 14,
    controlHeight: 40,
    spacing: 10,
    fontSize: 14,
    elevation: 1,
    borderWidth: 1,
    letterSpacing: 0,
    underlined: false,
  );
  static const sera = ShadStyle(
    name: AppStyle.sera,
    radius: 0,
    controlHeight: 40,
    spacing: 16,
    fontSize: 16,
    elevation: 0,
    borderWidth: 0,
    letterSpacing: 0.1,
    underlined: true,
  );

  static ShadStyle forStyle(AppStyle style) => switch (style) {
    AppStyle.vega => vega,
    AppStyle.nova => nova,
    AppStyle.maia => maia,
    AppStyle.lyra => lyra,
    AppStyle.mira => mira,
    AppStyle.luma => luma,
    AppStyle.rhea => rhea,
    AppStyle.sera => sera,
  };

  @override
  ShadStyle copyWith({
    AppStyle? name,
    double? radius,
    double? controlHeight,
    double? spacing,
    double? fontSize,
    double? elevation,
    double? borderWidth,
    double? letterSpacing,
    bool? underlined,
  }) => ShadStyle(
    name: name ?? this.name,
    radius: radius ?? this.radius,
    controlHeight: controlHeight ?? this.controlHeight,
    spacing: spacing ?? this.spacing,
    fontSize: fontSize ?? this.fontSize,
    elevation: elevation ?? this.elevation,
    borderWidth: borderWidth ?? this.borderWidth,
    letterSpacing: letterSpacing ?? this.letterSpacing,
    underlined: underlined ?? this.underlined,
  );

  @override
  ShadStyle lerp(covariant ShadStyle? other, double t) {
    if (other == null) return this;
    return ShadStyle(
      name: t < .5 ? name : other.name,
      radius: lerpDouble(radius, other.radius, t),
      controlHeight: lerpDouble(controlHeight, other.controlHeight, t),
      spacing: lerpDouble(spacing, other.spacing, t),
      fontSize: lerpDouble(fontSize, other.fontSize, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t),
      letterSpacing: lerpDouble(letterSpacing, other.letterSpacing, t),
      underlined: t < .5 ? underlined : other.underlined,
    );
  }
}

double lerpDouble(double a, double b, double t) => a + (b - a) * t;

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
    background: Color(0xFFFFFFFF),
    foreground: Color(0xFF09090B),
    card: Color(0xFFFFFFFF),
    muted: Color(0xFFF4F4F5),
    mutedForeground: Color(0xFF71717A),
    border: Color(0xFFE4E4E7),
    primary: Color(0xFF18181B),
    primaryForeground: Color(0xFFFAFAFA),
    destructive: Color(0xFFDC2626),
  );

  static const dark = ShadColors(
    background: Color(0xFF09090B),
    foreground: Color(0xFFFAFAFA),
    card: Color(0xFF09090B),
    muted: Color(0xFF27272A),
    mutedForeground: Color(0xFFA1A1AA),
    border: Color(0xFF27272A),
    primary: Color(0xFFFAFAFA),
    primaryForeground: Color(0xFF18181B),
    destructive: Color(0xFFEF4444),
  );

  static ShadColors forScheme(AppColorScheme scheme, Brightness brightness) =>
      switch ((scheme, brightness)) {
        (AppColorScheme.neutral, Brightness.light) => light,
        (AppColorScheme.neutral, Brightness.dark) => dark,
      };

  @override
  ShadColors copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? muted,
    Color? mutedForeground,
    Color? border,
    Color? primary,
    Color? primaryForeground,
    Color? destructive,
  }) => ShadColors(
    background: background ?? this.background,
    foreground: foreground ?? this.foreground,
    card: card ?? this.card,
    muted: muted ?? this.muted,
    mutedForeground: mutedForeground ?? this.mutedForeground,
    border: border ?? this.border,
    primary: primary ?? this.primary,
    primaryForeground: primaryForeground ?? this.primaryForeground,
    destructive: destructive ?? this.destructive,
  );

  @override
  ShadColors lerp(covariant ShadColors? other, double t) {
    if (other == null) return this;
    return ShadColors(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      card: Color.lerp(card, other.card, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t)!,
      border: Color.lerp(border, other.border, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryForeground: Color.lerp(
        primaryForeground,
        other.primaryForeground,
        t,
      )!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
    );
  }
}

extension ShadContext on BuildContext {
  ShadColors get shadColors =>
      Theme.of(this).extension<ShadColors>() ?? ShadColors.light;
  ShadStyle get shadStyle =>
      Theme.of(this).extension<ShadStyle>() ?? ShadStyle.vega;
}

abstract final class ShadTheme {
  static ThemeData light({
    AppStyle style = AppStyle.vega,
    AppColorScheme colorScheme = AppColorScheme.neutral,
  }) => _theme(
    Brightness.light,
    ShadColors.forScheme(colorScheme, Brightness.light),
    style,
  );
  static ThemeData dark({
    AppStyle style = AppStyle.vega,
    AppColorScheme colorScheme = AppColorScheme.neutral,
  }) => _theme(
    Brightness.dark,
    ShadColors.forScheme(colorScheme, Brightness.dark),
    style,
  );

  static ThemeData _theme(
    Brightness brightness,
    ShadColors colors,
    AppStyle style,
  ) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);
    final shadStyle = ShadStyle.forStyle(style);
    final materialColors =
        ColorScheme.fromSeed(
          seedColor: colors.primary,
          brightness: brightness,
          surface: colors.background,
          error: colors.destructive,
        ).copyWith(
          primary: colors.primary,
          onPrimary: colors.primaryForeground,
          secondary: colors.muted,
          onSecondary: colors.foreground,
          surface: colors.background,
          onSurface: colors.foreground,
          surfaceContainerHighest: colors.muted,
          outline: colors.border,
          error: colors.destructive,
        );
    return base.copyWith(
      scaffoldBackgroundColor: colors.background,
      colorScheme: materialColors,
      textTheme: base.textTheme.apply(
        bodyColor: colors.foreground,
        displayColor: colors.foreground,
        fontFamily: shadStyle.name == AppStyle.sera ? 'serif' : null,
      ),
      dividerColor: colors.border,
      splashFactory: InkSparkle.splashFactory,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.muted,
        circularTrackColor: colors.muted,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.primaryForeground
              : colors.mutedForeground,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.primary
              : colors.muted,
        ),
        trackOutlineColor: WidgetStatePropertyAll(colors.border),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        inactiveTrackColor: colors.muted,
        thumbColor: colors.primary,
        overlayColor: colors.primary.withValues(alpha: .12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.primary
              : Colors.transparent,
        ),
        checkColor: WidgetStatePropertyAll(colors.primaryForeground),
        side: BorderSide(color: colors.border),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(colors.primary),
      ),
      chipTheme:
          ChipThemeData(
            backgroundColor: colors.muted,
            selectedColor: colors.primary,
            disabledColor: colors.muted.withValues(alpha: .5),
            secondaryLabelStyle: TextStyle(color: colors.foreground),
            labelStyle: TextStyle(color: colors.foreground),
            side: BorderSide(color: colors.border),
          ).copyWith(
            selectedColor: colors.primary,
            secondaryLabelStyle: TextStyle(color: colors.primaryForeground),
            labelStyle: TextStyle(color: colors.foreground),
          ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: shadStyle.spacing,
          vertical: (shadStyle.controlHeight - 20) / 2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shadStyle.radius),
          borderSide: BorderSide(
            color: colors.border,
            width: shadStyle.borderWidth,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: shadStyle.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shadStyle.radius),
        ),
      ),
      extensions: [colors, shadStyle],
    );
  }
}
