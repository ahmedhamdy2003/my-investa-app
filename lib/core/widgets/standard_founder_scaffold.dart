import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/search_text_field.dart';

class StandardFounderScaffold extends StatelessWidget {
  StandardFounderScaffold({
    super.key,
    required this.isMain,
    required this.title,
    this.body,
    required this.screenType,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool isMain;
  final String title;
  final Widget? body;
  final FounderSideMenuScreen screenType;
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: FounderSideBar(currentScreen: screenType),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: topPadding),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  FounderTopSection(
                    isMain: isMain,
                    onTap: () {
                      // Scaffold.of(context).openDrawer();
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    title: title,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SearchTextField(hintText: 'Search for something'),
                  ),
                ],
              ),
            ),
            if (body != null) ...[body!],
          ],
        ),
      ),
    );
  }
}

class FounderTopSection extends StatelessWidget {
  const FounderTopSection({
    super.key,
    this.onTap,
    required this.title,
    required this.isMain,
  });
  final Function()? onTap;
  final String title;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hamburger menu icon
        const SizedBox(width: 20),
        InkWell(
          onTap: onTap,
          child: const Icon(Icons.menu, color: sideMenuColor, size: 24),
        ),

        // Spacer to center the logo
        // const Spacer(),

        // Title or logo text
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: isMain ? 0 : 15),
            child: Center(
              child: Text(
                title,
                style: AppStyles.founderTopTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        // const SizedBox(width: 25),
        // Spacer to balance the layout (same as the menu icon width)
        // const Spacer(),
        if (isMain)
          const CircleAvatar(radius: 20, child: Icon(Icons.person))
        else
          const SizedBox.shrink(),
        const SizedBox(width: 20),
      ],
    );
  }
}
