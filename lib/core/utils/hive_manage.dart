// lib/core/utils/hive_manager.dart

import 'package:hive/hive.dart';
import 'package:investa4/core/model/user.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  // Name of the box(s) you’ll use
  static const String _userBoxName = 'users';

  /// Call this once (e.g. from main()) before using any Hive operations.
  static Future<void> init() async {
    // Ensure Flutter bindings are initialized (needed for getApplicationDocumentsDirectory).
    // WidgetsFlutterBinding.ensureInitialized();

    // 1) Get the directory where Hive files will be stored.
    final appDocDir = await getApplicationDocumentsDirectory();

    // 2) Initialize Hive with that path
    Hive.init(appDocDir.path);

    // 3) Register all adapters here—in this case, UserModelAdapter
    Hive.registerAdapter(UserModelAdapter());

    // 4) Open the box(es) you’ll need. You can open multiple boxes if desired.
    await Hive.openBox<UserModel>(_userBoxName);
  }

  /// Shortcut getter to access the 'users' box anywhere in your app.
  static Box<UserModel> get userBox => Hive.box<UserModel>(_userBoxName);

  /// If you ever want to close all open boxes (e.g. on app exit), call this.
  static Future<void> closeAll() async {
    await Hive.close();
  }
}
