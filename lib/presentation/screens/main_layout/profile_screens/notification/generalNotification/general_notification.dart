import 'package:flutter/material.dart';

class GeneralNotification extends StatefulWidget {
  const GeneralNotification({super.key});

  @override
  State<GeneralNotification> createState() => _GeneralNotificationsScreenState();
}

class _GeneralNotificationsScreenState extends State<GeneralNotification> {
  final bool _brandUpdates = true;
  bool _investaUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('General Notification', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // // Brand Updates Card
            // _buildNotificationCard(
            //   title: 'Brand updates & announcement',
            //   value: _brandUpdates,
            //   onChanged: (value) => setState(() => _brandUpdates = value),
            // ),
            const SizedBox(height: 16),

            // Investa Updates Card
            _buildNotificationCard(
              title: 'Investa updates & announcement',
              value: _investaUpdates,
              onChanged: (value) => setState(() => _investaUpdates = value),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blue,
              activeTrackColor: Colors.blue.withOpacity(0.2),
              inactiveThumbColor: Colors.grey[400],
              inactiveTrackColor: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}