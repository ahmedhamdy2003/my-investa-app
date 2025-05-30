// notification_screen.dart
import 'package:first_page/verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For Cupertino (iOS-style) widgets

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We will show the dialog automatically when the screen loads.
    // Using WidgetsBinding.instance.addPostFrameCallback ensures
    // the dialog is shown after the build method completes.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showNotificationDialog(context);
    });

    return Scaffold(
      backgroundColor:
          const Color(0xFFF2F2F7), // A common light iOS background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
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
        // You can place any background content here if needed.
        // For this screen, it's mostly about the dialog.
        child: Container(),
      ),
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            '"Diary" Would Like to Send\nYou Push Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600, // Semi-bold
              color: Colors.black,
            ),
          ),
          content: const Text(
            'Notifications may include alerts,\nsounds and icon badges. These can be\nconfigured in Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54, // Lighter grey for content
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                print('Don\'t Allow pressed');
                // TODO: Add logic for 'Don't Allow'
              },
              child: const Text(
                'Don\'t Allow',
                style: TextStyle(
                  color: CupertinoColors.activeBlue, // iOS blue link color
                  fontSize: 17,
                  fontWeight: FontWeight.w400, // Regular font weight
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog first
                print('OK pressed. Navigating to VerifiedScreen.');
                // Navigate to VerifiedScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifiedScreen()),
                );
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: CupertinoColors.activeBlue, // iOS blue link color
                  fontSize: 17,
                  fontWeight: FontWeight.w600, // Semi-bold for OK
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
