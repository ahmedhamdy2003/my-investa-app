import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:investa4/core/utils/hive_manage.dart';
import 'package:investa4/core/utils/manage_current_user.dart';

part 'user.g.dart'; // Generated adapter

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  // 0: integer ID (auto‑increment)
  @HiveField(0)
  int id;

  // 1: GUID (still useful if you need a stable string key)
  @HiveField(1)
  String guid;

  // 2: username
  @HiveField(2)
  String username;

  // 3: email
  @HiveField(3)
  String email;

  // 4: birthdate
  @HiveField(4)
  DateTime? birthdate;

  // 5: signedUp flag
  @HiveField(5)
  bool signedUp;

  @HiveField(6)
  bool? userIsFounder;

  UserModel({
    this.id = 0,
    required this.guid,
    required this.username,
    required this.email,
    this.birthdate,
    this.signedUp = false,
  });

  String? get token => null;
}

class UserMethods {
  // static Box<UserModel> get userBox => Hive.box<UserModel>('users');
  static bool? userIsFounder() {
    final user = HiveManager.userBox.get(ManageCurrentUser.currentUser.guid);
    if (user != null) {
      return user.userIsFounder;
    }
    return null;
  }

  static Future<void> setUserisFounder(bool isFounder) async {
    final user = HiveManager.userBox.get(ManageCurrentUser.currentUser.guid);
    if (user != null) {
      user.userIsFounder = isFounder;
      await user.save();
    }
  }

  static UserModel? getSignedUser() {
    try {
      if (HiveManager.userBox.isEmpty ||
          HiveManager.userBox.values.every((user) => user.signedUp == false)) {
        return null; // No users signed up
      }
      return HiveManager.userBox.values.firstWhere(
        (user) => user.signedUp,
        // orElse: () => null,
      );
    } on Exception catch (e) {
      log('Error fetching signed user: $e');
      return null;
    }
  }

  static void removeSignedUser(UserModel user) {
    user.signedUp = false;
    user.save();
  }

  static Future<void> saveUser(UserModel user) async {
    await HiveManager.userBox.put(user.guid, user);
  }

  static Future<void> updateUser(UserModel user) async {
    await user.save();
  }

  static List<UserModel> getAllUsers() {
    return HiveManager.userBox.values.toList();
  }

  static UserModel? getUserById(int index) {
    return HiveManager.userBox.getAt(
      index,
    ); // Use index since Hive keys are dynamic
  }

  static UserModel? getUserByGuid(String guid) {
    return HiveManager.userBox.get(guid);
  }

  static Future<void> deleteUser(String guid) async {
    await HiveManager.userBox.delete(guid);
  }

  static Future<void> deleteAllUsers() async {
    await HiveManager.userBox.clear();
  }

  static Future<bool> updateSignUpStatus(String guid, bool status) async {
    final user = HiveManager.userBox.get(guid);
    if (user != null) {
      user.signedUp = status;
      await user.save();
      return true;
    }
    return false;
  }

  static List<UserModel> searchByUsername(String keyword) {
    return HiveManager.userBox.values
        .where(
          (user) => user.username.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }
}
