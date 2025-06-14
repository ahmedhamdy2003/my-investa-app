// import 'dart:convert';

// import 'package:investa4/core/utils/api_services.dart';
// import 'package:investa4/core/utils/global_variables.dart';
// import 'package:investa4/core/utils/manage_current_user.dart';
// import 'package:investa4/core/widgets/show_snackbar.dart';
// import 'package:investa4/core/widgets/single_line_chart.dart';

// Future<List<CustomLineChartData>?> getFounderPortfolioPerformance() async {
//   String url =
//       '$baseUrl/founder/dashboard/portfolio-performance/${ManageCurrentUser.currentUser.guid}/';
//   // late Reel reell;
//   try {
//     var response = await ApiClient.getData(url);
//     if (response != null) {
//       showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
//       try {
//         if (response.containsKey('error')) {
//           showDebugSnackBar(response['error'], navigatorKey.currentContext!);
//           return null;
//         }
//         if (response is Map) {
//           showDebugSnackBar(
//             'Category percentages fetched',
//             navigatorKey.currentContext!,
//           );
//           return CustomLineChartData.fromApiMap(response);
//         } else if (response is String) {
//           Map<String, dynamic> categoryPercentages = {};
//           try {
//             // Attempt to parse the string as JSON
//             categoryPercentages = Map<String, dynamic>.from(
//               jsonDecode(response) as Map,
//             );
//             showDebugSnackBar(
//               'Category percentages fetched from string',
//               navigatorKey.currentContext!,
//             );
//             // return DounderPortfolioPerformance.fromMap(categoryPercentages);
//             return CustomLineChartData.fromApiMap(categoryPercentages);
//           } catch (e) {
//             showDebugSnackBar(
//               'Error parsing JSON: $e',
//               navigatorKey.currentContext!,
//             );
//             return null;
//           }
//         } else {
//           showDebugSnackBar(
//             'Unexpected response format',
//             navigatorKey.currentContext!,
//           );
//           return null;
//         }
//       } catch (e) {
//         showDebugSnackBar(
//           '### requestOtp error: $e',
//           navigatorKey.currentContext!,
//         );

//         return null;
//       }
//     } else {
//       showDebugSnackBar('requestOtp null', navigatorKey.currentContext!);
//       return null;
//     }
//   } catch (e) {
//     showDebugSnackBar('requestOtp error: $e', navigatorKey.currentContext!);
//     return null;
//   }
// }

// // class DounderPortfolioPerformance {
// //   final dynamic data;

// //   DounderPortfolioPerformance({required this.data});

// //   factory DounderPortfolioPerformance.fromMap(Map<dynamic, dynamic> map) {
// //     return DounderPortfolioPerformance(data: map['data'] ?? []);
// //   }
// // }


// // response
// // {
// //     "Jul": 1030.0,
// //     "Aug": 12520.0,
// //     "May": 1500.0,
// //     "Apr": 1500.0,
// //     "Jun": 2100.0,
// //     "Oct": 1100.0,
// //     "Sep": 10000.0,
// //     "Feb": 10000.0,
// //     "Mar": 10000.0
// // }