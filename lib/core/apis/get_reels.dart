import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/show_snackbar.dart';

Future<List<Reel>?> getReels() async {
  String url = '$baseUrl/get-reels/';
  // late Reel reell;
  try {
    var response = await ApiClient.getData(url);
    if (response != null) {
      showDebugSnackBar(response.toString(), navigatorKey.currentContext!);
      try {
        // if (response is List) {
        //   showDebugSnackBar(
        //     'getReels list fetched',
        //     navigatorKey.currentContext!,
        //   );
        //   // return SignResult.fromMap(response);
        //   return response;
        // } else
        if (response.containsKey('error')) {
          showDebugSnackBar(response['error'], navigatorKey.currentContext!);
          return null;
        }
        // else {
        //   showDebugSnackBar(
        //     'Unexpected response format',
        //     navigatorKey.currentContext!,
        //   );
        //   return null;
        // }
        ReelsResponse reelsResponse = ReelsResponse.fromJson(response);
        showDebugSnackBar(
          'Reels fetched: ${reelsResponse.reels.length}',
          navigatorKey.currentContext!,
        );
        return reelsResponse.reels;
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

class ReelsResponse {
  final List<Reel> reels;

  ReelsResponse({required this.reels});

  factory ReelsResponse.fromJson(Map<String, dynamic> json) {
    final rawList = json['reels'] as List<dynamic>? ?? [];
    final reels = rawList.map((e) => Reel.fromJson(e)).toList();
    return ReelsResponse(reels: reels);
  }

  Map<String, dynamic> toJson() => {
    'reels': reels.map((r) => r.toJson()).toList(),
  };
}

class Reel {
  final String reelId;
  final List<String> videoUrls;

  Reel({required this.reelId, required this.videoUrls});

  factory Reel.fromJson(Map<String, dynamic> json) {
    final reelId = json['reel_id'] as String;
    final List<String> urls = [];

    json.forEach((key, value) {
      if (key != 'reel_id' && value is Map<String, dynamic>) {
        final url = value['video_url'];
        if (url != null) urls.add(url);
      }
    });

    return Reel(reelId: reelId, videoUrls: urls);
  }

  Map<String, dynamic> toJson() => {'reel_id': reelId, 'video_urls': videoUrls};
}
