import 'package:flutter/material.dart';

class FlureButton extends StatelessWidget {
  const FlureButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onSecondaryTap,
    this.onTertiaryTapDown,
    this.onLongPress,
  });

  final void Function()? onPressed;
  final Widget? child;

  final void Function()? onSecondaryTap;
  final void Function(TapDownDetails)? onTertiaryTapDown;
  final void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTap: onSecondaryTap,
      onTertiaryTapDown: onTertiaryTapDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape: const LinearBorder(),
          ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: child,
        ),
      ),
    );
  }
}
