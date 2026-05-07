import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class CircleBtn extends StatelessWidget {
  const CircleBtn({super.key, required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: ColorStyle.iconColor),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorStyle.greyColor),
      ),
    );
  }
}
