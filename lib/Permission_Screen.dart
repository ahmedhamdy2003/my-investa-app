import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred Background
          Positioned.fill(
            child: Image.asset(
              'assets/blurred_bg.png', // Replace with an actual blurred background
              fit: BoxFit.cover,
            ),
          ),

          // Apply Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),

          // Permission Dialog
          Center(
            child: _buildPermissionDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        '"Diary" Would Like to Access to the Camera',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Text(
        'To take pictures and detect your face',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text('Don\'t Allow', style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {},
          child: Text('OK', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
