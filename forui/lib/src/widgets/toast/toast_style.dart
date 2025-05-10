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

  /// The expanding/collapsing animation duration. Defaults to 200ms.
  @override
  final Duration expandingDuration;

  /// The scaling factor for the toast. Defaults to 1.0.
  @override
  final double scaling;

  /// The spacing between each toast when it is expanded. Defaults to 8.0.
  @override
  final double spacing;

  /// The toast's box constraints.
  final BoxConstraints toastConstraints;

  /// The toast's padding.
  @override
  final EdgeInsets padding;

  /// Creates a [FToastStyle].
  FToastStyle({
    required this.decoration,
    required this.contentStyle,
    this.animationDuration = const Duration(milliseconds: 150),
    this.expandingDuration = const Duration(milliseconds: 500),
    this.scaling = 1.0,
    this.spacing = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  }) : toastConstraints = BoxConstraints.tightFor(width: 320 * scaling);

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
