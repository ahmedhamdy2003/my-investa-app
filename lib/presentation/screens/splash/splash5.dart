import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';

import '../../../core/routes_manager/routes.dart';


class Splash5 extends StatelessWidget {
  const Splash5({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding1);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManagers.loading, height: 116, width: 126, fit: BoxFit.contain),
            Text('Great, Enjoy Your Journey'),
          ],
        ),
      ),
    );
  }
}
