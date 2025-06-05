// import 'package:flutter/material.dart';
// import 'package:investa3/core/assets_managers.dart';
// import 'package:investa3/core/colors_managers.dart';
// import 'package:investa3/presentation/screens/profile/help/help_screen.dart';
// import 'package:investa3/presentation/screens/profile/history/history_screen.dart';
// import 'package:investa3/presentation/screens/profile/notification/notification_screen.dart';
// import 'package:investa3/presentation/screens/profile/security/security_screen.dart';
// import 'package:investa3/presentation/screens/profile/settings/settigs_screen.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery values
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//     final isTablet = screenWidth > 600;
//
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
//             icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
//             onPressed: () => Navigator.pop(context), // وظيفة الرجوع
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: const Text('Profile', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isTablet ? 32 : 16,
//                 vertical: isTablet ? 30 : 20,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: isTablet ? 56 : 42,
//                     backgroundImage: AssetImage(AssetsManager.profileImage),
//                   ),
//                   SizedBox(width: isTablet ? 24 : 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Younis Mahmoud",
//                           style: TextStyle(
//                             fontSize: isTablet ? 28 : 24,
//                             fontWeight: FontWeight.bold,
//                             color: ColorsManagers.darkBlue,
//                           ),
//                         ),
//                         SizedBox(height: isTablet ? 8 : 4),
//                         Text(
//                           "0112845673",
//                           style: TextStyle(
//                             fontSize: isTablet ? 24 : 20,
//                             color: ColorsManagers.darkBlue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isTablet ? 32 : 16,
//               ),
//               child: Column(
//                 children: [
//                   _buildListTile(
//                     context,
//                     icon: Icons.settings,
//                     title: "Settings",
//                     destination: const SettingsScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.security,
//                     title: "Security",
//                     destination: const SecurityScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.history,
//                     title: "History",
//                     destination: const PaymentHistoryScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.notifications,
//                     title: "Notification",
//                     destination: const NotificationScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.help,
//                     title: "Help",
//                     destination: const HelpScreen(),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: isTablet ? 32 : 20),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isTablet ? 32 : 16,
//               ),
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // Logout action
//                 },
//                 icon: IconButton(
//                   onPressed: () {
//                     // وظيفة تسجيل الخروج
//                   },
//                   icon: Container(
//                     width: isTablet ? 40 : 32,
//                     height: isTablet ? 40 : 32,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: ClipOval(
//                       child: Image.asset(
//                         AssetsManager.logout,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 label: Text(
//                   "Logout",
//                   style: TextStyle(
//                     fontSize: isTablet ? 18 : 16,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   minimumSize: Size(
//                     double.infinity,
//                     isTablet ? 60 : 50,
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     vertical: isTablet ? 16 : 12,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: isTablet ? 32 : 20),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: 4,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         selectedLabelStyle: TextStyle(
//           fontSize: isTablet ? 14 : 12,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: isTablet ? 14 : 12,
//         ),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               size: isTablet ? 28 : 24,
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.group,
//               size: isTablet ? 28 : 24,
//             ),
//             label: "Community",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.camera_alt,
//               size: isTablet ? 28 : 24,
//             ),
//             label: "Reels",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.dashboard,
//               size: isTablet ? 28 : 24,
//             ),
//             label: "Dashboard",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               size: isTablet ? 28 : 24,
//             ),
//             label: "Profile",
//           ),
//         ],
//         onTap: (index) {
//           // Navigation logic
//         },
//       ),
//     );
//   }
//
//   Widget _buildListTile(
//       BuildContext context, {
//         required IconData icon,
//         required String title,
//         required Widget destination,
//       }) {
//     final isTablet = MediaQuery.of(context).size.width > 600;
//
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(
//         vertical: isTablet ? 16 : 8,
//       ),
//       leading: Icon(
//         icon,
//         color: ColorsManagers.darkBlue,
//         size: isTablet ? 28 : 24,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: isTablet ? 20 : 16,
//         ),
//       ),
//       trailing: Icon(
//         Icons.chevron_right,
//         size: isTablet ? 28 : 24,
//       ),
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => destination),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/presentation/screens/main_layout/main_layout.dart';
// import 'package:investa4/presentation/screens/main_layout/profile_screens/businessManagement/business_management.dart';
// import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/setting.dart';
//
// import '../../../../../core/routes_manager/colors_managers.dart';
// import '../../profile_screens/help/help_screen.dart';
// import '../../profile_screens/history/payment_history.dart';
// import '../../profile_screens/notification/notification_screen.dart';
// import '../../profile_screens/sucurity_screens/security_screen.dart';
//
// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isTablet = screenWidth > 600;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Container(
//           margin: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFF001F3F),
//           ),
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainLayout()),
//               );
//             }
//               // => Navigator.pop(context),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: const Text('Profile', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isTablet ? 32 : 16,
//                 vertical: isTablet ? 30 : 20,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: isTablet ? 56 : 42,
//                     backgroundColor: Colors.grey, // الخلفية بلون رمادي
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),  // تحديد الزوايا المستديرة
//                         border: Border.all(
//                           color: Colors.white,  // لون الحدود (اختياري)
//                           width: 4,  // سمك الحدود (اختياري)
//                         ),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),  // نفس قيمة corner radius
//                         child: Image.asset(
//                           AssetsManagers.fakhr,
//                           fit: BoxFit.cover,  // تأكد من أن الصورة تملأ المساحة بالكامل
//                         ),
//                       ),
//                     ),
//                   ),
//
//
//
//
//                   SizedBox(width: isTablet ? 24 : 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Ali Fakhr ",
//                           style: TextStyle(
//                             fontSize: isTablet ? 28 : 24,
//                             fontWeight: FontWeight.bold,
//                             // color: ColorsManagers.darkBlue,
//                           ),
//                         ),
//                         SizedBox(height: isTablet ? 8 : 4),
//                         Text(
//                           "Founder of : Fakhr ",
//                           style: TextStyle(
//                             fontSize: isTablet ? 24 : 20,
//                             // color: ColorsManagers.darkBlue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
//               child: Column(
//                 children: [
//                   _buildListTile(
//                     context,
//                     icon: Icons.settings,
//                     title: "Settings",
//                     destination: const Setting(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.security,
//                     title: "Security",
//                     destination: const SecurityScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.business_sharp,
//                     title: "Business Management ",
//                     destination: const BusinessManagement(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.history,
//                     title: "History",
//                     destination: const PaymentHistoryScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.notifications,
//                     title: "Notification",
//                     destination: const NotificationScreen(),
//                   ),
//                   const Divider(height: 1),
//                   _buildListTile(
//                     context,
//                     icon: Icons.help,
//                     title: "Help",
//                     destination: const HelpScreen(),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: isTablet ? 32 : 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   _showLogoutDialog(context);
//                 },
//                 icon: Container(
//                   width: isTablet ? 40 : 32,
//                   height: isTablet ? 40 : 32,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       AssetsManagers.logout,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 label: Text(
//                   "Logout",
//                   style: TextStyle(
//                     fontSize: isTablet ? 18 : 16,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   minimumSize: Size(double.infinity, isTablet ? 60 : 50),
//                   padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 12),
//                 ),
//               ),
//             ),
//             SizedBox(height: isTablet ? 32 : 20),
//           ],
//         ),
//       ),
//
//
//     );
//   }
//
//   Widget _buildListTile(
//       BuildContext context, {
//         required IconData icon,
//         required String title,
//         required Widget destination,
//       }) {
//     final isTablet = MediaQuery.of(context).size.width > 600;
//
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 8),
//       leading: Icon(icon, color: ColorsManagers.darkBlue, size: isTablet ? 28 : 24),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: isTablet ? 20 : 16),
//       ),
//       trailing: Icon(Icons.chevron_right, size: isTablet ? 28 : 24),
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => destination),
//       ),
//     );
//   }
//
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         backgroundColor: Colors.grey[200],
//         title: const Center(
//           child: Text(
//             "log Out",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         content: const Text(
//           "Are you sure you want to log out ?",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 14),
//         ),
//         actionsAlignment: MainAxisAlignment.spaceEvenly,
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               "Cancel",
//               style: TextStyle(color: Colors.blue, fontSize: 16),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               // Navigator.pop(context); // يقفل الديالوج
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => LoginScreen()),
//               // );
//             },
//             child: const Text(
//               "Log Out",
//               style: TextStyle(color: Colors.red, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/featurs/start_screen/presentation/start_screen.dart';
import 'package:investa4/presentation/screens/main_layout/main_layout.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/businessManagement/business_management.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/setting.dart';

