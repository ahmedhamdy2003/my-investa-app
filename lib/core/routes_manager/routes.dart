import 'package:flutter/cupertino.dart';
import 'package:investa4/featurs/reel_screen/presentation/reel_screen.dart';
import 'package:investa4/presentation/screens/main_layout/tabs/profile/profile.dart';
import 'package:investa4/presentation/screens/splash/splash.dart';

import '../../presentation/screens/main_layout/main_layout.dart';
import '../../presentation/screens/onboarding/onboarding1.dart';
import '../../presentation/screens/onboarding/onboarding3.dart';
import '../../presentation/screens/splash/splash2.dart';
import '../../presentation/screens/splash/splash3.dart';
import '../../presentation/screens/splash/splash4.dart';
import '../../presentation/screens/splash/splash5.dart';
import 'package:investa4/nasar/community_screen.dart';
import 'package:investa4/nasar/dashboard_screen.dart';
import 'package:investa4/nasar/home_screen.dart';
import 'package:investa4/nasar/interests_screen.dart';
import 'package:investa4/nasar/save_screen.dart';
import 'package:investa4/nasar/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String splash2 = '/splash2';
  static const String splash3 = '/splash3';
  static const String splash4 = '/splash4';
  static const String splash5 = '/splash5';
  static const String loading = '/loading';
  static const String mainLayout = '/mainLayout';
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String onboarding3 = '/onboarding13';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const Splash(),
    splash2: (_) => const Splash2(),
    splash3: (_) => const Splash3(),
    splash4: (_) => const Splash4(),
    splash5: (_) => const Splash5(),
    mainLayout: (_) => const MainLayout(),
    onboarding1: (_) => const Onboarding1(),
    onboarding2: (_) => const Onboarding1(),
    onboarding3: (_) => const Onboarding3(),
    profile: (_) => const Profile(),
    '/investor_interests': (ctx) => const InterestsScreen(),
    '/investor_home': (ctx) => const HomeScreen(),
    '/investor_saved':
        (ctx) =>
            const SaveScreen(), // Make sure savedItems is handled correctly if it's required
    '/investor_community': (ctx) => const CommunityScreen(),
    '/investor_reels': (ctx) => const ReelScreen(),
    '/investor_dashboard': (ctx) => const DashboardScreen(),
    '/investor_profile': (ctx) => const Profile(),
    '/welcome_screen': (ctx) => const WelcomeScreen(),
  };
}
