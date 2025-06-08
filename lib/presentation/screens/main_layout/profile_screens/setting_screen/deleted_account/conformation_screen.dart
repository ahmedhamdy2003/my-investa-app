import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  final String reason;

  const ConfirmationScreen({super.key, required this.reason});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
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
          'Confirm Deletion',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your deletion reason:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(widget.reason),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Note section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001F3F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black87),
                      children: [
                        TextSpan(
                          text: '• You can recover your account within ',
                        ),
                        TextSpan(
                          text: '25 days',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' of deletion.\n'),
                        TextSpan(
                          text:
                              '• We will help you as much as we can to support you in making the best decision.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Delete My Account Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account deletion requested'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red[400]),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                minimumSize: WidgetStateProperty.all(
                  const Size(double.infinity, 50),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.red[600]!;
                  }
                  return Colors.transparent;
                }),
              ),
              child: const Text('Delete My Account'),
            ),
            const SizedBox(height: 16),

            // Keep My Account Button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF001F3F),
                ),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                minimumSize: WidgetStateProperty.all(
                  const Size(double.infinity, 50),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color(0xFF001F3F);
                  }
                  return Colors.transparent;
                }),
              ),
              child: const Text('Keep My Account'),
            ),
          ],
        ),
      ),
    );
  }
}
