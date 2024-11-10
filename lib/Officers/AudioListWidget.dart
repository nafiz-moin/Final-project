import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'officersdetails.dart'; // Ensure this file is properly defined.
import '../AudioManage/AudioPlayer.dart'; // Import the audio player helper.

class AudiolistWidget extends StatelessWidget {
  final String profileImageAsset;
  final String title;
  final String age;
  final String chutCount;
  final List<User> listViewProfile;

  const AudiolistWidget({
    Key? key,
    required this.profileImageAsset,
    required this.title,
    required this.age,
    required this.chutCount,
    required this.listViewProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate the AudioPlayerHelper
    final AudioPlayerHelper audioPlayerHelper = AudioPlayerHelper();
    var size = Get.size;

    // List of RxBool to track icon state for each item
    List<RxBool> menuClickedList = List.generate(
      listViewProfile.length,
          (_) => false.obs,
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Image.asset(
              "assets/photos/matrixbg.webp",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
              child: Container(),
            ),
            // Column that contains the profile part and voice part
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: size.height * 0.4,
                      width: size.width,
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                          bottom: BorderSide(color: Colors.redAccent.shade700.withOpacity(.6), width: 3),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white12,
                            Color(0xff042403),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(30),
                    itemCount: listViewProfile.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentUser = listViewProfile[index];
                      return ListTile(
                        title: Text(
                          currentUser.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.redAccent.shade700.withOpacity(.6),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () async {
                            // Toggle specific icon state in menuClickedList
                            menuClickedList[index].value = !menuClickedList[index].value;

                            // Play or stop audio based on the new state
                            if (menuClickedList[index].value) {
                              await audioPlayerHelper.playSound(currentUser.sound);
                            } else {
                              await audioPlayerHelper.stopAudio();
                            }
                          },
                          child: Obx(() {
                            // Change icon based on the menuClickedList for the specific item
                            return Icon(
                              menuClickedList[index].value ? Icons.stop : Icons.volume_up,
                              color: Colors.redAccent.shade700.withOpacity(.6),
                            );
                          }),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.green.shade700,
                        thickness: .5,
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * .03,
              right: size.height * .01,
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImageAsset),
                maxRadius: 80,
                minRadius: 50,
                backgroundColor: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 60, 20, 0),
              child: Container(
                height: size.height * 0.15,
                width: size.height * 0.25,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                          color: Colors.redAccent.shade700.withOpacity(.6),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Age: $age",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          color: Colors.redAccent.shade700.withOpacity(.6),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Chut Count: $chutCount",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          color: Colors.redAccent.shade700.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.3,
              right: size.height * 0.06,
              child: Text(
                "The Chut Investigator",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: Colors.redAccent.shade700.withOpacity(.6)

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
