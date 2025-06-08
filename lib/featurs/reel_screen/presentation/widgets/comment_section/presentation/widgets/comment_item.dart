import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class CommentItem extends StatelessWidget {
  final String? profileImageUrl;
  final String username;
  final String comment;
  final String timeAgo;
  final int repliesCount;

  const CommentItem({
    super.key,
    this.profileImageUrl,
    required this.username,
    required this.comment,
    required this.timeAgo,
    required this.repliesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile avatar
          profileImageUrl == null
              ? const CircleAvatar(radius: 18, child: Icon(Icons.person))
              : CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl!),
              ),
          const SizedBox(width: 10),

          // Comment details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username
                Text(username, style: AppStyles.commentuserNameStyle),
                // Comment text
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          // Provide a default style for the whole RichText:
                          style: AppStyles.text14black,
                          children: [
                            // Main comment text:
                            TextSpan(text: comment),
                            // "22h" text with a different style:
                            TextSpan(
                              text: ' 22h',
                              style: AppStyles.commentHintStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Time & replies row
                InkWell(
                  onTap: () {
                    // Handle reply navigation or expansion
                  },
                  child: Text(
                    'View replies ($repliesCount)',
                    style: AppStyles.commentuserNameStyle,
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
