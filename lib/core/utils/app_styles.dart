import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';

class AppStyles {
  static TextStyle mainText = const TextStyle(
    color: mainTextColor, // Color.fromARGB(255, 89, 123, 158),
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainText16Regulat = const TextStyle(
    color: mainTextColor, // Color.fromARGB(255, 89, 123, 158),
    fontSize: 16,
  );
  static TextStyle mainText20 = const TextStyle(
    color: mainTextColor, // Color.fromARGB(255, 89, 123, 158),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle passValStyle = const TextStyle(
    color: passwordValidTectColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle commentCountStyle = const TextStyle(
    color: commentCountColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonTextSyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle commentHintStyle = const TextStyle(
    color: commentTextFieldHintColor,
    fontSize: 15,
    // fontWeight: FontWeight.bold,
  );
  static TextStyle commentuserNameStyle = const TextStyle(
    color: commentTextFieldHintColor,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static TextStyle simiBold16White = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(color: Colors.black, offset: Offset(.1, .1), blurRadius: 2),
    ],
  );

  static TextStyle blackStyle = const TextStyle(color: Colors.black);

  static TextStyle text19 = const TextStyle(
    color: text202020Color,
    fontSize: 19,
  );
  static TextStyle text15 = const TextStyle(
    color: text202020Color,
    fontSize: 15,
  );
  static TextStyle text14black = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headerText = const TextStyle(
    color: mainTextColor,
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dashMainTitle = const TextStyle(
    color: sectionsColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle vsTitleStyle = const TextStyle(
    color: sectionsColor,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle sectionsTitle24 = const TextStyle(
    color: sectionsColor,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle dashItemTitle = const TextStyle(
    color: dashboardItemsTitleColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle tableDataStyle = const TextStyle(
    color: dashboardItemsTitleColor,
    fontSize: 10,
    // fontWeight: FontWeight.w500,
  );
  static TextStyle dashISubtemTitle = const TextStyle(
    color: dashboardItemsSubTitleColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dashItemgreenTraining = const TextStyle(
    color: dashboardItemsTrailingreenColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dashItemRedTraining = const TextStyle(
    color: dashboardItemsTrailingRedColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dashItemNormalTraining = const TextStyle(
    color: sectionsColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle investmentItemTitle = const TextStyle(
    color: dashboardItemsTitleColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle investmentISubtemTitle = const TextStyle(
    color: dashboardItemsSubTitleColor,
    fontSize: 12,
  );
  static TextStyle investmentItemTrailing = const TextStyle(
    color: mainTextColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle invistaTopSectionStyle = const TextStyle(
    color: mainTextColor,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle sideMenuStyle = const TextStyle(
    color: mainTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle founderTopTitle = const TextStyle(
    color: founderTopSectionTitleColor,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static TextStyle founderISubtemTitle = const TextStyle(
    color: dashboardItemsSubTitleColor,
    fontSize: 12,
  );

  static TextStyle founderDashItemTitle = const TextStyle(
    color: founderdashboardItemsTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle financeSectionTitle = const TextStyle(
    color: founderTopSectionTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );
  static TextStyle founderAnalysisSectionTitle1 = const TextStyle(
    color: founderAnalysisTitle1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle founderTransactionSectionTitle1 = const TextStyle(
    color: founderTransactionSectionTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle solidChartLabels = const TextStyle(
    color: Color(0xFF718EBF),
    fontSize: 12,
    // fontWeight: FontWeight.w600,
  );
  static TextStyle solidChartTitle = const TextStyle(
    color: Color(0xFF333B69),
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}

Shadow textShadow() {
  return const Shadow(
    color: Colors.black,
    offset: Offset(.1, .1),
    blurRadius: 2,
  );
}
