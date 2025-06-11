import 'package:flutter/material.dart';
import 'package:investa4/nasar/Registration_screen.dart';
// import 'package:investa4/home_screen.dart'; // افترض ان شاشة Home Screen هنا
// import 'package:investa4/user_management.dart'; // افترض ان ManageCurrentUser موجود هنا

// افتراض وجود كلاس ManageCurrentUser و HomeScreen لغرض الكود
class ManageCurrentUser {
  static final ManageCurrentUser _instance = ManageCurrentUser._internal();
  factory ManageCurrentUser() => _instance;
  ManageCurrentUser._internal();

  // مثال مبسط جداً لـ current user
  var currentUser = CurrentUser(guid: 'user_123');
}

class CurrentUser {
  final String guid;
  CurrentUser({required this.guid});
}

// افترض ان شاشة Home Screen موجودة هنا
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
// نهاية الافتراضات

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  // تم تغيير القيمة الأولية إلى false عشان تظهر شاشة التحميل في البداية
  bool isInitFinih = false;

  @override
  void initState() {
    super.initState();
    initMethod();
  }

  initMethod() async {
    // 1. الحصول على user id
    String? userId = ManageCurrentUser().currentUser.guid;
    print("User ID: $userId"); // لطباعة الـ user ID في الـ debug console

    // 2. محاكاة التحقق من الـ backend
    // في الكود الحقيقي، هتحتاج تعمل هنا HTTP request للـ backend
    // وتنتظر الاستجابة عشان تعرف userHasData
    await Future.delayed(
      const Duration(seconds: 3),
    ); // محاكاة لتاخير الـ network request

    // 3. هنا المفروض تيجي استجابة الـ backend اللي بتقولك userHasData
    // لغرض التجربة، هنفترض أن المستخدم ليس لديه بيانات (لم يكمل الـ setup)
    bool userHasData =
        false; // ***** غيّر القيمة دي لـ `true` عشان تجرب حالة الانتقال للـ Home Screen *****

    if (userHasData) {
      // 4. لو المستخدم كمل الـ setup: الانتقال لشاشة Home Screen
      // استخدم pushReplacement عشان متقدرش ترجع لشاشة الـ Setup بالـ back button
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // 5. لو المستخدم لم يكمل الـ setup: عرض شاشة Setup (تحديث isInitFinih)
      setState(() {
        isInitFinih = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ManageCurrentUser.currentUser.guid;  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          isInitFinih == false
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
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
                    _buildStep(
                      "1",
                      "Financial Assessment",
                      "Help us to know you more so you can invest easily.",
                      true,
                    ),
                    _buildStep(
                      "2",
                      "Account Verification",
                      "Complete the steps to be verified.",
                      true,
                    ),
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
                        // هنا تم التعديل: الانتقال لشاشة RegistrationScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
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
    String number,
    String title,
    String subtitle,
    bool hasDivider,
  ) {
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
                      border: Border.all(
                        color: const Color(0xffAEB7C1),
                        width: 4,
                      ),
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
