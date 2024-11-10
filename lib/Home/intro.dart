import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Lock the device in portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Enable edge-to-edge system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Initialize the video player with the video asset
    _controller = VideoPlayerController.asset('Assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // Start playing the video
        });

        // Navigate to the Sidebar screen after the video finishes playing
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _navigateToSidebarScreen(); // Change the function name to navigate to Sidebar
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();

    // Restore the system UI when leaving the screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  // Function to navigate to the Sidebar screen
  void _navigateToSidebarScreen() {
    // Use Get.to for navigation
    Get.offNamed('/sidebar'); // This will navigate to the Sidebar page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Center(
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
