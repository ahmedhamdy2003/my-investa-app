// import 'package:flutter/material.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
//
// class BusinessGoalsScreen extends StatelessWidget {
//   const BusinessGoalsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor:ColorsManagers.white,
//       appBar: AppBar(
//         backgroundColor: ColorsManagers.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//
//         title: const Text(
//           'Business Goals &\nMilestones Tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Upload Your plan using the funds which must consists of:',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 12),
//             const BulletPoint(text: 'period term'),
//             const BulletPoint(text: 'Goal description'),
//             const BulletPoint(text: 'Target date'),
//             const BulletPoint(text: 'status'),
//             const BulletPoint(text: 'Accomplished(%)'),
//             const BulletPoint(text: 'Notes'),
//             const SizedBox(height: 20),
//             const Text(
//               'Note: the plan must consist of type of users the Short / Long (0-6 months), (6-12 months).',
//               style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(200, 50),
//                   backgroundColor: Colors.grey[300],
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text('Upload'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BulletPoint extends StatelessWidget {
//   final String text;
//
//   const BulletPoint({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Text('• ', style: TextStyle(fontSize: 18)),
//         Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

// تأكد من المسار الصحيح

class BusinessGoalsScreen extends StatefulWidget {
  const BusinessGoalsScreen({super.key});

  @override
  State<BusinessGoalsScreen> createState() => _BusinessGoalsScreenState();
}

class _BusinessGoalsScreenState extends State<BusinessGoalsScreen> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // هنا ممكن تضيف التنقل بين الشاشات حسب الـ index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,

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
          'Business Goals &\n Milestones Tracker',
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
            const Text(
              'Upload Your plan using the funds which must consists of:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            const BulletPoint(text: 'period term'),
            const BulletPoint(text: 'Goal description'),
            const BulletPoint(text: 'Target date'),
            const BulletPoint(text: 'status'),
            const BulletPoint(text: 'Accomplished(%)'),
            const BulletPoint(text: 'Notes'),
            const SizedBox(height: 20),
            const Text(
              'Note: the plan must consist of type of users the Short / Long (0-6 months), (6-12 months).',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.white,
                ),
                child: const Text('Upload'),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //  selectedIndex: _selectedIndex,
      //onTap: _onNavTapped,
      //),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('• ', style: TextStyle(fontSize: 18)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
