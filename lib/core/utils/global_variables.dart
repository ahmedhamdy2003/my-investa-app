import 'package:flutter/material.dart';

ValueNotifier<bool> rebuildForgetPasswordWidget = ValueNotifier<bool>(true);
bool debugging = true;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String baseUrl =
    'https://0ad5-2c0f-fc89-a3-52b5-45a7-133-6422-1d1c.ngrok-free.app';
