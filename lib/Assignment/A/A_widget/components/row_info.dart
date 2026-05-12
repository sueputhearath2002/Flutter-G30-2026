import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({super.key, required this.rightText, required this.leftText});
  final String rightText;
  final String leftText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
        ),
        Text(
          rightText,
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
