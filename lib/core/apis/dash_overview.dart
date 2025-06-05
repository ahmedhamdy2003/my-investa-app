import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/utils/manage_current_user.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<DashOverView?> getDashOverView() async {
  String url =
      '$baseUrl/dashboard/overview/${ManageCurrentUser.currentUser.guid}/';
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
          return DashOverView.fromMap(response);
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
            return DashOverView.fromMap(categoryPercentages);
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

class DashOverView {
  final double totalInvestment;
  final double totalCurrentNetProfit;
  final List<String> investmentTypes;
  final List<BusinessInvestment> businessesInvestedIn;

  DashOverView({
    required this.totalInvestment,
    required this.totalCurrentNetProfit,
    required this.investmentTypes,
    required this.businessesInvestedIn,
  });

  factory DashOverView.fromMap(Map map) {
    return DashOverView(
      totalInvestment: (map['total_investment'] ?? 0).toDouble(),
      totalCurrentNetProfit: (map['total_current_net_profit'] ?? 0).toDouble(),
      investmentTypes: List<String>.from(map['investment_types'] ?? []),
      businessesInvestedIn:
          (map['businesses_invested_in'] as List<dynamic>? ?? [])
              .map((item) => BusinessInvestment.fromJson(item))
              .toList(),
    );
  }
}

class BusinessInvestment {
  final String name;
  final double amount;

  BusinessInvestment({required this.name, required this.amount});

  factory BusinessInvestment.fromJson(Map<String, dynamic> json) {
    return BusinessInvestment(
      name: json['name'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
    );
  }
}
