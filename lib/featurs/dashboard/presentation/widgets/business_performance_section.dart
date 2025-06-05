import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/featurs/dashboard/manager/manage_dashboard.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dasboard_items.dart';

class BusinessPerformanceSection extends StatelessWidget {
  const BusinessPerformanceSection({super.key, required this.manageDashboard});
  final ManageDashboard manageDashboard;
  @override
  Widget build(BuildContext context) {
    return manageDashboard.investedProjects.isEmpty
        ? const SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Business Performance ', style: AppStyles.vsTitleStyle),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     children: [
            //       DasboardItems(
            //         title: 'Zerosugar by ketonista  ',
            //         subTitle: 'Started investing since →  1-1-2025 ',
            //       ),
            //       DasboardItems(
            //         title: 'total WWW',
            //         subTitle: 'Since 1 January 2025',
            //         trailingText: '12.322 LE',
            //         trailGreen: true,
            //       ),
            //       DasboardItems(
            //         title: 'NEXT w',
            //         subTitle: 'short',
            //         trailingText: 'short',
            //         trailGreen: true,
            //       ),
            //       DasboardItems(
            //         title: 'Businesses you Invested in ',
            //         subTitle: 'Zero sugar by ketonista - Fakhr ',
            //         // trailingText: '12.322 LE',
            //       ),
            //     ],
            //   ),
            // ),
            ...manageDashboard.investedProjects.map((project) {
              return Column(
                children: [
                  Text(
                    '${project.projectName} Performance ',
                    style: AppStyles.vsTitleStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        DasboardItems(
                          normalTrailingText: true,
                          title: '${project.projectName}  ',
                          subTitle: 'Started investing since →  1-1-2025 ',
                        ),
                        DasboardItems(
                          normalTrailingText: true,
                          title: 'total ROI',
                          subTitle: 'Since 1 January 2025',
                          trailingText: '${project.totalRoi} LE',
                          trailGreen: true,
                        ),
                        DasboardItems(
                          normalTrailingText: true,
                          title: 'NEXT ROI',
                          subTitle: 'Since 1 April 2025',
                          trailingText: '${project.nextRoi} LE',
                          trailGreen: true,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ), // Circular border
                                    ),
                                    backgroundColor:
                                        Colors.white, // White background
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          DasboardItems(
                                            normalTrailingText: true,
                                            title: 'Contact with founder Team',
                                            subTitle:
                                                'contact with ${project.projectName}',
                                            // trailingText: '12.322 LE',
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            "To reach the team , you can use the  community to be connected to Zero sugar by ketonista .Either if you need investa team you can reach us throughout the support from the Profile .  ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: sectionsColor,
                                            ),
                                          ),
                                          SizedBox(height: 24),
                                        ],
                                      ),
                                    ),
                                  ),
                            );
                          },
                          child: DasboardItems(
                            normalTrailingText: true,
                            title: 'Contact with founder Team',
                            subTitle: 'click here',
                            // trailingText: '12.322 LE',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        );
  }
}
