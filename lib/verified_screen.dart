// verified_screen.dart
import 'package:first_page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Required for Timer

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to WelcomeScreen
      // Using pushReplacement to prevent going back to VerifiedScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background as in the image
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        // No leading back button as per the image
        title: const Text(
          '9:41', // Time display
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black, size: 20),
          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            // Dark blue circle with white checkmark
            Container(
              width: 90, // Size of the circle
              height: 90, // Size of the circle
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF001F3F), // Dark blue color
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50, // Size of the checkmark icon
              ),
            ),
            const SizedBox(height: 30), // Space between icon and text
            // "Verify successfully" text
            const Text(
              'Verify successfully',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600, // Semi-bold
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
