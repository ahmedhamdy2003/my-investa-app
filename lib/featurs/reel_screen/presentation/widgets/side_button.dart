import 'package:flutter/material.dart';
import 'package:investa4/featurs/reel_screen/manager/manage_reels_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/reel_button.dart';

class SideBottonsBar extends StatelessWidget {
  const SideBottonsBar({super.key, required this.manageCommentAnimation});
  final ManageReelsScreen manageCommentAnimation;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReelButton(
            iconChild: Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.person, color: Colors.green, size: 24),
            ),
          ),
          const SizedBox(height: 16),
          ReelButton(
            iconChild: Image.asset('assets/icon/HeartIcon.png'),
            desc: '100',
          ),
          const SizedBox(height: 16),

          // Comment
          ReelButton(
            onTap: () {
              manageCommentAnimation.openDrawer();
            },
            iconChild: Image.asset('assets/icon/MessageIcon.png'),
            desc: '100',
          ),
          const SizedBox(height: 16),
          ReelButton(
            iconChild: Image.asset('assets/icon/ShareIcon.png'),
            desc: 'share',
          ),
          const SizedBox(height: 16),
          ReelButton(
            iconChild: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('assets/icon/BookmarkIcon.png'),
            ),
          ),
          const SizedBox(height: 16),
          ReelButton(
            iconChild: const Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
