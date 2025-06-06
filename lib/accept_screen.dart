import 'package:flutter/material.dart';
import 'phaseTwo_screen.dart'; // متأكد إن الملف موجود عندك

class AcceptScreen extends StatelessWidget {
  const AcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _PageOne(),
      _PageTwo(),
      _PageThree(),
    ];

    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: 30,
          child: Image.asset(
            'assets/blue_shape.png',
            width: 240,
            height: 250,
          ),
        ),
        Positioned(
          top: 38,
          right: -10,
          child: Image.asset(
            'assets/dark_shape.png',
            width: 80,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/shape.png',
            width: 240,
          ),
        ),
      ],
    );
  }
}

class _PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundHeader(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 270, 20, 20), // تحت الصور على طول
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // بادئ من الشمال
              children: [
                Text(
                  'Subject: Congratulations! Your project has been accepted on our platform 🚀',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF082347),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Dear Norhan Salah,\n\nThank you for submitting your project, zerosugar by ketonista, through our platform.\n\nAfter reviewing and evaluating your data using our AI and analysis team, we are pleased to inform you that your project has been accepted.\n\n✅ Next steps:\nPlease log into your account to confirm your acceptance and begin setting up your page for investors within 3 days.\n\nIf you do not confirm within this period, your application will be automatically suspended.\n\nBest wishes,\nInvesta Team',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundHeader(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 270, 20, 20), // تحت الصور على طول
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // بادئ من الشمال
              children: [
                Text(
                  '🚀 Welcome to the first real step toward funding your project!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF082347),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We know you’ve worked hard and put in a lot of effort to build your project from the ground up. That’s why this platform exists—to open doors to opportunities and connect you with interested investors who want to support you.\n\nBut before we reach this stage, we need you to go through 3 key phases. Each phase is designed to help you clarify the full picture of your project—not only to convince investors but also to protect yourself, safeguard the platform, and start strong with transparency.\n\n✍️ The information you provide isn’t just numbers—it’s about building trust and qualifying you for real funding opportunities.\n\n💕 Take your time, prepare your answers.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundHeader(),
        Padding(
          padding:
              const EdgeInsets.fromLTRB(20, 270, 20, 20), // تحت الصور على طول
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // بادئ من الشمال
              children: [
                const Text(
                  'Phase 1:\nSubmitting in the platform and getting your Acceptance.\n(you already done it)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Phase 2:\nAssigning your data so that the team could help you to put the best model and plan so that the investor be more aware',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Color(0xFF082347),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Phase 3:\nThe most important and critical phase and Assigning the Legal Requirements to make the investor and platform be more clarified and feel more safe.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Color(0xFF082347),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 316,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhaseTwoScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF082347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
