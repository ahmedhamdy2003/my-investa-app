import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';


import '../../../core/routes_manager/routes.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splash3);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body:Row(
        children: [
          // النصف الأيسر من الشاشة للصورة
          Container(
            width: MediaQuery.of(context).size.width / 2.5, // نصف عرض الشاشة
            color: Colors.white, // لون خلفية النصف الأيسر
            child: Center(
              child: Image.asset(
                AssetsManagers.splashLogo2,
                // لجعل الصورة تغطي المساحة المحددة
              ),
            ),
          ),
          // النصف الأيمن من الشاشة (يمكنك إضافة محتوى هنا)

        ],
      ),
    );
  }
}
