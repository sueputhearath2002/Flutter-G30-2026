import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class CusBtn extends StatelessWidget {
  const CusBtn({super.key, required this.btnName, this.onTap});
  final String btnName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
        backgroundColor: WidgetStatePropertyAll(ColorStyle.mainColor),
      ),
      onPressed: onTap,
      child: Text(btnName, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
