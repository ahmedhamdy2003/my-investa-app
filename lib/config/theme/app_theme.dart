import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class AppTheme{




  static final ThemeData light = ThemeData(
  useMaterial3: false,
    scaffoldBackgroundColor: ColorsManagers.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManagers.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManagers.blue,
      unselectedItemColor: ColorsManagers.gray,
    )


  );


}