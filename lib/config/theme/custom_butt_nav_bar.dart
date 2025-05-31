// // // import 'package:flutter/material.dart';
// // // import 'package:investa4/core/assets_managers.dart';
// // // import 'package:investa4/core/routes_manager/colors_managers.dart';
// // //
// // // class CustomBottomNavBar extends StatelessWidget {
// // //   final int selectedIndex ;
// // //   final Function(int) onTap;
// // //
// // //   const CustomBottomNavBar({
// // //     super.key,
// // //     required this.selectedIndex,
// // //     required this.onTap,
// // //   });
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BottomNavigationBar(
// // //       backgroundColor: ColorsManagers.white,
// // //       currentIndex: selectedIndex,
// // //       type: BottomNavigationBarType.fixed,
// // //       onTap: onTap,
// // //       items: const [
// // //         BottomNavigationBarItem(
// // //           icon: ImageIcon(AssetImage(AssetsManagers.homeIcon)),
// // //           label: "Home",
// // //         ),
// // //         BottomNavigationBarItem(
// // //           icon: ImageIcon(AssetImage(AssetsManagers.communityIcon)),
// // //           label: "Community",
// // //         ),
// // //
// // //         BottomNavigationBarItem(
// // //           icon: ImageIcon(AssetImage(AssetsManagers.dashBoardIcon)),
// // //           label: "Dashboard",
// // //         ),
// // //         BottomNavigationBarItem(
// // //
// // //           icon: ImageIcon(AssetImage(AssetsManagers.profileIcon)),
// // //           label: "Profile",
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../../core/assets_managers.dart';
// // import '../../core/routes_manager/colors_managers.dart';
// //
// // class CustomBottomNavBar extends StatelessWidget {
// //   final int selectedIndex;
// //   final Function(int) onTap;
// //
// //   const CustomBottomNavBar({
// //     super.key,
// //     required this.selectedIndex,
// //     required this.onTap,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 1.0), // تعديل المسافة بين العناصر
// //       child: BottomNavigationBar(
// //         backgroundColor: ColorsManagers.white,
// //         currentIndex: selectedIndex,
// //         type: BottomNavigationBarType.fixed,
// //         onTap: onTap,
// //         iconSize: 24.0, // حجم الأيقونات
// //         selectedFontSize: 12.0, // حجم النص المحدد
// //         unselectedFontSize: 12.0, // حجم النص غير المحدد
// //         items: const [
// //           BottomNavigationBarItem(
// //             icon: ImageIcon(AssetImage(AssetsManagers.homeIcon)),
// //             label: "Home",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: ImageIcon(AssetImage(AssetsManagers.communityIcon)),
// //             label: "Community",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: ImageIcon(AssetImage(AssetsManagers.dashBoardIcon)),
// //             label: "Dashboard",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: ImageIcon(AssetImage(AssetsManagers.profileIcon)),
// //             label: "Profile",
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: ColorsManagers.white,
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 0,
//       elevation: 0,
//       child: SizedBox(
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildNavItem(iconPath: AssetsManagers.homeIcon, index: 0, label: 'Home'),
//             _buildNavItem(iconPath: AssetsManagers.communityIcon, index: 1, label: 'Community'),
//             const SizedBox(width: 40), // Space for FAB
//             _buildNavItem(iconPath: AssetsManagers.dashBoardIcon, index: 3, label: 'Dashboard'),
//             _buildNavItem(iconPath: AssetsManagers.profileIcon, index: 4, label: 'Profile'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNavItem({
//     required String iconPath,
//     required int index,
//     required String label,
//   }) {
//     final isSelected = selectedIndex == index;
//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ImageIcon(
//             AssetImage(iconPath),
//             size: 24,
//             color: isSelected ? ColorsManagers.blue : Colors.grey,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               color: isSelected ? ColorsManagers.blue : Colors.grey,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorsManagers.white,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManagers.blue,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetsManagers.homeIcon),
            color: selectedIndex == 0 ? ColorsManagers.blue : Colors.grey,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetsManagers.communityIcon),
            color: selectedIndex == 1 ? ColorsManagers.blue : Colors.grey,
          ),
          label: "Community",
        ), BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetsManagers.communityIcon),
            color: selectedIndex == 1 ? ColorsManagers.blue : Colors.grey,
          ),
          label: "ٌReels",
        ),

        // BottomNavigationBarItem(
        //   icon: SizedBox.shrink(),
        //   label: "", // This is just a space for the floating button
        // ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetsManagers.dashBoardIcon),
            color: selectedIndex == 3 ? ColorsManagers.blue : Colors.grey,
          ),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetsManagers.profileIcon),
            color: selectedIndex == 4 ? ColorsManagers.blue : Colors.grey,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
