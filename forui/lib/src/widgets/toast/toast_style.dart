import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';

import 'package:forui/forui.dart';

part 'toast_style.style.dart';

/// [FToast]'s style.
final class FToastStyle with Diagnosticable, _$FToastStyleFunctions {
  /// The decoration.
  @override
  final BoxDecoration decoration;

  /// The card content's style.
  @override
  final FCardContentStyle contentStyle;

  /// The expanding/collapsing animation duration. Defaults to 200ms.
  @override
  final Duration animationDuration;

  /// Creates a [FToastStyle].
  FToastStyle({
    required this.decoration,
    required this.contentStyle,
    this.animationDuration = const Duration(milliseconds: 150),
  });

  /// Creates a [FToastStyle] that inherits its properties.
  FToastStyle.inherit({required FColors colors, required FTypography typography, required FStyle style})
    : this(
        decoration: BoxDecoration(
          border: Border.all(color: colors.border),
          borderRadius: style.borderRadius,
          color: colors.background,
        ),
        contentStyle: FCardContentStyle(
          titleTextStyle: typography.xl2.copyWith(fontWeight: FontWeight.w600, color: colors.foreground, height: 1.5),
          subtitleTextStyle: typography.sm.copyWith(color: colors.mutedForeground),
        ),
      );
}
