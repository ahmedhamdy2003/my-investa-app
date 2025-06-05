// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<SignResult?> login({
  required String email,
  required String password,
}) async {
  String url = '$baseUrl/sign-in/';
  final header = <String, dynamic>{'Content-Type': 'application/json'};

  // FormData body = FormData();
  // body.fields.addAll([
  //   MapEntry('email', email),
  //   MapEntry('otp', otp),
  // ]);

  Map<String, dynamic> body = {'email': email, 'password': password};
  try {
    var response = await ApiClient.postData(
      url,
      data: json.encode(body),
      headers: header,
    );
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        if (response.containsKey('message')) {
          showSnackBar(response['message'], navigatorKey.currentContext!);
          return SignResult.fromMap(response);
        } else if (response.containsKey('error')) {
          showDebugSnackBar(response['error'], navigatorKey.currentContext!);
          return null;
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

class SignResult {
  String message;
  String token;
  String refreshToken;
  String userId;
  String email;
  DateTime dateOffBirth;
  String userNAme;
  SignResult({
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.userId,
    required this.email,
    required this.dateOffBirth,
    required this.userNAme,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'token': token,
      'refreshToken': refreshToken,
      'userId': userId,
      'email': email,
      'date_of_birth': dateOffBirth.toIso8601String(),
      'username': userNAme,
    };
  }

  factory SignResult.fromMap(Map<String, dynamic> map) {
    return SignResult(
      message: map['message'] as String,
      token: map['idToken'] as String,
      refreshToken: map['refreshToken'] as String,
      userId: map['user_id'] as String,
      email: map['email'] as String,
      dateOffBirth: DateTime.parse(map['date_of_birth'] as String),
      userNAme: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignResult.fromJson(String source) =>
      SignResult.fromMap(json.decode(source) as Map<String, dynamic>);
}
