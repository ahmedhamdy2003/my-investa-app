import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/search_text_field.dart';
import 'package:investa4/core/widgets/shared_top_section.dart';

class TransactionTopSection extends StatelessWidget {
  const TransactionTopSection({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SharedTopSection(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchTextField(hintText: 'Search for a Transaction'),
          ),
        ],
      ),
    );
  }
}
