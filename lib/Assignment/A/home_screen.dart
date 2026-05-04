import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/card_product.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/header_title.dart';
import 'package:flutter2026/Assignment/A/model/product_model.dart';
import 'package:flutter2026/constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> slideImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI4Da-awgu9sLInkC-MG7EUW5OY3KR_57FvQ&s",
    "https://www.slideteam.net/media/catalog/product/cache/330x186/p/r/product_sale_tag_with_discount_pricing_icon_slide01.jpg",
  ];

  final List<ProductModel> product = [
    ProductModel(
      imagURl:
          'https://plus.unsplash.com/premium_photo-1669652639337-c513cc42ead6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Book 1',
      price: '\$45',
    ),
    ProductModel(
      imagURl:
          'https://plus.unsplash.com/premium_photo-1750360906462-922427bed1f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Book 2',
      price: '\$100',
    ),
    ProductModel(
      imagURl:
          'https://plus.unsplash.com/premium_photo-1750360904761-b93b9400426e?q=80&w=714&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Book 3',
      price: '\$140',
    ),
    ProductModel(
      imagURl:
          'https://plus.unsplash.com/premium_photo-1750360904438-b4f862308cc2?q=80&w=1680&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Book 4',
      price: '\$240',
    ),
  ];

  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: _buildProfile(),
        actions: [_buildNotification()],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: _buildSearch(),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          _buildSlider(),
          HeaderTitle(
            rightText: "See All",
            leftText: "Featured",
            onTap: () {},
            child: _buildProducts(),
          ),
          HeaderTitle(
            rightText: "See All",
            leftText: "Most Popular",
            onTap: () {},
            child: _buildProducts(),
          ),
        ],
      ),
    );
  }

  Widget _buildProducts() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: product.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardProduct(
            imgProduct: product[index].imagURl,
            title: product[index].title,
            price: product[index].price,
          );
        },
      ),
    );
  }

  Widget _buildSlider() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: slideImages.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: slideImages[itemIndex],
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
          options: CarouselOptions(
            onPageChanged: (index, reason) => setState(() {
              _current = index;
            }),
            height: 200,
            viewportFraction: 0.9,
            initialPage: 2,
            enlargeFactor: 0.1,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlay: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: slideImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? ColorStyle.blueColor
                      : ColorStyle.greyColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          fillColor: ColorStyle.greyColor,
          filled: true,

          prefixIcon: Icon(Icons.search),
          hintText: "Search here",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }

  Widget _buildNotification() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.notifications, color: ColorStyle.iconColor),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorStyle.greyColor),
      ),
    );
  }

  Widget _buildProfile() {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: 50,
          height: 50,
          imageUrl:
              "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      title: Text("Hello!"),
      subtitle: Text(
        "Jonh Willaim",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
