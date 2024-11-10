import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Sidebar.dart';
import '../Officers/Officers.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isSidebarVisible = true; // Track sidebar visibility

  void toggleSidebar() {
    // Trigger haptic feedback when the sidebar is toggled
    HapticFeedback.lightImpact(); // You can choose different types of feedback here

    setState(() {
      isSidebarVisible = !isSidebarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max, // Ensure the row takes maximum space
          children: [
            // Sidebar container with smooth transition
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSidebarVisible ? 288.0 : 0.0, // Toggle width
              child: Stack(
                children: [
                  Sidebar(), // Sidebar widget
                  // Menu button on top of the sidebar
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggleSidebar, // Toggle sidebar visibility on button press
                      color: Colors.white, // Change color to improve visibility
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ),

            // Expanded Officers widget, adjust width based on sidebar visibility
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSidebarVisible ? MediaQuery.of(context).size.width - 288.0 : MediaQuery.of(context).size.width,
              child: Officers(), // Officers widget fills remaining space
            ),
          ],
        ),
      ),
    );
  }
}