import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/constant/colors.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyle.greyColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildImageInfo(), _buildAction()],
      ),
    );
  }

  Widget _buildAction() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleBtn(
              onTap: () => print("Deleted"),
              icon: Icons.delete_forever_rounded,
              iconColor: Colors.red,
            ),

            Row(
              children: [
                CircleBtn(
                  sizeICon: 12,
                  size: Size(18, 18),
                  bgColor: ColorStyle.mainColor,
                  onTap: () => print("Minus"),
                  icon: Icons.remove,
                  iconColor: Colors.white,
                ),

                SizedBox(width: 12),

                Text(
                  "09",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                SizedBox(width: 12),

                CircleBtn(
                  sizeICon: 12,
                  size: Size(18, 18),
                  bgColor: ColorStyle.mainColor,
                  onTap: () => print("Add"),
                  icon: Icons.add,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageInfo() {
    return Row(
      spacing: 16,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWERLXbpYTkYG8crAUdYs_bU9BNExwKBudNg&s",
                height: 100,
                width: 100,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              "Watch",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Rolex",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Text(
              "\$30.00",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorStyle.mainColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
