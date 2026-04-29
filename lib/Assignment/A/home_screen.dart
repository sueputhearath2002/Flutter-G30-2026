import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      body: ListView(children: [SizedBox(height: 16), _buildSlider()]),
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
            viewportFraction: .8,
            initialPage: 2,
            enlargeFactor: 0.1,
            aspectRatio: 3 / 1.2, // width/height
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
