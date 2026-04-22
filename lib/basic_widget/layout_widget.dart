import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Positioned(
                right: -16,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(color: Colors.green),
                ),
              ),
              Positioned(
                top: -26,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.yellow),
                ),
              ),
            ],
          ),
        ),
        // Column(
        //   // spacing: 16,
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(width: 100, height: 100, color: Colors.green),
        //     Container(width: 100, height: 60, color: Colors.green),
        //     Container(width: 100, height: 100, color: Colors.green),

        //     Row(
        //       spacing: 16,
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(width: 100, height: 100, decoration: styleBox()),
        //         Container(width: 100, height: 60, color: Colors.green),
        //         Container(width: 100, height: 100, decoration: styleBox()),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }

  BoxDecoration styleBox() {
    return BoxDecoration(shape: BoxShape.circle, color: Colors.green);
  }
}
