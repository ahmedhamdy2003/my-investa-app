import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none, // Removes the default underline
            enabledBorder:
                InputBorder.none, // Removes underline when not focused
            focusedBorder: InputBorder.none, // Removes underline when focused
            suffixIcon: InkWell(
              onTap: () {},
              child: Image.asset('assets/icon/atsign.png'),
            ),
            hintText: 'Add comment...',
            hintStyle: AppStyles.commentHintStyle,
          ),
        ),
      ),
    );
  }
}
