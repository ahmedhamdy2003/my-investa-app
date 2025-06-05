import 'package:flutter/material.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/featurs/founder/analytic/presentation/founder_analytics.dart';
import 'package:investa4/featurs/founder/finance/presentation/founder_finances.dart';
import 'package:investa4/featurs/founder/founder_dash/presentation/founder_dashboard.dart';
import 'package:investa4/featurs/founder/investore_manag/presentation/founder_investor_manage.dart';
import 'package:investa4/featurs/founder/product_manage/presentation/founder_product_manage.dart';
import 'package:investa4/featurs/founder/transaction/presentation/founder_transaction.dart';
import 'package:investa4/featurs/start_screen/presentation/start_screen.dart';

class FounderSideBar extends StatelessWidget {
  const FounderSideBar({super.key, required this.currentScreen});
  final FounderSideMenuScreen currentScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 50),
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
                Flexible(
                  child: IconButton(
                    icon: const Icon(Icons.logout),
                    color: mainTextColor,
                    onPressed: () {
                      UserMethods.removeSignedUser(
                        ManageCurrentUser.currentUser,
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => StartScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SideBarItem(
              title: 'Home',
              iconPath: 'assets/icon/filedHome.png',
              isSelected: currentScreen == FounderSideMenuScreen.home,
              onTap: () {
                // Handle home button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FounderDashboard()),
                );
              },
            ),
            SideBarItem(
              title: 'Transactions',
              iconPath: 'assets/icon/transaction.png',
              isSelected: currentScreen == FounderSideMenuScreen.transaction,
              onTap: () {
                // Handle transactions button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FounderTransaction()),
                );
              },
            ),
            SideBarItem(
              title: 'Analysis',
              iconPath: 'assets/icon/analytics.png',
              isSelected: currentScreen == FounderSideMenuScreen.analysis,
              onTap: () {
                // Handle analysis button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FounderAnalytics()),
                );
              },
            ),
            SideBarItem(
              title: 'Product Manage',
              iconPath: 'assets/icon/Manager.png',
              isSelected: currentScreen == FounderSideMenuScreen.productManage,
              onTap: () {
                // Handle analysis button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FounderProductManage(),
                  ),
                );
              },
            ),
            SideBarItem(
              title: 'Investor Manage',
              iconPath: 'assets/icon/Investment.png',
              isSelected: currentScreen == FounderSideMenuScreen.investorManage,
              onTap: () {
                // Handle analysis button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FounderInvestorManage(),
                  ),
                );
              },
            ),
            SideBarItem(
              title: 'Finance',
              iconPath: 'assets/icon/finances.png',
              isSelected: currentScreen == FounderSideMenuScreen.finance,
              onTap: () {
                // Handle analysis button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FounderFinance()),
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

enum FounderSideMenuScreen {
  home,
  transaction,
  analysis,
  productManage,
  finance,
  investorManage,
}
