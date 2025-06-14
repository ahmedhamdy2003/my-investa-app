import 'package:flutter/material.dart';
import 'package:investa4/featurs/reel_screen/presentation/widgets/comment_section/presentation/widgets/comment_item.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: const [
          const CommentItem(
            username: 'martini_rond',
            comment: 'How neatly I write the date in my book',
            timeAgo: '22h',
            repliesCount: 4,
          ),
          const CommentItem(
            username: 'john_doe',
            comment: 'This is a great video!',
            timeAgo: '1d',
            repliesCount: 2,
          ),
          // const CommentItem(
          //   username: 'jane_smith',
          //   comment: 'Loved the content, keep it up!',
          //   timeAgo: '3d',
          //   repliesCount: 0,
          // ),
        ],
      ),
      // ListView.builder(
      //   itemBuilder:
      //       (_, index) => const CommentItem(
      //         username: 'martini_rond',
      //         comment: 'How neatly I write the date in my book',
      //         timeAgo: '22h',
      //         repliesCount: 4,
      //       ),
      //   itemCount: 10,
      // ),
    );
  }
}
