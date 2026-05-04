import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    this.rightText = "",
    this.leftText = "",
    this.onTap,
    this.child,
  });
  final String leftText;
  final String rightText;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            leftText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: TextButton(
            onPressed: onTap,
            child: Text(
              rightText,
              style: TextStyle(fontSize: 12, color: ColorStyle.mainColor),
            ),
          ),
        ),
        Container(child: child),
      ],
    );
  }
}
