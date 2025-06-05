import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  shadows: [textShadow()],
                ),
                Text('Reels', style: AppStyles.simiBold16White),
                Icon(Icons.add, color: Colors.white, shadows: [textShadow()]),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text('Get Experience', style: AppStyles.simiBold16White),
                    Positioned(
                      bottom: 0, // Adjust spacing between text and underline
                      child: Container(
                        width: 120, // Adjust width according to text
                        height: 2, // Thickness of underline
                        // color: Colors.white, // Color of underline
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0.1,
                              offset: Offset(.1, .1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Business', style: AppStyles.simiBold16White),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
