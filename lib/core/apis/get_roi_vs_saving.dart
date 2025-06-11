import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<RoiVsSaving?> getRoiVsSaving() async {
  String url = '$baseUrl/roi-vs-saving/${ManageCurrentUser.currentUser.guid}/';
  // late Reel reell;
  try {
    var response = await ApiClient.getData(url);
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        if (response.containsKey('error')) {
          showDebugSnackBar(response['error'], navigatorKey.currentContext!);
          return null;
        }
        if (response is Map) {
          showDebugSnackBar(
            'Category percentages fetched',
            navigatorKey.currentContext!,
          );
          return RoiVsSaving.fromMap(response);
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
            return RoiVsSaving.fromMap(categoryPercentages);
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

class RoiVsSaving {
  List<double> investing; // “Investing”
  List<double> saving; // “Saving”
  List<String> labels;
  RoiVsSaving({
    required this.investing,
    required this.saving,
    required this.labels,
  });

  factory RoiVsSaving.fromMap(Map<dynamic, dynamic> map) {
    return RoiVsSaving(
      investing: List<double>.from(map['investing'] ?? []),
      saving: List<double>.from(map['saving'] ?? []),
      labels: List<String>.from(map['months'] ?? []),
    );
  }
}
