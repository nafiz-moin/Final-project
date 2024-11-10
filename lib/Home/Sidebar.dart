import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Officers/Officers.dart';
import '../Criminals/Criminals.dart';
import '../Public/Public.dart';
import '../Home/aboutpage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: 288.0, // Fixed width for the sidebar
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/photos/sidebarglitch.gif"),
            fit: BoxFit.contain, // Ensures the image covers the entire container without gaps
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0), // Ensures there's no extra padding
          child: Column(
            children: [
              SizedBox(height: 45),
              CircleAvatar(
                backgroundImage: AssetImage("assets/photos/Pradduman.png"),
                maxRadius: 80,
                minRadius: 50,
                backgroundColor: Colors.blue,
              ),
              SizedBox(height: 10), // Space between avatar and text
              Text(
                "Chut Investigation Department",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20), // Space between text and list
              Expanded(
                child: ListView(
                  children: [
                    buildListTile(
                      title: "Officers",
                      imagePath: "assets/photos/officer.gif",
                      onTap: () {
                        Get.to(() => Officers(), transition: Transition.fadeIn, duration: Duration(milliseconds: 300));
                      },
                    ),
                    Divider(color: Colors.grey),
                    buildListTile(
                      title: "Criminals",
                      imagePath: "assets/photos/criminal.gif",
                      onTap: () {
                        Get.to(() => Criminals(), transition: Transition.fadeIn, duration: Duration(milliseconds: 300));
                      },
                    ),
                    Divider(color: Colors.grey),
                    buildListTile(
                      title: "Public",
                      imagePath: "assets/photos/people.gif",
                      onTap: () {
                        Get.to(() => Public(), transition: Transition.fadeIn, duration: Duration(milliseconds: 300));
                      },
                    ),
                    Divider(color: Colors.grey),
                    buildListTile(
                      title: "About",
                      imagePath: "assets/photos/about.gif",
                      onTap: () {
                        Get.to(() => AboutPage(), transition: Transition.fadeIn, duration: Duration(milliseconds: 300));
                      },
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

  Widget buildListTile({
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.tealAccent.withOpacity(0.5), // Ripple effect color
      highlightColor: Colors.tealAccent.withOpacity(0.3), // Highlight color
      child: ListTile(
        leading: SizedBox(
          height: 30, // Adjust the size of the icon
          width: 30,
          child: Image.asset(imagePath),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}