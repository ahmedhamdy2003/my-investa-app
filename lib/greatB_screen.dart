// greatB_screen.dart
import 'package:first_page/notification_screen.dart';
import 'package:flutter/material.dart';

class GreatBScreen extends StatelessWidget {
  const GreatBScreen({super.key});

  // Helper method to build a step item
  Widget _buildStepItem({
    required int stepNumber,
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isLastStep = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step Indicator (Circle with Check or Number)
            Container(
              width: 28, // Adjusted width for consistent circle size
              height: 28, // Adjusted height for consistent circle size
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFF738395).withOpacity(
                        0.5), // Green for completed, grey for incomplete
                border: Border.all(
                  color: isCompleted
                      ? Colors.transparent
                      : const Color(0xFF738395), // Border for incomplete
                  width: 1,
                ),
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18, // Smaller checkmark
                      )
                    : Text(
                        '$stepNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 16), // Space between indicator and text

            // Step Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600, // Semi-bold
                      color: isCompleted
                          ? Colors.black
                          : const Color(
                              0xFF5E6D7B), // Darker for completed, lighter for incomplete
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isCompleted
                          ? Colors.grey[700]
                          : const Color(0xFF738395), // Greyish for subtitle
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Connector Line (if not the last step)
        if (!isLastStep)
          Padding(
            padding: const EdgeInsets.only(
                left: 13.0), // Align line under the center of the circle
            child: Container(
              height: 70, // Length of the connector line
              width: 2, // Thickness of the connector line
              color: const Color(0xFF738395).withOpacity(0.5), // Grey line
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background as in the image
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Great,Let\'s Setup your account',
              style: TextStyle(
                fontSize: 28, // Larger and bold
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'To complete your registration process, you\nwill need to Fill',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600], // Lighter grey for subtitle
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40), // Space before steps

            _buildStepItem(
              stepNumber: 1,
              title: 'Financial Assessment',
              subtitle: 'help us to know you more so you can invest: easily.',
              isCompleted: true, // This step is completed
            ),
            _buildStepItem(
              stepNumber: 2,
              title: 'Account Verification',
              subtitle: 'Complete the steps to be verified',
              isCompleted: true, // This step is completed
            ),
            _buildStepItem(
              stepNumber: 3,
              title: 'Start to Explore & Invest',
              subtitle: '', // No subtitle for the last step in the image
              isCompleted: false, // This step is not completed
              isLastStep: true,
            ),
            // Use Spacer to push the button to the bottom
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to NotificationScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()),
                  );
                  print(
                      'Confirm button pressed! Navigating to NotificationScreen.');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff001F3F), // Dark blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24), // Padding at the bottom
          ],
        ),
      ),
    );
  }
}