import '../../profile_screens/help/help_screen.dart';
import '../../profile_screens/history/payment_history.dart';
import '../../profile_screens/notification/notification_screen.dart';
import '../../profile_screens/sucurity_screens/security_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
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
                MaterialPageRoute(builder: (context) => MainLayout()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32 : 16,
                vertical: isTablet ? 30 : 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: isTablet ? 56 : 42,
                    backgroundColor: Colors.grey, // الخلفية بلون رمادي
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // تحديد الزوايا المستديرة
                        border: Border.all(
                          color: Colors.white, // لون الحدود (اختياري)
                          width: 4, // سمك الحدود (اختياري)
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // نفس قيمة corner radius
                        child: Image.asset(
                          AssetsManagers.fakhr,
                          fit:
                              BoxFit
                                  .cover, // تأكد من أن الصورة تملأ المساحة بالكامل
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: isTablet ? 24 : 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ali Fakhr ",
                          style: TextStyle(
                            fontSize: isTablet ? 28 : 24,
                            fontWeight: FontWeight.bold,
                            // color: ColorsManagers.darkBlue,
                          ),
                        ),
                        SizedBox(height: isTablet ? 8 : 4),
                        Text(
                          "Founder of : Fakhr ",
                          style: TextStyle(
                            fontSize: isTablet ? 24 : 20,
                            // color: ColorsManagers.darkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
              child: Column(
                children: [
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers.settingIcon, // استبدال الأيقونة بصورة
                    title: "Settings",
                    destination: const Setting(),
                  ),
                  const Divider(height: 1),
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers.securityIcon2, // استبدال الأيقونة بصورة
                    title: "Security",
                    destination: const SecurityScreen(),
                  ),
                  const Divider(height: 1),
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers
                            .businessManagementIcon, // استبدال الأيقونة بصورة
                    title: "Business Management ",
                    destination: const BusinessManagement(),
                  ),
                  const Divider(height: 1),
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers.historyIcon, // استبدال الأيقونة بصورة
                    title: "History",
                    destination: const PaymentHistoryScreen(),
                  ),
                  const Divider(height: 1),
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers
                            .notificationIcon, // استبدال الأيقونة بصورة
                    title: "Notification",
                    destination: const NotificationScreen(),
                  ),
                  const Divider(height: 1),
                  _buildListTile(
                    context,
                    imageAsset:
                        AssetsManagers.helpIcon, // استبدال الأيقونة بصورة
                    title: "Help",
                    destination: const HelpScreen(),
                  ),
                ],
              ),
            ),
            SizedBox(height: isTablet ? 32 : 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: Container(
                  width: isTablet ? 40 : 32,
                  height: isTablet ? 40 : 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      AssetsManagers.logout, // استخدام الصورة بدلاً من الأيقونة
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: Text(
                  "Logout",
                  style: TextStyle(fontSize: isTablet ? 18 : 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, isTablet ? 60 : 50),
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 12),
                ),
              ),
            ),
            SizedBox(height: isTablet ? 32 : 20),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String imageAsset, // استبدال Icon بـ imageAsset
    required String title,
    required Widget destination,
  }) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 8),
      leading: Image.asset(
        imageAsset, // هنا نستخدم الصورة من الأصول
        width: isTablet ? 28 : 24,
        height: isTablet ? 28 : 24,
        fit: BoxFit.cover, // لجعل الصورة تتناسب مع المساحة
      ),
      title: Text(title, style: TextStyle(fontSize: isTablet ? 20 : 16)),
      trailing: Icon(Icons.chevron_right, size: isTablet ? 28 : 24),
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.grey[200],
            title: const Center(
              child: Text(
                "Log Out",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            content: const Text(
              "Are you sure you want to log out?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  UserMethods.removeSignedUser(ManageCurrentUser.currentUser);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => StartScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }
}
