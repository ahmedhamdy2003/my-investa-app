//
// import 'package:flutter/material.dart';
// import 'package:investa3/core/assets_managers.dart';
// import 'package:investa3/core/routes_manager/routes.dart';
//
// class Splash4 extends StatelessWidget {
//   const Splash4({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(minutes: 15), () {
//       Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center, // يمركز العناصر أفقيًا
//           crossAxisAlignment: CrossAxisAlignment.center, // يمركز العناصر عموديًا
//           children: [
//             // الصورة
//             Image.asset(
//               AssetsManager.splashLogo3,
//               width: 120, // زود العرض
//               height: 120, // زود الارتفاع
//             ),
//
//             // مسافة بين الصورة والنص
//             const SizedBox(width: 10),
//
//             // النص مع تحديد الأبعاد
//             Padding(
//               padding: const EdgeInsets.only(top: 30 ,right: 30),
//               child: SizedBox(
//                 width: 145, // عرض النص
//                 height: 60, // ارتفاع النص
//                 child: Text(
//                   "INVESTA",
//                   textAlign: TextAlign.center, // يجعل النص مركزي داخل SizedBox
//                   style: TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF001F3F),
//                   ),
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

import 'package:investa4/core/assets_managers.dart';
import 'package:investa4/core/routes_manager/routes.dart';

class Splash4 extends StatelessWidget {
  const Splash4({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splash5);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // يمركز العناصر أفقيًا
          crossAxisAlignment:
              CrossAxisAlignment.center, // يمركز العناصر عموديًا
          children: [
            // الصورة
            Image.asset(
              AssetsManagers.splashLogo3,
              width: 100, // زود العرض
              height: 120, // زود الارتفاع
            ),

            // مسافة بين الصورة والنص
            const SizedBox(width: 10),

            // النص مع تحديد الأبعاد
            const Padding(
              padding: EdgeInsets.only(top: 60, right: 30),
              child: SizedBox(
                width: 145, // عرض النص
                height: 100, // زيادة الارتفاع ليشمل النص الثاني
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // يمركز النصوص عموديًا
                  children: [
                    // النص الأول "INVESTA"
                    Text(
                      "INVESTA",
                      textAlign:
                          TextAlign.center, // يجعل النص مركزي داخل SizedBox
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF001F3F),
                      ),
                    ),

                    // مسافة بين النصين
                    SizedBox(height: 8),

                    // النص الثاني "Welcome Here!"
                    Text(
                      "Welcome Here!",
                      textAlign:
                          TextAlign.center, // يجعل النص مركزي داخل SizedBox
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFE1B530),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
