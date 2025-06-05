// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<bool> requestOtp(RequestOtp userData) async {
  String url = '$baseUrl/request-otp/';
  Map<String, String> header = {'Content-Type': 'application/json'};
  try {
    var response = await ApiClient.postData(
      url,
      data: json.encode(userData.toMap()),
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
    log('requestOtp error: $e');
    showDebugSnackBar('requestOtp error: $e', navigatorKey.currentContext!);
    return false;
  }
}

class RequestOtp {
  String email;
  String password;
  String full_name;
  // String gender;
  // String national_id;
  // int phone;
  DateTime date_of_birth;

  RequestOtp({
    required this.email,
    required this.password,
    required this.full_name,
    // required this.gender,
    // required this.national_id,
    // required this.phone,
    required this.date_of_birth,
  });
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': full_name,
      // 'gender': gender,
      // 'national_id': national_id,
      // 'phone': phone,
      'date_of_birth': date_of_birth.toIso8601String(),
    };
  }

  factory RequestOtp.fromMap(Map<String, dynamic> json) {
    return RequestOtp(
      email: json['email'],
      password: json['password'],
      full_name: json['full_name'],
      // gender: json['gender'],
      // national_id: json['national_id'],
      // phone: json['phone'],
      date_of_birth:
          json['date_of_birth'] != null
              ? DateTime.parse(json['date_of_birth'])
              : DateTime.now(),
    );
  }
}
