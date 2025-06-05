import 'package:flutter/material.dart';
import 'package:investa4/core/utils/api_services.dart';
import 'package:investa4/core/utils/hive_manage.dart';
import 'package:investa4/investa_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();
  await HiveManager.init();
  runApp(const InvestaApp());
}
