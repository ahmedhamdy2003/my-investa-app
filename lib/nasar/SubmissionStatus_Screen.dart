import 'dart:async';
import 'package:flutter/material.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'accept_screen.dart';
import 'reject_screen.dart';

class SubmissionStatusScreen extends StatefulWidget {
  // 1. أضف خاصية userId هنا
  final String? userId;

  // 2. عدّل الـ constructor لاستقبال الـ userId
  const SubmissionStatusScreen({super.key, this.userId});

  @override
  State<SubmissionStatusScreen> createState() => _SubmissionStatusScreenState();
}

class _SubmissionStatusScreenState extends State<SubmissionStatusScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // bool isAccepted = true; // 👈 غيرها على مزاجك (true or false)

      // WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                // isAccepted
                //     ?
                AcceptScreen(
                  userId: ManageCurrentUser.currentUser.guid,
                ), // 3. تمرير الـ userId
            // : RejectScreen(
            //   userId: widget.userId,
            // ), // 3. تمرير الـ userId
          ),
        );
      // });
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
              child: Image.asset('assets/dark_shape.png', width: 80),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/shape.png', width: 240),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 160),
                    const Text(
                      "Here we’re there , After Assigning\nYour data and your Request , we’re\ngoing to send the response.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF082347),
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "AFTER 48 TO 36 hour our team will\ncommunicate with you to announce you and\nguide you to start your journey with us either\nwith your own team, check your inbox.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF082347),
                        height: 1.5,
                      ),
                    ),
                    // [DEBUG] لعرض الـ userId للتأكد من وصوله
                    if (widget.userId != null && widget.userId!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "User ID: ${widget.userId}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic,
                          ),
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
