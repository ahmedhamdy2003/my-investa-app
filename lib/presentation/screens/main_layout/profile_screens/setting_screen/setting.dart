import 'package:flutter/material.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/password/password.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/phone/phone.dart';

import 'deleted_account/deleted_account.dart';
import 'email/email.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

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
        title: const Text('Setting', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // مسافة بين العنوان والمحتوى
            const SizedBox(height: 20),

            // قائمة الخيارات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // البريد الإلكتروني
                  ListTile(
                    // leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text("Email"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmailUpdateForm(),
                        ),
                      );
                    },
                  ),

                  // خط فاصل
                  const Divider(),

                  // كلمة المرور
                  ListTile(
                    // leading: const Icon(Icons.lock, color: Colors.green),
                    title: const Text("Password"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordChangeScreen(),
                        ),
                      );
                    },
                  ),

                  // خط فاصل
                  const Divider(),

                  // رقم الهاتف
                  ListTile(
                    // leading: const Icon(Icons.phone, color: Colors.orange),
                    title: const Text("Phone"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneNumberUpdateScreen(),
                        ),
                      );
                    },
                  ),

                  // خط فاصل
                  const Divider(),
                ],
              ),
            ),

            // مسافة بين القائمة وخيار حذف الحساب
            const SizedBox(height: 20),

            // خيار حذف الحساب
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteAccountScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey, // لون النص أحمر
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/password/password.dart';
// import 'package:investa4/presentation/screens/main_layout/profile_screens/setting_screen/phone/phone.dart';
//
// import '../../../../../config/theme/custom_butt_nav_bar.dart';
// import '../../main_layout.dart';
// import 'deleted_account/deleted_account.dart';
// import 'email/email.dart';
//
// class Setting extends StatefulWidget {
//   const Setting({super.key});
//
//   @override
//   State<Setting> createState() => _SettingState();
// }
//
// class _SettingState extends State<Setting> {
//   int selectedIndex = 4; // بما إننا في Profile section
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFF001F3F),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: const Text('Setting', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text("Email"),
//                     trailing: const Icon(Icons.chevron_right),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EmailUpdateForm()),
//                       );
//                     },
//                   ),
//                   const Divider(),
//                   ListTile(
//                     title: const Text("Password"),
//                     trailing: const Icon(Icons.chevron_right),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => PasswordChangeScreen()),
//                       );
//                     },
//                   ),
//                   const Divider(),
//                   ListTile(
//                     title: const Text("Phone"),
//                     trailing: const Icon(Icons.chevron_right),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => PhoneNumberUpdateScreen()),
//                       );
//                     },
//                   ),
//                   const Divider(),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const DeleteAccountScreen()),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.grey,
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text(
//                   "Delete Account",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: CustomFAB(
//         onPressed: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MainLayout(initialIndex: 2),
//             ),
//           );
//         },
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: CustomBottomNavBar(
//         selectedIndex: selectedIndex,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//
//           // هنا لو عايز تروح لصفحة تانية based on index:
//           // Navigator.pushReplacement() لو تحب
//         },
//       ),
//     );
//   }
// }
//
//
