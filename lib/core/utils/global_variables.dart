import 'package:flutter/material.dart';

ValueNotifier<bool> rebuildForgetPasswordWidget = ValueNotifier<bool>(true);
bool debugging = true;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String baseUrl = 'https://bcb8-102-190-139-157.ngrok-free.app';  