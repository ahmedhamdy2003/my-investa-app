import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/featurs/dashboard/presentation/dashboard.dart';
import 'package:investa4/featurs/founder/founder_dash/presentation/founder_dashboard.dart';
import 'package:investa4/featurs/login_screen/presentation/login_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/reel_screen.dart';
import 'package:investa4/featurs/sign_up_screen/presentation/sign_up_screen.dart';
import 'package:investa4/featurs/transactions/presentation/transactions.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.video_collection_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReelScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ReelScreen(),
                //   ),
                // );
                customSnackBar(context, 'This feature is coming soon!');
              },
            ),
            IconButton(
              icon: const Icon(Icons.personal_injury_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FounderDashboard()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.dashboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.transcribe),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Treansactions()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                Image.asset('assets/images/logo.png'),
                Positioned.fill(
                  top: size.height * 0.24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Welcome Back!', style: AppStyles.text19)],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabMainText(
                  text: 'Sign up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account already? ',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TabMainText(
                      text: 'Login ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter as a ',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TabMainText(
                      text: 'Guest ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset('assets/images/bubble 02.png'),
          Positioned(
            right: 0,
            top: size.height * 0.2,
            child: Image.asset('assets/images/bubblle 03.png'),
          ),
        ],
      ),
    );
  }
}

class TabMainText extends StatelessWidget {
  const TabMainText({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Text(text, style: AppStyles.mainText));
  }
}

void customSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(8),
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 3), () => overlayEntry.remove());
}
