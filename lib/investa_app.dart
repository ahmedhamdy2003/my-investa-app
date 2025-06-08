
import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';
import 'package:investa4/core/routes_manager/routes.dart';
import 'package:investa4/core/utils/global_variables.dart';

class InvestaApp extends StatelessWidget {
  const InvestaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: ColorsManagers.blue,
          unselectedItemColor: ColorsManagers.gray,
          selectedIconTheme: IconThemeData(
            size: 30,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
