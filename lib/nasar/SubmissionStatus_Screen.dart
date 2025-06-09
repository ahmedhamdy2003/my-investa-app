import 'dart:async';
import 'package:flutter/material.dart';
import 'accept_screen.dart';
import 'reject_screen.dart';

class SubmissionStatusScreen extends StatefulWidget {
  const SubmissionStatusScreen({super.key});

  @override
  State<SubmissionStatusScreen> createState() => _SubmissionStatusScreenState();
}

class _SubmissionStatusScreenState extends State<SubmissionStatusScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool isAccepted = true; // 👈 غيرها على مزاجك (true or false)

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isAccepted ? const AcceptScreen() : const RejectScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -10,
              left: 30,
              child: Image.asset(
                'assets/blue_shape.png',
                width: 240,
                height: 250,
              ),
            ),
            Positioned(
              top: 38,
              right: -10,
              child: Image.asset(
                'assets/dark_shape.png',
                width: 80,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/shape.png',
                width: 240,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 160),
                    Text(
                      "Here we’re there , After Assigning\nYour data and your Request , we’re\ngoing to send the response.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF082347),
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "AFTER 48 TO 36 hour our team will\ncommunicate with you to announce you and\nguide you to start your journey with us either\nwith your own team, check your inbox.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF082347),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Thank you, Dear ❤️",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF082347),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "GIF FOR SOON",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
