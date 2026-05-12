import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class CircleBtn extends StatelessWidget {
  CircleBtn({
    super.key,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.bgColor,
    this.size,
    this.sizeICon,
  });
  final IconData icon;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? bgColor;
  final Size? size;
  final double? sizeICon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: iconColor ?? ColorStyle.iconColor,
        size: sizeICon ?? 24,
      ),
      style: ButtonStyle(
        maximumSize: WidgetStatePropertyAll(Size(55, 55)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(size ?? Size(24, 24)),
        backgroundColor: WidgetStatePropertyAll(
          bgColor ?? ColorStyle.greyColor,
        ),
      ),
    );
  }
}
