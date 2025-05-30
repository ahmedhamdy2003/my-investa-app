import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace SpinKitWave with SpinKitThreeBounce for three rotating dots animation
            SpinKitThreeBounce(
              color: Color(0xff001F3F), // Dark blue color
              size: 50.0, // Adjust the size as needed
            ),
            SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: "Great, Enjoy Your ",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff001F3F),
                ),
                children: [
                  TextSpan(
                    text: "Journey",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff001F3F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
  ));
}
