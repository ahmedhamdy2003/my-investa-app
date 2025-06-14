// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/nasar/founderHome_screen.dart';
import 'package:investa4/nasar/home_screen.dart';
import 'package:investa4/nasar/setup_screen.dart';

import '../../../core/routes_manager/routes.dart';

class Splash5 extends StatefulWidget {
  const Splash5({super.key});

  @override
  State<Splash5> createState() => _Splash5State();
}

class _Splash5State extends State<Splash5> {
  @override
  initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      UserModel? signedUser = UserMethods.getSignedUser();
      if (signedUser != null) {
        ManageCurrentUser.currentUser = signedUser;
        // UserMethods.removeSignedUser(ManageCurrentUser.currentUser);
      }

      if (signedUser != null) {
        if (signedUser.userIsFounder == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => const FounderHomeScreen(projectId: 'asksiwwk'),
            ),
          );
          return;
        } else if (signedUser.userIsFounder == false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SetupScreen()),
          // MaterialPageRoute(builder: (context) => const MainLayout()),
        );
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManagers.loading,
              height: 116,
              width: 126,
              fit: BoxFit.contain,
            ),
            const Text('Great, Enjoy Your Journey'),
          ],
        ),
      ),
    );
  }
}
