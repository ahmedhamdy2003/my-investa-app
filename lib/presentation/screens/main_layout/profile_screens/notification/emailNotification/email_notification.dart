import 'package:flutter/material.dart';

class EmailNotification extends StatefulWidget {
  const EmailNotification({super.key});

  @override
  State<EmailNotification> createState() => _EmailNotificationState();
}

class _EmailNotificationState extends State<EmailNotification> {
  final bool _brandUpdates = true;
  bool _investaUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Email Notification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Investa Updates Card with Switch
            _buildNotificationCard(
              title: 'Investa updates & announcements',
              value: _investaUpdates,
              onChanged: (value) => setState(() => _investaUpdates = value),
            ),

            const SizedBox(height: 12),

            const Text(
              "It consists of:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "• Project Status\n• Messages from Investors\n• New Approvals",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blue,
              // Color when switch is ON
              activeTrackColor: Colors.blue.withOpacity(0.2),
              inactiveThumbColor: Colors.white,
              // Color when switch is OFF
              inactiveTrackColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// Switch.adaptive(
//   value: value,
//   onChanged: onChanged,
//   activeColor: Colors.blue,
//   activeTrackColor: Colors.blue.withOpacity(0.2),
//   inactiveThumbColor: Colors.grey[400],
//   inactiveTrackColor: Colors.grey[200],
// ),
