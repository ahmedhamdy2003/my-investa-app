import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/featurs/reel_screen/manager/manage_comment_screen.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/comment_section/presentation/widgets/comment_list_view.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/comment_section/presentation/widgets/comment_text_field.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.manageCommentAnimation});
  final ManageCommentAnimation manageCommentAnimation;
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    log('custom drawer init');
    super.initState();
    widget.manageCommentAnimation.animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    widget.manageCommentAnimation.animation = Tween<Offset>(
      begin: const Offset(0, 10), // Starts above the screen
      end: const Offset(0, 0), // Fully visible at the top
    ).animate(
      CurvedAnimation(
        parent: widget.manageCommentAnimation.animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SlideTransition(
      position: widget.manageCommentAnimation.animation,
      child: Stack(
        children: [
          InkWell(
            onTap: () => widget.manageCommentAnimation.closeDrawer(),
            child: Container(
              height: size.height,
              // color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height * .7,
              child: Container(
                decoration: BoxDecoration(
                  color: commentBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Center(
                        child: Text(
                          '579 comments',
                          style: AppStyles.commentCountStyle,
                        ),
                      ),
                    ),
                    Expanded(child: CommentListView()),
                    CommentTextField(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
