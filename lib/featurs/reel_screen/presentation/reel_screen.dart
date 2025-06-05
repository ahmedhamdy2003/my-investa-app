import 'package:flutter/material.dart';
import 'package:investa4/featurs/reel_screen/manager/manage_comment_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/bottom_navigator.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/comment_section/presentation/comment_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/side_button.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/top_section.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  late ManageCommentAnimation manageCommentAnimation;
  @override
  void initState() {
    super.initState();
    manageCommentAnimation = ManageCommentAnimation();
  }

  @override
  void dispose() {
    manageCommentAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.green[300],
                child: const Center(
                  child: Text(
                    'Video Player Placeholder',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            TopSection(),
            SideBottonsBar(manageCommentAnimation: manageCommentAnimation),
            BottomNavigation(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CommentScreen(
                manageCommentAnimation: manageCommentAnimation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
