// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
//
//
// class PhoneCallRequest extends StatelessWidget {
//   const PhoneCallRequest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Support Contact',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ContactPage(),
//     );
//   }
// }
//
// class ContactPage extends StatelessWidget {
//   const ContactPage({super.key});
//
//   Future<void> _makePhoneCall() async {
//     const phoneNumber = '19143';
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );
//     if (await canLaunchUrl(launchUri)) {
//       await launchUrl(launchUri);
//     } else {
//       throw 'Could not launch $phoneNumber';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Phone Call Request'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'How to Reach us immediately?',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             RichText(
//               text: const TextSpan(
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//                 children: [
//                   TextSpan(text: 'To reach us just call us '),
//                   TextSpan(
//                     text: '19143',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   TextSpan(text: ' or by the\n'),
//                   TextSpan(
//                     text: 'Support Request',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   TextSpan(text: ' otherwise you can also\n'),
//                   TextSpan(text: 'reach us from the chatbot of the technical\n'),
//                   TextSpan(text: 'support. You should know that by\n'),
//                   TextSpan(text: 'Reaching us the process will be recorded\n'),
//                   TextSpan(text: 'pleasantly.'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: _makePhoneCall,
//                   child: const Text('Call 19143'),
//                 ),
//                 const SizedBox(width: 10),
//                 OutlinedButton(
//                   onPressed: () {
//                     // Add support request functionality
//                   },
//                   child: const Text('Support Request'),
//                 ),
//                 const SizedBox(width: 10),
//                 OutlinedButton(
//                   onPressed: () {
//                     // Add chatbot functionality
//                   },
//                   child: const Text('Chatbot'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/routes_manager/colors_managers.dart';

class PhoneCallRequest extends StatelessWidget {
  const PhoneCallRequest({super.key});

  Future<void> _makePhoneCall() async {
    const phoneNumber = '19143';
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
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
          "Phone Call Request",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 20.0 : screenWidth * 0.1,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Added image at the top
            const SizedBox(height: 20),

            Text(
              'How to Reach us immediately?',
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: 'To reach us just call us '),
                  TextSpan(
                    text: '19143',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: ' or by the\n'),
                  TextSpan(
                    text: 'Support Request',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: ' otherwise you can also\n'),
                  TextSpan(
                    text: 'reach us from the chatbot of the technical\n',
                  ),
                  TextSpan(text: 'support. You should know that by\n'),
                  TextSpan(text: 'Reaching us the process will be recorded\n'),
                  TextSpan(text: 'pleasantly.'),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Call button
            Center(
              child: Column(
                children: [
                  Image.asset(
                    AssetsManagers.call,
                    width: isSmallScreen ? 200 : 300,
                    height: isSmallScreen ? 200 : 300,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  canLaunchUrl(Uri launchUri) {}
}
