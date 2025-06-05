// // // import 'package:flutter/material.dart';
// // // import 'package:investa4/core/assets_managers.dart';
// // // import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
// // // import 'package:investa4/presentation/screens/main_layout/tabs/dashBoard/dashBoard.dart';
// // // import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
// // // import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
// // // import 'package:investa4/presentation/screens/main_layout/tabs/reels/reels.dart';
// // //
// // // import '../../../core/routes_manager/colors_managers.dart';
// // //
// // // class MainLayout extends StatefulWidget {
// // //    MainLayout({super.key});
// // //
// // //   List<Widget> tabs = [
// // //     Home(),
// // //     Community(),
// // //     Reels(),
// // //     Dashboard(),
// // //     Profile(),
// // //
// // //   ];
// // //
// // //   @override
// // //   State<MainLayout> createState() => _MainLayoutState();
// // // }
// // //
// // // class _MainLayoutState extends State<MainLayout> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //
// // //       body: tabs[],
// // //       bottomNavigationBar: buildBottomNavBar(),
// // //
// // //     );
// // //   }
// // //
// // //   Widget buildBottomNavBar(){
// // // return BottomNavigationBar(
// // //   onTap: (tappedIndex){
// // //     print(tappedIndex);
// // //   },
// // //
// // //     items:[
// // //       BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManagers.homeIcon)), label: "Home" ,),
// // //       BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManagers.communityIcon)), label: "Community"),
// // //       BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManagers.reelsIcon)), label: "Reels"),
// // //       BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManagers.dashBoardIcon)), label: "Dashboard"),
// // //       BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManagers.profileIcon)), label: "Profile"),
// // //
// // //
// // //
// // //
// // //
// // //     ]
// // // );
// // //   }
// // // }
// //
// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/dashBoard/dashBoard.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/reels/reels.dart';
//
// import '../../../core/routes_manager/colors_managers.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int selectedIndex = 0;
//
//   final List<Widget> tabs = [
//     Home(),
//     Community(),
//     Reels(),
//     Dashboard(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[selectedIndex],
//       bottomNavigationBar: buildBottomNavBar(),
//     );
//   }
//
//   Widget buildBottomNavBar() {
//     return BottomNavigationBar(
//       backgroundColor: ColorsManagers.white,
//       currentIndex: selectedIndex,
//       type: BottomNavigationBarType.fixed,
//       onTap: (tappedIndex) {
//         setState(() {
//           selectedIndex = tappedIndex;
//         });
//       },
//       items: [
//         BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(AssetsManagers.homeIcon)),
//             label: "Home"),
//         BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(AssetsManagers.communityIcon)),
//             label: "Community"),
//         BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(AssetsManagers.reelsIcon3,)),
//             label: "Reels",),
//         BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(AssetsManagers.dashBoardIcon)),
//             label: "Dashboard"),
//         BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(AssetsManagers.profileIcon)),
//             label: "Profile"),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/dashBoard/dashBoard.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/reels/reels.dart';
//
// import '../../../core/routes_manager/colors_managers.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int selectedIndex = 0;
//
//   final List<Widget> tabs = [
//     Home(),
//     Community(),
//     // Reels(),
//     Dashboard(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){},
//       shape: StadiumBorder(side: BorderSide(color: ColorsManagers.darkBlue,width: 4)),
// child: const Icon(Icons.add),
//       ),
//       body: tabs[selectedIndex],
//       bottomNavigationBar: buildBottomNavBar(),
//     );
//   }
//
//   Widget buildBottomNavBar() {
//     return BottomNavigationBar(
//       backgroundColor: ColorsManagers.white,
//       currentIndex: selectedIndex,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.blue, // اللون المختار
//       unselectedItemColor: Colors.grey, // اللون الغير مختار
//       onTap: (tappedIndex) {
//         if (tappedIndex != selectedIndex) {
//           setState(() {
//             selectedIndex = tappedIndex;
//           });
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(AssetsManagers.homeIcon),
//             color: selectedIndex == 0 ? Colors.blue : Colors.grey,
//           ),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(AssetsManagers.communityIcon),
//             color: selectedIndex == 1 ? Colors.blue : Colors.grey,
//           ),
//           label: "Community",
//         ),
//         // BottomNavigationBarItem(
//         //   icon: ImageIcon(
//         //     AssetImage(AssetsManagers.reelsIcon3),
//         //     color: selectedIndex == 2 ? Colors.blue : Colors.grey,
//         //   ),
//         //   label: "Reels",
//         // ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(AssetsManagers.dashBoardIcon),
//             color: selectedIndex == 3 ? Colors.blue : Colors.grey,
//           ),
//           label: "Dashboard",
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(AssetsManagers.profileIcon),
//             color: selectedIndex == 4 ? Colors.blue : Colors.grey,
//           ),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/dashBoard/dashBoard.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/reels/reels.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int selectedIndex = 0;
//
//   final List<Widget> tabs = [
//     Home(),
//     Community(),
//     Reels(),
//     Dashboard(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             selectedIndex = 2; // دايريكت تروح على Reels لما تضغط
//           });
//         },
//         shape: StadiumBorder(
//           side: BorderSide(color: ColorsManagers.darkBlue, width: 4),
//         ),
//         backgroundColor: ColorsManagers.darkBlue,
//         child: Image.asset(
//           AssetsManagers.reelsIcon,
//           width: 24,
//           height: 24,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: tabs[selectedIndex],
//       bottomNavigationBar: buildBottomNavBar(),
//     );
//   }
//
//   Widget buildBottomNavBar() {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8.0,
//       child: BottomNavigationBar(
//         backgroundColor: ColorsManagers.white,
//         currentIndex: selectedIndex > 2 ? selectedIndex - 1 : selectedIndex, // عشان الريلز في النص
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: (tappedIndex) {
//           setState(() {
//             selectedIndex = tappedIndex >= 2 ? tappedIndex + 1 : tappedIndex;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(AssetsManagers.homeIcon),
//               color: selectedIndex == 0 ? Colors.blue : Colors.grey,
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(AssetsManagers.communityIcon),
//               color: selectedIndex == 1 ? Colors.blue : Colors.grey,
//             ),
//             label: "Community",
//           ),
//           // مكان فاضي لـ FAB (Reels)
//           BottomNavigationBarItem(
//             icon: SizedBox.shrink(),
//             label: "Reels",
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(AssetsManagers.dashBoardIcon),
//               color: selectedIndex == 3 ? Colors.blue : Colors.grey,
//             ),
//             label: "Dashboard",
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(AssetsManagers.profileIcon),
//               color: selectedIndex == 4 ? Colors.blue : Colors.grey,
//             ),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/dashBoard/dashBoard.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
// import 'package:investa4/presentation/screens/main_layout/tabs/reels/reels.dart';
//
// import '../../../config/theme/custom_butt_nav_bar.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key, });
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int selectedIndex = 0;
//
//   final List<Widget> tabs = [
//     Home(),
//     Community(),
//     Reels(),
//     Dashboard(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[selectedIndex],
//       floatingActionButton: SizedBox(
//         height: 64,
//         width: 64,
//         child: FloatingActionButton(
//           elevation: 0,
//           onPressed: () {
//             setState(() {
//               selectedIndex = 2; // Reels
//             });
//           },
//           backgroundColor: ColorsManagers.darkBlue,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//             side: BorderSide(color: ColorsManagers.darkBlue, width: 3),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Image.asset(
//               AssetsManagers.reelsIcon,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: CustomBottomNavBar(
//         selectedIndex: selectedIndex,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
//
//   Widget buildNavItem({
//     required String iconPath,
//     required int index,
//     required String label,
//   }) {
//     final isSelected = selectedIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
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

import 'package:flutter/material.dart';
import 'package:investa4/featurs/dashboard/presentation/dashboard.dart';
import 'package:investa4/featurs/reel_screen/presentation/reel_screen.dart';
import 'package:investa4/presentation/screens/main_layout/tabs/community/community.dart';
import 'package:investa4/presentation/screens/main_layout/tabs/home/home.dart';
import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';

import '../../../config/theme/custom_butt_nav_bar.dart';
import '../../../core/assets_managers.dart';
import '../../../core/routes_manager/colors_managers.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  static const int _reelsTabIndex = 2;

  final List<Widget> tabs = [
    Home(),
    Community(),
    ReelScreen(),
    Dashboard(),
    Profile(),
  ];

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
      body: SafeArea(child: IndexedStack(index: selectedIndex, children: tabs)),
      floatingActionButton: SizedBox(
        height: 62,
        width: 62,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () => _onTabSelected(_reelsTabIndex),
          backgroundColor: ColorsManagers.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: ColorsManagers.darkBlue, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(AssetsManagers.reelsIcon, fit: BoxFit.contain),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
