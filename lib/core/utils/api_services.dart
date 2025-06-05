import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient();
  factory ApiClient() => _instance;
  static late Dio dio;
  static init() {
    dio = Dio();
  }

  static Future<T?> getData<T>(
    String url, {
    ResponseType responseType = ResponseType.json, // Default to JSON
    Map<String, dynamic>? headers, // Optional custom headers
    Map<String, dynamic>? queryParameters, // Optional query parameters
  }) async {
    try {
      Response response = await dio.get(
        url,
        options: Options(responseType: responseType, headers: headers),
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        // Handle different response types
        if (responseType == ResponseType.bytes && response.data is Uint8List) {
          return response.data as T;
        } else if (responseType == ResponseType.json) {
          return response.data as T;
        } else if (responseType == ResponseType.plain) {
          return response.data.toString() as T;
        } else {
          log('getData API: Unsupported response type');
          return null;
        }
      } else if (response.statusCode == 401) {
        log('getData API: Unauthorized status code');
        showDebugSnackBar(
          'Unauthorized operation',
          navigatorKey.currentContext!,
        );
        return null;
      } else {
        log('getData API: Unexpected status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('getData API Error: $e');
      return null;
    }
  }

  static Future<T?> postData<T>(
    String url, {
    dynamic data,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(
          responseType: responseType,
          headers: headers,
          validateStatus: (status) => true,
        ),
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseType == ResponseType.bytes && response.data is Uint8List) {
          return response.data as T;
        } else if (responseType == ResponseType.json) {
          return response.data as T;
        } else if (responseType == ResponseType.plain) {
          return response.data.toString() as T;
        } else {
          log('postData: Unsupported response type');
          return null;
        }
      } else if (response.statusCode == 401) {
        log('postData API: Unauthorized status code');
        showDebugSnackBar(
          'postData response Unauthorized operation',
          navigatorKey.currentContext!,
        );
        return null;
      } else if (response.statusCode == 400) {
        log('postData API: 400 error');
        showDebugSnackBar(
          'postData response error ${response.data}',
          navigatorKey.currentContext!,
        );
        return null;
      } else if (response.statusCode == 403) {
        log('postData API: 403 error');
        if (response.data.containsKey('message')) {
          showDebugSnackBar(
            'postData response ${response.data['message']}',
            navigatorKey.currentContext!,
          );
        } else {
          showDebugSnackBar(
            'response error ${response.data['error']}',
            navigatorKey.currentContext!,
          );
        }
        return null;
      } else if (response.statusCode == 404) {
        log('postData API: 404 error');
        showDebugSnackBar(
          'postData response error ${response.data}',
          navigatorKey.currentContext!,
        );
        return null;
      } else {
        log(
          'postData: Unexpected status code: ${response.statusCode} data ${response.data}',
        );
        return null;
      }
    } catch (e) {
      log('postData Error: $e');
      showDebugSnackBar('postData Error: $e', navigatorKey.currentContext!);
      return null;
    }
  }
}
