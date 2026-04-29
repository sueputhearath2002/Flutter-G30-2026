import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Color> colorSlide = [Colors.amber, Colors.black, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: colorSlide.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      width: double.infinity,
                      color: colorSlide[itemIndex],
                      child: Text(itemIndex.toString()),
                    ),
            options: CarouselOptions(
              viewportFraction: .8,
              initialPage: 2,
              enlargeFactor: 0.2,
              aspectRatio: 1.2,
              autoPlay: true,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          ),
        ],
      ),
    );
  }
}
