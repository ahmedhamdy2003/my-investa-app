import 'package:first_page/community_screen.dart';
import 'package:first_page/dashboard_screen.dart';
import 'package:first_page/home_screen.dart';
import 'package:first_page/interests_screen.dart';
import 'package:first_page/profile_screen.dart';
import 'package:first_page/reels_screen.dart';
import 'package:first_page/save_screen.dart';
import 'package:first_page/welcome_screen.dart';
import 'package:flutter/material.dart';

// --- Imports from the first project's main.dart ---
// تأكد أن هذا المسار صحيح لشاشة التسجيل
import 'package:first_page/Registration_screen.dart';

// --- Imports from the second project's main.dart ---
// Assuming these paths are correct relative to your lib folder

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investa', // Taking title from the second project's main
      theme: ThemeData(
        // Taking theme from the second project's main
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        fontFamily: 'Arial',
      ),
      // Set SetupScreen as the initial screen as requested
      home: SetupScreen(),

      // Combine routes from both projects.
      // Note: SetupScreen's internal navigation is handled directly via Navigator.push
      // The routes defined here are for global navigation if needed.
      routes: {
        // Routes from the second project (investor app)
        // Ensure these paths are consistent with your file structure (e.g., 'lib/community_screen.dart')
        // Using distinct names to avoid clashes if any
        '/investor_interests': (ctx) => InterestsScreen(),
        '/investor_home': (ctx) => HomeScreen(),
        '/investor_saved': (ctx) => SaveScreen(
            savedItems: const []), // Make sure savedItems is handled correctly if it's required
        '/investor_community': (ctx) => CommunityScreen(),
        '/investor_reels': (ctx) => ReelsScreen(),
        '/investor_dashboard': (ctx) => DashboardScreen(),
        '/investor_profile': (ctx) => ProfileScreen(),
        '/welcome_screen': (ctx) =>
            const WelcomeScreen(), // Added explicitly if you might navigate back to WelcomeScreen via routes
        // You might also want to add a route for RegistrationScreen here if you want to navigate to it via named routes from other parts of the app,
        // but SetupScreen's internal navigation already handles it directly.
        // '/registration_screen': (ctx) => RegistrationScreen(),
      },
    );
  }
}

// الكود الخاص بـ SetupScreen زي ما هو بالظبط مع التعديل المطلوب
// For better project structure, consider moving this to a separate file like `lib/setup_screen.dart`
class SetupScreen extends StatelessWidget {
  // It's good practice to make the constructor const if the widget is stateless and its properties are final
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Great, Let's Setup your account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff001F3F),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "To complete your registration process, you will need to fill",
                style: TextStyle(color: Color(0xff001F3F)),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 30),
            _buildStep("1", "Financial Assessment",
                "Help us to know you more so you can invest easily.", true),
            _buildStep("2", "Account Verification",
                "Complete the steps to be verified.", true),
            _buildStep("3", "Start to Explore & Invest", "", false),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff001F3F),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // **هنا تم التعديل**: الانتقال لشاشة RegistrationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Enter as a Guest",
                style: TextStyle(color: Color(0xff001F3F)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
      String number, String title, String subtitle, bool hasDivider) {
    bool isFirstStep = number == "1"; // Check if it's the first step

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // First step gets a circular border
                if (isFirstStep)
                  Container(
                    width: 48, // Slightly larger than avatar
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xffAEB7C1), width: 4),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff7A899A),
                    radius: 20, // Ensures all circles have the same radius
                    child: Text(
                      number,
                      style: const TextStyle(
                        color: Color(0xff001F3F),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (hasDivider)
              Container(
                width: 1.5,
                height: 70, // Adjust the height for perfect spacing
                color: const Color(0xffC1C1C1),
              ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff001F3F),
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xff001F3F),
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
