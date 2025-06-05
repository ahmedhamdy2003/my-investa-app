import 'package:dio/dio.dart';
import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<String?> verifyOtp({required String email, required String otp}) async {
  String url = '$baseUrl/verify-otp/';
  final header = <String, dynamic>{'Content-Type': 'multipart/form-data'};

  FormData body = FormData();
  body.fields.addAll([MapEntry('email', email), MapEntry('otp', otp)]);

  try {
    var response = await ApiClient.postData(url, data: body, headers: header);
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        if (response.containsKey('message')) {
          showSnackBar(response['message'], navigatorKey.currentContext!);
          return response['user_id'] as String?;
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
