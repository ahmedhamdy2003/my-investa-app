// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<bool> sendResetLink(String email) async {
  String url = '$baseUrl/send-reset-link/';
  Map<String, String> header = {'Content-Type': 'application/json'};
  try {
    var response = await ApiClient.postData(
      url,
      data: json.encode({'email': email}),
      headers: header,
    );
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        if (response.containsKey('message')) {
          showSnackBar(response['message'], navigatorKey.currentContext!);
          return true;
        } else if (response.containsKey('error')) {
          showDebugSnackBar(response['error'], navigatorKey.currentContext!);
          return false;
        } else {
          showDebugSnackBar(
            'requestOtp Unexpected response format',
            navigatorKey.currentContext!,
          );
          return false;
        }
      } catch (e) {
        showDebugSnackBar(
          '### requestOtp error: $e',
          navigatorKey.currentContext!,
        );

        return false;
      }
    } else {
      showDebugSnackBar('requestOtp null', navigatorKey.currentContext!);
      return false;
    }
  } catch (e) {
    showDebugSnackBar('requestOtp error: $e', navigatorKey.currentContext!);
    return false;
  }
}
