// import 'package:flutter/material.dart';
//
// import '../../tabs/profile/profile.dart';
//
//
// class BusinessManagement extends StatelessWidget {
//   const BusinessManagement({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.all(8), // هامش حول الدائرة
//           decoration: BoxDecoration(
//             shape: BoxShape.circle, // شكل دائري
//             color: Color(0xFF001F3F), // لون الخلفية
//           ),
//           child: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute (builder: (context) => const Profile()),
//                 );
//               } // وظيفة الرجوع
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: const Text('Business Management', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             const SizedBox(height: 30),
//             _buildSecurityItem(
//               text: 'My Business',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const  BankLevel()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '📈 Analytics Dashboard',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const Verified()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '📝 Edit Business Details',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const LegallyBound()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '💼 Documents Upload',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const Transparent()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '📦 Product/Service Description',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ClearFees()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '🎯 Business Goals & Milestones Tracker',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const TwoFactor()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '⏳ Funding Progress',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const DirectAccess()),
//                 // );
//               },
//             ),
//             _buildSecurityItem(
//               text: '🧠 AI Evaluation History',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const DisputeResolution()),
//                 // );
//               },
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSecurityItem({
//     // required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 20.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 3.0, right: 12.0),
//               // child: Icon(
//               //   icon,
//               //   color: Colors.blueAccent,
//               //   size: 28,
//               // ),
//             ),
//             Expanded(
//               child: Text(
//                 text,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/businessManagement/mybusiness/my_business.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/businessManagement/product&serviceDescription/product_description.dart';

import '../../../../../config/theme/custom_butt_nav_bar.dart';
import '../../tabs/profile/profile.dart';
import 'aiElevationHistory/ai_history.dart';
import 'analyticsDashboard/analytics_dashboard.dart';
import 'businessDetails/business_details.dart';
import 'businessGoals/business_goals.dart';
import 'documentsUpload/document_upload.dart';
import 'fundingProgress/funding_progress.dart';

class BusinessManagement extends StatefulWidget {
  const BusinessManagement({super.key});

  @override
  State<BusinessManagement> createState() => _BusinessManagementState();
}

class _BusinessManagementState extends State<BusinessManagement> {
  int selectedIndex = 4;

  void _onTabSelected(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF001F3F),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Business Management', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _buildSecurityItem(
              text: 'My Business',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusinessDetailsScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '📈 Analytics Dashboard',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnalyticsDashboardScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '📝 Edit Business Details',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditBusinessDetailsScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '💼 Documents Upload',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DocumentsUploadScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '📦 Product/Service Description',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductDescriptionScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '🎯 Business Goals & Milestones Tracker',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusinessGoalsScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '⏳ Funding Progress',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FundingProgressScreen()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

            _buildSecurityItem(
              text: '🧠 AI Evaluation History',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AiHistory()),
                );
              },
            ),
            const Divider(height: 24, thickness: 0.5, color: Colors.grey),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }

  Widget _buildSecurityItem({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
