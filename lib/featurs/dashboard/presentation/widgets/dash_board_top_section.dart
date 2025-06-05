import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/search_text_field.dart';
import 'package:investa4/core/widgets/shared_top_section.dart';

class DashBoardTopSection extends StatelessWidget {
  const DashBoardTopSection({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedTopSection(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: SearchTextField(
            hintText: 'Search for businesses you investment in',
          ),
        ),
      ],
    );
  }
}
