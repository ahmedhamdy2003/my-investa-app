import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.hintText, this.onChanged});
  final String hintText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.grey[700],
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F4F8), // light pill‐shaped bg
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF8BA3CB)),
        prefixIcon: const Icon(Icons.search, color: dashboardItemsSubTitleColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
