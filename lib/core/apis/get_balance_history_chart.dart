import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<List<FlSpot>?> getbalanceHistory() async {
  String url =
      '$baseUrl/balance-history/${ManageCurrentUser.currentUser.guid}/';
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
          return parseApiToFlSpots(response);
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
            return parseApiToFlSpots(categoryPercentages);
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

List<FlSpot> parseApiToFlSpots(Map<dynamic, dynamic> response) {
  final List<dynamic> months = response['months'] ?? [];
  final List<dynamic> amounts = response['amounts'] ?? [];

  // Ensure both lists are equal in length
  if (months.length != amounts.length) {
    // throw FormatException('Mismatched lengths: months and amounts');
    return [];
  }

  return List<FlSpot>.generate(months.length, (index) {
    final amount = double.tryParse(amounts[index].toString()) ?? 0.0;
    return FlSpot(index.toDouble(), amount);
  });
}
