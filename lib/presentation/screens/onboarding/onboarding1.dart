import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';

import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsManagers.curve1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Onboarding2()),
                // );
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 99,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Investa",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Container(width: 200, height: 2, color: Colors.white),
                const SizedBox(height: 10),
                const Text(
                  "Your investment starts Here!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              AssetsManagers.dollarDonation,
              width: 350,
              height: 150,
            ),
          ),
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            child: const Text(
              "“Discover simple tools and smart opportunities to grow your money with ease.”",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF001F3F)),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    print('back button clicked now');
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 25, color: Color(0xFF001F3F)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Onboarding2()),
                    );
                    print('arrow forward clicked now ');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF001F3F),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
