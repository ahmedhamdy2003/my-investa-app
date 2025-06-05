import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<List<ProjectROI>?> getInvestedProject() async {
  String url =
      '$baseUrl/dashboard/invested-projects/${ManageCurrentUser.currentUser.guid}/';
  // late Reel reell;
  try {
    var response = await ApiClient.getData(url);
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        // if (response.containsKey('error')) {
        //   showDebugSnackBar(response['error'], navigatorKey.currentContext!);
        //   return null;
        // }
        if (response is List) {
          showDebugSnackBar(
            'Category percentages fetched',
            navigatorKey.currentContext!,
          );
          return ProjectROI.fromList(response);
        } else if (response is String) {
          Map<String, dynamic> categoryPercentages = {};
          try {
            // Attempt to parse the string as JSON
            categoryPercentages = Map<String, dynamic>.from(
              jsonDecode(response) as Map,
            );
            showDebugSnackBar(
              'Category percentages fetched from string',
              navigatorKey.currentContext!,
            );
            return ProjectROI.fromList(categoryPercentages['data'] ?? []);
          } catch (e) {
            showDebugSnackBar(
              'Error parsing JSON: $e',
              navigatorKey.currentContext!,
            );
            return null;
          }
        } else {
          showDebugSnackBar(
            'Unexpected response format',
            navigatorKey.currentContext!,
          );
          return null;
        }
      } catch (e) {
        showDebugSnackBar(
          '### requestOtp error: $e',
          navigatorKey.currentContext!,
        );

        return null;
      }
    } else {
      showDebugSnackBar('requestOtp null', navigatorKey.currentContext!);
      return null;
    }
  } catch (e) {
    showDebugSnackBar('requestOtp error: $e', navigatorKey.currentContext!);
    return null;
  }
}

class ProjectROI {
  final String projectId;
  final String projectName;
  final double totalRoi;
  final double nextRoi;

  ProjectROI({
    required this.projectId,
    required this.projectName,
    required this.totalRoi,
    required this.nextRoi,
  });

  factory ProjectROI.fromJson(Map<String, dynamic> json) {
    return ProjectROI(
      projectId: json['project_id'] ?? '',
      projectName: json['project_name'] ?? '',
      totalRoi: (json['total_roi'] ?? 0).toDouble(),
      nextRoi: (json['next_roi'] ?? 0).toDouble(),
    );
  }

  static List<ProjectROI> fromList(List<dynamic> mapList) {
    return mapList.map((json) => ProjectROI.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'project_name': projectName,
      'total_roi': totalRoi,
      'next_roi': nextRoi,
    };
  }
}
