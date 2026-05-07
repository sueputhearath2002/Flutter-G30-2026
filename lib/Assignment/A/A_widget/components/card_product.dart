import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.imgProduct,
    required this.title,
    required this.price,
    this.onTap,
  });
  final String imgProduct;
  final String title;
  final String price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: ColorStyle.greyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 170,
                    height: 120,
                    imageUrl: imgProduct,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorStyle.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 24,
          top: 8,
          child: Icon(Icons.favorite_border, color: Colors.white),
        ),
      ],
    );
  }
}
