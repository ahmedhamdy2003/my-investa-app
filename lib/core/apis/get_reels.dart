import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<List?> getReels({required String email, required String otp}) async {
  String url = '$baseUrl/get-reels/';
  // final header = <String, dynamic>{'Content-Type': 'application/json'};

  // FormData body = FormData();
  // body.fields.addAll([
  //   MapEntry('email', email),
  //   MapEntry('otp', otp),
  // ]);

  // Map<String, dynamic> body = {
  //   'email': email,
  //   'otp': otp,
  // };
  try {
    var response = await ApiClient.getData(
      url,
      // data: json.encode(body),
      // headers: header,
    );
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        if (response is List) {
          showDebugSnackBar(
            'getReels list fetched',
            navigatorKey.currentContext!,
          );
          // return SignResult.fromMap(response);
          return response;
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
