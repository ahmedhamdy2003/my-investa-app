import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/featurs/analysis/presentation/analysis.dart';
import 'package:investa4/featurs/dashboard/presentation/dashboard.dart';
import 'package:investa4/featurs/investment/presentation/investment.dart';
import 'package:investa4/featurs/transactions/presentation/transactions.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.currentScreen});
  final SideMenuScreen currentScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/invistaLogo.png',
                      height: 70,
                      width: 70,
                    ),
                    Text('INVESTA', style: AppStyles.invistaTopSectionStyle),
                  ],
                ),
                // Flexible(
                //   child: IconButton(
                //     icon: const Icon(Icons.logout),
                //     color: mainTextColor,
                //     onPressed: () {
                //       UserMethods.removeSignedUser(
                //         ManageCurrentUser.currentUser,
                //       );
                //       Navigator.of(context).pushAndRemoveUntil(
                //         MaterialPageRoute(builder: (context) => StartScreen()),
                //         (Route<dynamic> route) => false,
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 30),
            SideBarItem(
              title: 'Home',
              iconPath: 'assets/icon/filedHome.png',
              isSelected: currentScreen == SideMenuScreen.home,
              onTap: () {
                // Handle home button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            SideBarItem(
              title: 'Investment',
              iconPath: 'assets/icon/Investment.png',
              isSelected: currentScreen == SideMenuScreen.investment,
              onTap: () {
                // Handle investment button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Investment()),
                );
              },
            ),
            SideBarItem(
              title: 'Transactions',
              iconPath: 'assets/icon/transaction.png',
              isSelected: currentScreen == SideMenuScreen.transaction,
              onTap: () {
                // Handle transactions button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Treansactions()),
                );
              },
            ),
            SideBarItem(
              title: 'Analysis',
              iconPath: 'assets/icon/analytics.png',
              isSelected: currentScreen == SideMenuScreen.analysis,
              onTap: () {
                // Handle analysis button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Analysis()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    required this.isSelected,
  });
  final String title;
  final String iconPath;
  final bool isSelected; // Default value for isSelected
  final Function()? onTap; // Optional callback for tap action
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? sideMenuSelectItemColor : Colors.transparent,
          ),
          child: Row(
            children: [
              Image.asset(iconPath, height: 40, width: 40),
              const SizedBox(width: 10),
              Text(title, style: AppStyles.sideMenuStyle),
            ],
          ),
        ),
      ),
    );
  }
}

enum SideMenuScreen { home, investment, transaction, analysis }
