// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<FounderOverview?> getFounderOverView() async {
  String url =
      '$baseUrl/founder/dashboard/overview/${ManageCurrentUser.currentUser.guid}/';
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
          return FounderOverview.fromMap(response);
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
            return FounderOverview.fromMap(categoryPercentages);
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

class FounderOverview {
  int totalInvested;
  int number_off_investores;
  int revenue;
  int realized_profit;
  FounderOverview({
    required this.totalInvested,
    required this.number_off_investores,
    required this.revenue,
    required this.realized_profit,
  });

  factory FounderOverview.fromMap(Map<dynamic, dynamic> map) {
    return FounderOverview(
      totalInvested: map['total_invested_amount'] ?? 0,
      number_off_investores: map['number_of_investors'] ?? 0,
      revenue: map['revenue'] ?? 0,
      realized_profit: map['realized_profit'] ?? 0,
    );
  }
}
