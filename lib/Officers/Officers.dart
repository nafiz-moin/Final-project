import 'package:flutter/services.dart';

import 'officersdetails.dart';
import 'AudioListWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AudioListWidget.dart';
import '../Home/HomeScreen.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class Officers extends StatelessWidget {
  const Officers({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size; // Get the screen size
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            HapticFeedback.lightImpact();
            Get.offAll(
                  () => Homescreen(), // Navigate back to the home screen
              transition: Transition.fadeIn, // Fade-in transition for smooth navigation
              duration: Duration(milliseconds: 300), // Adjust duration
            );
          },
        ),
        title: const Text(
          'Chut Investigation Department',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 1.0,
          ),
        ),
        backgroundColor: Colors.tealAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/photos/sherlock_holmes.gif"),
            fit: BoxFit.cover, // Ensures the image covers the entire container
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero, // Ensure no padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
            crossAxisAlignment: CrossAxisAlignment.center, // Center align items horizontally
            children: [
              GestureDetector(
                onTap: () {
                  final profileImagePath = 'assets/photos/Pradduman.png';
                  Get.to(() => AudiolistWidget(
                    title: 'ACP',
                    age: '69',
                    chutCount: '420',
                    listViewProfile: Acp,
                    profileImageAsset: profileImagePath,
                  ));
                },
                child: Hero(
                  tag: 'assets/photos/Pradduman.png', // Hero transition tag
                  child: CircleAvatarContainer(
                    radius: size.width * 0.25,
                    imagePath: 'assets/photos/Pradduman.png',
                  ),
                ),
              ),
              SizedBox(height: 100),
              Namebox(name: 'ACP Pradduman', width: size.width * .8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildProfileColumn(size.width, 'Abhijit', 'assets/photos/Abhijit.png', '220', Abhijit),
                    buildProfileColumn(size.width, 'Daya Nand', 'assets/photos/daya.png', 'Zero', Daya),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileColumn(double width, String title, String imagePath, String chutCount, dynamic listViewProfile) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => AudiolistWidget(
              title: title,
              age: '55',
              chutCount: chutCount,
              listViewProfile: listViewProfile,
              profileImageAsset: imagePath,
            ));
          },
          child: Material(
            color: Colors.transparent, // Ensure no background
            child: InkWell(
              splashColor: Colors.tealAccent, // Ripple effect color
              highlightColor: Colors.tealAccent.withOpacity(0.5), // Highlight color
              child: Hero(
                tag: imagePath, // Hero transition tag for each profile image
                child: CircleAvatarContainer(
                  radius: width * 0.20,
                  imagePath: imagePath,
                ),
              ),
            ),
          ),
        ),
        Namebox(name: title, width: width * .4),
        SizedBox(height: 200),
      ],
    );
  }
}

class CircleAvatarContainer extends StatelessWidget {
  final double radius;
  final String imagePath;

  const CircleAvatarContainer({
    Key? key,
    required this.imagePath,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread of the shadow
              blurRadius: 10, // Blur effect
              offset: Offset(0, 5), // Offset of the shadow
            ),
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}

class Namebox extends StatelessWidget {
  final String name;
  final double width;

  const Namebox({
    Key? key,
    required this.name,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: size.height * .05,
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(
            color: Colors.black12, // Border color
            width: 5.0, // Border width
          ),
          borderRadius: BorderRadius.circular(10), // Optional: adds rounded corners
        ),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
