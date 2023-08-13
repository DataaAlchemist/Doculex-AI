import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class RoundedTextButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool enabled;
  final bool withGradient;
  final Function()? onPressed;

  const RoundedTextButton({
    Key? key,
    required this.label,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.enabled = true,
    this.withGradient = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RoundedTextButton> createState() => _RoundedTextButtonState();
}

class _RoundedTextButtonState extends State<RoundedTextButton> {
  final double verticalPadding = 12;
  final double horizontalPadding = 16;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return Text(
        widget.label,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: grey500Color),
      )
          .padding(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          )
          .borderRadius(all: defaultBorderRadius)
          .backgroundColor(lightGreyColor)
          .clipRRect(all: defaultBorderRadius);
    }

    return Text(
      widget.label,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: widget.textColor),
    )
        .padding(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        )
        .borderRadius(all: defaultBorderRadius)
        .ripple()
        .backgroundColor(
          widget.withGradient ? Colors.transparent : widget.backgroundColor,
          animate: true,
        )
        .backgroundGradient(
          widget.withGradient
              ? const LinearGradient(
                  colors: [primaryColor, secondaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(colors: []),
        )
        .clipRRect(all: defaultBorderRadius)
        .borderRadius(all: defaultBorderRadius, animate: true)
        .elevation(
          _isPressed ? 2 : 10,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          shadowColor: widget.backgroundColor.withOpacity(.38),
        )
        .gestures(
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
          onTap: widget.onPressed,
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(
            const Duration(milliseconds: 175), Curves.fastLinearToSlowEaseIn);
  }
}
