// import 'package:flutter/material.dart';
// import 'package:investa3/core/assets_managers.dart';
// import 'package:investa3/core/routes_manager/routes.dart';
//
// class Splash3 extends StatelessWidget {
//   const Splash3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacementNamed(context, AppRoutes.splash4);
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center, // يخلي النص في وسط الصورة تمامًا
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               AssetsManager.splashLogo3,
//               // fit: BoxFit.fill,
//               width: 120, // زود العرض
//               height: 120, // زود الارتفاع
//             ),
//
//             const SizedBox(width: 10),
//             const Text(
//               "INVESTA",
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF001F3F),
//               ),
//             ),
//           ],
//         )
//
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:investa3/core/assets_managers.dart';
// import 'package:investa3/core/routes_manager/routes.dart';
//
// class Splash3 extends StatelessWidget {
//   const Splash3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(minutes: 15), () {
//       Navigator.pushReplacementNamed(context, AppRoutes.splash4);
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.amber,
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
//             // النص
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Text(
//                 "INVESTA",
//                 style: TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF001F3F),
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
import 'package:investa4/core/routes_manager/colors_managers.dart';

import '../../../core/routes_manager/routes.dart';

class Splash3 extends StatelessWidget {
  const Splash3({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splash4);
    });

    return Scaffold(
      backgroundColor: ColorsManagers.yellow12,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // يمركز العناصر أفقيًا
          crossAxisAlignment:
              CrossAxisAlignment.center, // يمركز العناصر عموديًا
          children: [
            // الصورة
            Image.asset(
              AssetsManagers.splashLogo3,
              width: 120, // زود العرض
              height: 120, // زود الارتفاع
            ),

            // مسافة بين الصورة والنص
            const SizedBox(width: 10),

            // النص مع تحديد الأبعاد
            const Padding(
              padding: EdgeInsets.only(top: 30, right: 30),
              child: SizedBox(
                width: 145, // عرض النص
                height: 60, // ارتفاع النص
                child: Text(
                  "INVESTA",
                  textAlign: TextAlign.center, // يجعل النص مركزي داخل SizedBox
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F3F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
