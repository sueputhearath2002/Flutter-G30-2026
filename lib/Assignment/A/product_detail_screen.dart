import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/Assignment/A/cart_screen.dart';
import 'package:flutter2026/constant/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> sizeProduct = ["20", "30", "40", "50", "60", "70", "80"];

  String getSize = "";

  // {
  //   size: getSize
  // }

  void selectedSize(String size) {
    setState(() {
      getSize = size;
    });
    print("=========get Size===${size}");
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            _buildHeaderTitle(),
            SizedBox(height: 16),
            _buildDescription(),
            SizedBox(height: 16),
            _buildSize(),
          ],
        ),
        persistentFooterButtons: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      ColorStyle.mainColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 12),
                  ),
                  backgroundColor: WidgetStatePropertyAll(ColorStyle.greyColor),
                ),
                child: Icon(Icons.cases_rounded, size: 26),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSize() {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        SizedBox(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizeProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => selectedSize(sizeProduct[index]),
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyle.greyColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    sizeProduct[index].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: getSize == sizeProduct[index]
                          ? ColorStyle.mainColor
                          : Colors.black45,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Text(
          "Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildHeaderTitle() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Nike Shoes",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.star,
            color: const Color.fromARGB(255, 205, 186, 10),
            size: 38,
          ),
          SizedBox(width: 8),
          Text(
            "2.4",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            " (20 Review)",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
      trailing: Text(
        "\$340",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorStyle.mainColor,
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      toolbarHeight: 330,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWERLXbpYTkYG8crAUdYs_bU9BNExwKBudNg&s",
              height: double.infinity,
              width: double.infinity,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Positioned(
              left: 16,
              top: MediaQuery.of(context).padding.top,
              child: CircleBtn(
                icon: Icons.arrow_back,
                onTap: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              right: 16,
              top: MediaQuery.of(context).padding.top,
              child: CircleBtn(icon: Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}
