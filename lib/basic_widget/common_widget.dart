import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              ListTile(
                iconColor: Colors.red,
                onTap: () {
                  print("Listle flutter");
                },
                leading: Icon(Icons.person_pin, size: 45),
                title: Text(
                  "Jonh 123",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("0987654343"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                leading: Icon(Icons.person_pin, size: 45),
                title: Text(
                  "Jonh 123",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("0987654343"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              Divider(
                endIndent: 16,
                indent: 16,
                thickness: 16,
                radius: BorderRadius.circular(16),
                color: Colors.amber,
                height: 8,
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.all(16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Image.network(
                        "https://www.realsimple.com/thmb/vDQYdFGqp9s_Gvr4wyCdFh0O8Ag=/4000x2667/filters:no_upscale()/how-to-clean-microfiber-cloth-GettyImages-1314720631-dfb583e54f9e40dea2fea26b6dfaf26f.jpg",
                        width: 300,
                      ),
                      Text(
                        "Cloth 2026",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "47\$",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Badge.count(
                count: 10,
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                child: Chip(
                  label: Text("Pending", style: TextStyle(color: Colors.blue)),
                  backgroundColor: Colors.blue.withValues(alpha: 0.1),
                  elevation: 0,
                  side: BorderSide(
                    color: Colors.blue.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                child: Text("OutlinedButton"),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                shape: CircleBorder(),
                elevation: 0,
                child: Icon(Icons.add, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_important_rounded,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
              ),
              Row(
                children: [
                  Text("Forgot password ?"),
                  TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: Text("Reset password"),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.amber,
                  elevation: 2,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                child: Text(
                  "ElevatedButton",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.face,
                    size: 45,
                    color: Colors.amber,
                    shadows: [
                      Shadow(
                        color: Colors.green,
                        offset: Offset(3, 8),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  Icon(Icons.favorite_sharp, size: 35, color: Colors.red),
                  Icon(Icons.add_alert_rounded, size: 40),
                ],
              ),
              Image.asset("assets/images/12.png"),
              Image.network(
                "https://img.freepik.com/free-photo/young-handsome-man-wearing-casual-tshirt-blue-background-happy-face-smiling-with-crossed-arms-looking-camera-positive-person_839833-12963.jpg?semt=ais_hybrid&w=740&q=80",
              ),
              Image.network(
                "https://pencilbox.edu.bd/storage/16/For-web.webp",
                width: 100,
              ),
              //Already have account? Sign Up
              RichText(
                text: TextSpan(
                  text: "Hello RichTextr",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Today",
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),

                    TextSpan(
                      text: "Yesterday",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Hello flutter",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.amberAccent,
                  letterSpacing: 1.5,
                  wordSpacing: 4,
                  fontStyle: FontStyle.normal,
                  // decoration: TextDecoration.lineThrough,
                  // decorationColor: Colors.blue,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 6.0,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
